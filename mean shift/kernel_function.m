function [ K ] = kernel_function( a, lambda, bandwidth )

x = (a*transpose(a))/(bandwidth^2 );
if x <= lambda
    K = 1;
else 
    K = 0;
end


end

