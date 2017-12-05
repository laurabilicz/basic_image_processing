function [ output_img ] = apply_wallis_operator( preprocessed_img, loc_mean, des_mean, loc_contrast, des_contrast, A_max, p )

[H, W] = size(preprocessed_img);

output_img = zeros(H,W);

for i=1:H
    for j=1:W   
        output_img(i,j) = (preprocessed_img(i,j) - loc_mean(i,j))*(A_max*des_contrast)/(A_max*loc_contrast(i,j)+des_contrast)+(p*des_mean+(1-p)*loc_mean(i,j));
    end
end

output_img = uint8(output_img);

end

