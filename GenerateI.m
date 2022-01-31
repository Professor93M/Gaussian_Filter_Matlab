function [Output] = GenerateI(I, sigma, sz)

[x, y] = meshgrid(-sz:sz, -sz:sz);
M = size(x,1)-1;
N = size(y,1)-1;

Exp = -(x.^2+y.^2)/(2*sigma*sigma);
K = exp(Exp)/(2*pi*sigma*sigma);

for i = 1:size(I, 1) - M
    for j = 1:size(I, 2) - N
        Temp = I(i:i+M, j:j+M).*K;
        Output(i,j) = sum(Temp(:));
    end
end