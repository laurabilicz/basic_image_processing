function [ segmented_image ] = mean_shift( image_matrix, nbhd_size, lambda, bandwidth, conv_threshold )

[h,w,c] = size(image_matrix);
if c~=3
    return;
end

F = feature_extractor(image_matrix);


segmented_image = image_matrix;

for i=1:h
    for j=1:w
        origo = [i j];
        found_maximum = maximum_finder(F, origo, nbhd_size, lambda, bandwidth, conv_threshold);
        segmented_image(i,j,:) = found_maximum(3:5);
    end
end

end

