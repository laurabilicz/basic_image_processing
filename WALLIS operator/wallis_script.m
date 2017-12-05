img = imread('./AndreKertesz_Paris_ManOnBicycle_part.jpg');

radius = 4;

preprocessed = preprocess(img);
motion_kernel = fspecial('motion', 5, 10);
blurred = imfilter(preprocessed, motion_kernel, 'replicate');
loc_mean = compute_local_mean(blurred, radius);
loc_contrast = compute_local_contrast(blurred, loc_mean, radius);

des_mean = 128;
des_contrast = 100;
A_max = 4;
p = 0.2;

filtered = apply_wallis_operator( blurred, loc_mean, des_mean, loc_contrast, des_contrast, A_max, p );

subplot(1,3,1); imshow(img);
subplot(1,3,2); imshow(uint8(blurred));
subplot(1,3,3); imshow(filtered);
