clc;
close all;
img = imread('im0001.ppm');

[row,col]=size(img);
col = col/3;

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);
v = g;

se = strel('square',3);
sec = strel('square',5);

for i=1:0
    g = medfilt2(g);
end
for i=1:row
    for j=1:col
        if (g(i,j)<50)%||pim(i,j)>110)
            g(i,j)=0;
        %else
         %   tg(i,j)=255;
        end
    end
end
figure;imshow(g);

gd = imdilate(g,se);
ge = imerode(g,se);


for i=1:row
    for j=1:col
       if (gd(i,j)>120)
            gd(i,j)=0;
        end
        if (ge(i,j)>120)
            ge(i,j)=0;
        end
    end
end
grd = gd - ge;
for i=1:row
    for j=1:col
        if (grd(i,j)<10)%||pim(i,j)>110)
            grd(i,j)=0;
        end
        %else
         %   tg(i,j)=255;
    end
end
figure;
imshow(grd*2);
figure;
imshow(g+grd*2);