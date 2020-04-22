clc
clear 
close
c1=imread('coins.png')
a=imnoise(c1,'gaussian',0,0.1)
a=double(a)
[r c]=size(a)
padded = zeros(r+2,c+2);
b = zeros(r+2,c+2);
padded(2:r+1,2:c+1) = a;
a=padded
for i=1:r-1
    for j=1:c-1
        x=a(i:i+2,j:j+2)
        b(i+1,j+1)=prod(x)^(1/9); 
    end
end
subplot(1,3,1)
title('Orginal Image');
imshow(c1);
subplot(1,3,2)
title('Noise Image');
imshow(uint8(a));
subplot(1,3,3)
title('Output Image');
imshow(uint8(b));
