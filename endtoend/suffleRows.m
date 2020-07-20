function [A]=suffleRows (B)
[r, ~]=size(B);
randomRowIndex=randperm(r);
A=B(randomRowIndex,:);
end