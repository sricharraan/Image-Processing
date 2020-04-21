clc;
clear all;
fr1=imread('trees.tif');
fr2=rgb2gray(fr1)
[r1 c1]=size(fr);
if(r1>c1)
    fr2=imresize(fr2,[c1,c1]);
    a=c1;
else
    fr2=imresize(fr2,[r1,r1]);
    a=r1;
end
fr=double(fr2);
for i=0:a-1
    for j=0:a-1
        if(i==0) then
            alpha=sqrt(1/a);
         else
             alpha=sqrt(2/a);
         end
         z=((2*j)+1);
         u=i*%pi;
         c(i+1,j+1)=alpha*(cos((z*u)/(2*a)));
         end
end
F=c*fr*c';
Fo=c'*F*c;
subplot(1,4,1)
title('Orginal image');
imshow(fr1);
subplot(1,4,2)
title('Gray image');
imshow(fr2);
subplot(1,4,3)
title('DCT image');
imshow(uint8(F));
subplot(1,4,4)
title('IDCT image');
imshow(uint8(Fo));
