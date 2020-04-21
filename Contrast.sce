clc;
clear all;
fr1=imread('trees.tif');
fr2=rgb2gray(fr1)
fr2=fr2(:,:,1);
[r1 c1]=size(fr2);
fr=double(fr2);
a=100;
b=200;
v=25;
w=200;
l=v/a;
m=((w-v)/(b-a));
n=((255-w)/(255-b));
for i=1:r1
    for j=1:c1
        if(fr(i,j)>=0)&(fr(i,j)<a)
            s(i,j)=l*fr(i,j);
        elseif(fr(i,j)>=a)&(fr(i,j)<b)
            s(i,j)=(m*(fr(i,j)-a)+v);
        elseif(fr(i,j)>=b)&(fr(i,j)<255)
            s(i,j)=(n*(fr(i,j)-b)+w);
        end
    end
    
end
subplot(1,3,1)
title('original image');
imshow(fr1);
subplot(1,3,2)
title('Gray image');
imshow(fr2);
subplot(1,3,3)
title('Contrast image');
imshow(uint8(s));