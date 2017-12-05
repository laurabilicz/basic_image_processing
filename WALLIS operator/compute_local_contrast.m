function [ loc_contrast ] = compute_local_contrast( preprocessed_img, loc_mean, radius )

[H,W] = size(preprocessed_img);

loc_contrast = zeros(H,W);

preprocessed_img = double(padarray(preprocessed_img,[radius radius],'replicate','both'));
loc_mean = double(padarray(loc_mean,[radius radius],'replicate','both'));

for i=radius+1:H+radius
    for j=radius+1:W+radius
        tmp_preproc = preprocessed_img(i-radius:i+radius,j-radius:j+radius);
        tmp_mean = loc_mean(i-radius:i+radius,j-radius:j+radius);
        s = sum(sum((tmp_preproc - tmp_mean).^2));
        loc_contrast(i-radius,j-radius) = sqrt(s)/((radius*2 + 1)^2);
    end
end


end

