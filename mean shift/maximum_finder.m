function [ m ] = maximum_finder( F, origo, nbhd_size, lambda, bandwidth, conv_threshold )

r = (nbhd_size-1)/2;
F = padarray(F, [r r], 'symmetric');

x = F(origo(1)+r, origo(2)+r, :);
x = reshape(x,[1 5]);

while 1
    origo = origo + r;
    nbhd = F(origo(1)-r:origo(1)+r , origo(2)-r:origo(2)+r, :);
    for i=1:nbhd_size
        for j=1:nbhd_size
            %if i==r+1 && j==r+1 break; end
            diff = reshape(nbhd(i,j,:),[1 5]) - x;
            K(i,j) = kernel_function(diff, lambda, bandwidth);
        end
    end
    m = sum(sum(K.*nbhd))/sum(sum(K));
    m = reshape(m, [1 5]);
    shift = m - x;
    x = m;
    origo = round(m(1:2));
    if norm(reshape(shift, [1 5]) ) < conv_threshold
        break;
    end
end

end

