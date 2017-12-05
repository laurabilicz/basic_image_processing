function [ feature_matrix ] = feature_extractor( image_matrix )
[h,w,c] = size(image_matrix);
if c~=3
    error('szürke képekkel nem foglalkozom');
end

feature_matrix = zeros(h,w,5);
[Y, X] = meshgrid(1:w, 1:h);

feature_matrix(:,:,1) = X;
feature_matrix(:,:,2) = Y;
feature_matrix(:,:,3:5) = image_matrix;

end


