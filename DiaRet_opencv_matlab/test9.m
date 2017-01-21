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
gd = imdilate(g,se);
ge = imerode(g,se);
grd = gd - ge;
%grd = ge - gd;
grd_2 = grd * 6;
grd_3 = medfilt2(grd_2);
h = g;
g = medfilt2(g);
gd_2 = imdilate(g,se);
ge_2 = imerode(g,se);

for i=1:row
    for j=1:col
       if (gd_2(i,j)>120)
            gd_2(i,j)=0;
        end
        if (ge_2(i,j)>120)
            ge_2(i,j)=0;
        end
    end
end
grd_21 = gd_2 - ge_2;
grd_22 = grd_21 * 6;
grd_32 = medfilt2(grd_22);

pim = grd_22;
tg = pim;

figure;imshow(grd_22);
left = 0;
right = col;
flag = 0;
for z = 1:5
    for i=1:row
        %k = 1;
        left = 0;
        right = col;
        flag = 0;
        for j=1:col
            if (pim(i,j)<40)%||pim(i,j)>110)
                pim(i,j)=0;
            end
            if (v(i,j)>(120) && (flag == 0))
                    left = j-1;
                    flag = 1;
            else if (v(i,j)<(120-z) && (flag == 1))
                    flag = 0;
                    value_left = v(i,left);
                    value_right = v(i,j);
                    length = j-left;
                    k = 1;
                    if (value_left > value_right)
                        k = -1;
                    end
                    for m = 0:(length-1)
                        v(i,left+m) = value_left + (m+1)*k*(abs(value_left-value_right)/length);
                    end
                end
            end
        end
    end
end
figure;
subplot(121);
imshow(g);
subplot(122);
g = uint8(v);
imshow(g);
%imwrite(uint8(v),'sample0116.jpg','jpg','Comment','My JPEG file')

se = strel('square',3);
gd = imdilate(g,se);
ge = imerode(g,se);
grd = gd - ge;
grd_2 = grd * 6;
grd_3 = medfilt2(grd_2);
g = medfilt2(g);
gd_2 = imdilate(g,se);
ge_2 = imerode(g,se);
grd_21 = gd_2 - ge_2;
grd_22 = grd_21 * 6;
grd_32 = medfilt2(grd_22);
pim = grd_22;
for i=1:row
    for j=1:col
        if (pim(i,j)<40)%||pim(i,j)>110)
            pim(i,j)=0;
        else
            pim(i,j)=255;
        end
        if (tg(i,j)<10)%||pim(i,j)>110)
            tg(i,j)=0;
        %else
         %   tg(i,j)=255;
        end
    end
end
figure;
imshow(pim);
figure;
imshow(tg);
tt = imdilate(g,se) - imerode(g,se);
%tt = tt - imerode(tt,se);
%tt = tt*6;
figure;
imshow(tt);
%for z = 1:5
%    for j=1:col
%        %k = 1;
%        left = 0;
%        right = col;
%        flag = 0;
%        for i=1:row
%            if (v(i,j)>(115) && (flag == 0))
%                    left = i-1;
%                    flag = 1;
%            else if (v(i,j)<(120-z) && (flag == 1))
%                    flag = 0;
%                    value_left = v(left,j);
%                    value_right = v(i,j);
%                    length = i-left;
%                    k = 1;
%                    if (value_left > value_right)
%                        k = -1;
%                    end
%                    for m = 0:(length-1)
%                        v(left+m,j) = value_left + (m+1)*k*(abs(value_left-value_right)/length);
%                    end
%                end
%            end
%        end
%    end
%end
%figure;
%subplot(121);
%imshow(g);
%subplot(122);
%imshow(uint8(v));
%imwrite(uint8(v),'sample0001.jpg','jpg','Comment','My JPEG file')