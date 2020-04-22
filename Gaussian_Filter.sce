clc;
clear all;
fr1=imread('trees.tif');
fr2=rgb2gray(fr1)
fr2=fr2(:,:,1);
[r1 c1]=size(fr2);
fr=double(fr2);
y=fft2(fr);
x=double(fftshift(y));
subplot(1,3,1)
title('original image');
imshow(uint8(fr1));
subplot(1,3,2)
title('FFT image');
imshow(uint8(y));
subplot(1,3,3)
title('FFT shift image');
imshow(uint8(x));
d1=[30 50 100];
for k=1:3
    for i=1:r1
        for j=1:c1
            d(i,j)=sqrt(((i-(r1/2))^2)+((j-(c1/2))^2));
            h(i,j)=exp(-((d(i,j)^2)/(2*d1(k)*d1(k))));
        end
    end
    figure
    subplot(1,2,1)
    title('transfer function in 2D');
    imshow(uint8(255*h));
    subplot(1,2,2)
    title('transfer function in 3D');
    mesh(h);
    g=h.*x;
    z=ifft(g);
    figure
    subplot(1,2,1)
    title('Original image');
    imshow(uint8(fr1));
    subplot(1,2,2)
    title('IFFT image');
    imshow(uint8(z));
end
