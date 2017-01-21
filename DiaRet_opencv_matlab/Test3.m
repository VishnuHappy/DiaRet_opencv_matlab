clc;
%clear all;
close all;
img = imread('im0393.ppm');
[row,col]=size(img);
col = col/3;

bin = [0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,255,255,255,0,0,0;0,0,255,255,255,255,255,255,255,0,0;0,0,255,255,255,255,255,255,0,0,0;0,0,255,255,255,255,255,255,0,0,0;0,0,0,255,255,255,255,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,255,255,255;0,0,0,0,0,255,255,255,255,255,255];
bin = uint8(bin);

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

v = g;

%subplot(1,2,1)
%imshow(uint8(g));
%subplot(1,2,2)
%imshow(uint8(v));

local = uint8(zeros(11,11));

%X = 454;
%for x=1:1:11
%    Y = 405;
%               for y=1:1:11
%                   local(x,y) = g(X,Y);
%                   %g(X,Y)=0;
%                   Y=Y+1;
%               end
%               X = X+1;
%end
%mean = sum(sum(local));
%mean = floor(mean/121);
%bin = local<mean;
%bin = 255*(uint8(bin));

mask = uint8(zeros(11,11));
col2 = col-12;
row2 = row-12;
count = 0;
count1a = 0;
count1b = 0;
MICRO = 0;
for i=1:row2
    for j=1:col2
        samp = g(i:i+10,j:j+10);
        sump2 = sum(sum(samp));
        sump = floor(sump2/121);
        samp = samp<sump;
        samp = 255*(uint8(samp));

        for x=1:11
            for y=1:11
                if (samp(x,y) == bin(x,y)) && (samp(x,y)>200)
                    count = count+1;
                end
                if samp(x,y)>200
                    count1a = count1a+1;
                end
                if bin(x,y)>200
                    count1b = count1b+1;
                end
            end
        end
        f = count1a-count1b;
                if i==454 && j==405
            f,count1a,count1b,samp,sump2,count
        end        
        if (((count >=27) && (count <=45)) && (f<=2) && (f>=0))
            for z=i:i+10
                v(z,j)=0;
                v(z,j+10)=0;
            end
            for z=j:j+10
                v(i,z)=0;
                v(i+10,z)=0;
            end
            MICRO = MICRO+1;
        end
        count = 0;
        count1a = 0;
        count1b = 0;
    end
end
%figure;imshow(uint8(bin));
%figure;imshow(uint8(local));
%figure;imshow(uint8(g));
%figure;surf(local);
figure;imshow(v);