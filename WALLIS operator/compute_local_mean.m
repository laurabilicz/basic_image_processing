function [ loc_mean ] = compute_local_mean( preprocessed_img, radius )

[H,W] = size(preprocessed_img);

loc_mean = zeros(H,W);

preprocessed_img = double(padarray(preprocessed_img,[radius radius],'replicate','both'));

for i=radius+1:H+radius
    for j=radius+1:W+radius
        tmp = preprocessed_img(i-radius:i+radius,j-radius:j+radius);
        s = sum(sum(tmp));
        loc_mean(i-radius,j-radius) = s/((radius*2 + 1)^2);
    end
end

end

