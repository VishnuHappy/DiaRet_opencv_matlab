clc;
close all;
img = imread('im0001.ppm');

[row,col]=size(img);
col = col/3;

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);
v = g;

window = 7;
factor= 19;
col2 = col-window-3;
row2 = row-window-3;

MICRO = 0;
for i=1:row2
    for j=1:col2
        samp = g(i:i+window-1,j:j+window-1);
        samp = 255 - samp;
        samp = samp - min(min(samp));
        peak = max(max(samp));
        edge = uint8(peak-factor);
        %plus = ceil(9/2);
        
        vertices = find_vertices(window,samp,edge,ceil(window/2));
        ratio = polyarea(vertices(:,1),vertices(:,2))/(window*window);%81==>9*9==>length of square=9
        
        if (ratio>=0.1)&&(ratio<=0.2)
            MICRO = MICRO + 1;
            for z=i:i+10
                v(z,j)=0;
                v(z,j+10)=0;
            end
            for z=j:j+10
                v(i,z)=0;
                v(i+10,z)=0;
            end
        end
    end
end
imshow(uint8(v));