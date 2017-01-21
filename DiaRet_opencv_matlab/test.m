clc;
close all;
clear all;
image = imread('output.jpg');
his = zeros(1,256);
[row,col]=size(image);

col = col/3;

image2 = zeros(size(image),'uint8');
r = image(:,:,1);
g = image(:,:,2);
b = image(:,:,3);

r_h = Histogram_plot(row,col,r);
g_h = Histogram_plot(row,col,g);
b_h = Histogram_plot(row,col,b);
eq_his_r = hist_equ(r_h,256,row*col);
eq_his_g = hist_equ(g_h,256,row*col);
eq_his_b = hist_equ(b_h,256,row*col);

figure;
t=0:255;
stem(t,r_h,'r');
hold on;
stem(t,g_h,'g');
stem(t,b_h);

figure;
t=0:255;
stem(t,eq_his_r,'r');
hold on;
stem(t,eq_his_g,'g');
stem(t,eq_his_b);

for i=1:row
    for j=1:col
    image2(i,j,1) = eq_his_r(r(i,j)+1);
    end
end
for i=1:row
    for j=1:col
    image2(i,j,2) = eq_his_g(g(i,j)+1);
    end
end
for i=1:row
    for j=1:col
    image2(i,j,3) = eq_his_b(b(i,j)+1);
    end
end
figure;
imshow(image);
figure;
imshow(image2);
imwrite(image2,'output.jpg','jpg','Comment','My JPEG file')