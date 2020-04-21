clc;
clear all;
close;
A1=imread('C:\Program Files\MATLAB\R2014a\toolbox\images\imdata\pout.tif')
A=double(A1)

[r c]=size(A)
[nk]=zeros(256,1)
B=zeros(r,c)
for i=1:256
    j=find(A==i)
    nk(i)=length(j)
    end
n=1:256
scf(0)
plot2d3(n,nk)
pdf=nk/(r*c)
cdf(1)=pdf(1)
for i=2:256
    cdf(i)=cdf(i-1)+pdf(i)
end
Sk=round(255*cdf)
for i1=1:256
    j1=find(A==i1)
    B(j1)=Sk(i1)
end
n0=zeros(256,1)
for i=1:256
    j=find(B==i)
    n0(i)=length(j)
    end

scf(1)
n=1:256
plot2d3(n,n0)
figure
subplot(1,2,1)
 imshow(uint8(A1));
 title('input image');
subplot(1,2,2)
 imshow(uint8(B));
 title('equalized image');