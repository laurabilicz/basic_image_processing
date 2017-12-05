function [ preprocessed ] = preprocess( img )
    [H, W, C] = size(img);
    if C~=1
        preprocessed = rgb2gray(img);
    else
        preprocessed = img;
    end
    
    preprocessed = double(preprocessed);

end

