clear all;
clc;
close all;
a=imread('E:\Main Project\NormalFundus-3.jpg');
b=zeros(1,256);
[row,col]=size(a);

subplot(1,2,1);
imshow(uint8(a));
title('Original Image');
for x=1:1:row
               for y=1:1:col
                   if a(x,y)<=250
                       a(x,y)=a(x,y)+5;
                   end
               end
end


subplot(1,2,2);

imshow(uint8(a));
title('Histogarm of image');