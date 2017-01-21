clc;
%clear all;
close all;
img = imread('im0001.ppm');
[row,col]=size(img);
col = col/3;

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);
local = uint8(zeros(10,10));

%X = 474;
X = 417;
for x=1:1:10
    %Y = 417;
    Y = 474;
               for y=1:1:10
                   local(x,y) = g(X,Y);
                   g(X,Y)=0;
                   Y=Y+1;
               end
               X = X+1;
end

save('save_micro_1.mat','local');

mean = sum(sum(local));
mean = floor(mean/100);
bin = local<mean;
bin = 255*(uint8(bin));

figure;subplot(131);imshow(uint8(bin));
subplot(132);imshow(uint8(local));
image(:,:,1) = zeros(10,10);
image(:,:,3) = zeros(10,10);
image(:,:,2) = local;

image = uint8(image);
subplot(133);imshow((image));

imwrite(image,'Micro_1.jpg','jpg','Comment','My JPEG file')