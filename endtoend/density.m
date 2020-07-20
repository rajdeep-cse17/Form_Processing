function [dens]=density(z)
[r2,c2]=size(z);
dp=0;
for i=1:r2
    for j=1:c2
        if z(i,j)==0
            dp=dp+1;
        end
    end
end
dens=dp/(r2*c2);