clc;
clear all;
a=imread('color.jpg');
subplot(1,3,1);
title('Original image');
imshow(a);
b=rgb2gray(a);
c=im2double(b);
subplot(1,3,2);
title('Grayscale image');
imshow(b);
s=log1p(c);
x=255/(max(max(s)));
s1=x*s;
u=uint8(s1);
subplot(1,3,3);
title('logarithm image');
imshow(u);