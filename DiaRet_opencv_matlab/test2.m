clear all;
close all;

img = imread('im0001.ppm');

[row,col]=size(img);
col = col/3;

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

fundus = g;

subplot(2,2,1);
imshow(img);
I = zeros(row,col,3);
I(:,:,1) = r;
subplot(2,2,2);
imshow(uint8(I));
I = zeros(row,col,3);
subplot(2,2,3);
I(:,:,2) = g;
imshow(uint8(I));
I = zeros(row,col,3);
subplot(2,2,4);
I(:,:,3) = b;
imshow(uint8(I));

figure;
subplot(1,2,1);
I = zeros(row,col,3);
I(:,:,2) = g;
imshow(uint8(I));
v = imhistmatch(g,r);
I(:,:,2) = v;
subplot(1,2,2);
imshow(uint8(I));

figure;
I(:,:,2) = v;
I(:,:,1) = r;
I(:,:,3) = b;
subplot(1,2,1)
imshow(img);
subplot(1,2,2)
imshow(uint8(I));

%fundus = medfilt2(g);
figure;
subplot(121);
imshow(g);
subplot(122);
imshow(uint8(fundus));

figure;
subplot(121);
imshow(uint8(fundus));
subplot(122);
stem(Histogram_plot(row,col,fundus));

figure;
subplot(211);
imshow(uint8(fundus));
subplot(212);
stem(Histogram_plot(row,col,fundus));

%close all;

A = adapthisteq(fundus,'clipLimit',0.001,'Distribution','rayleigh');
figure, imshow(fundus);
figure, imshow(A);

imwrite(fundus,'fundus.jpg','jpg','Comment','My JPEG file')