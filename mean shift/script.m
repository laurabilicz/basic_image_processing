image_matrix = imread('./berry_resized.png');

nbhd_size = 9;
lambda = 10;
bandwidth = 21;
conv_threshold = 0.1;

segmented = mean_shift(image_matrix,  nbhd_size, lambda, bandwidth, conv_threshold );

subplot(1,2,1); imshow(image_matrix); 
subplot(1,2,2); imshow(segmented);