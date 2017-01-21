clc;
close all;
SAVEFILE = matfile('save_micro_1.mat');
img = SAVEFILE.local;
img = img(1:9,1:9);
[row,col]=size(img);
l=row;

img = 255 - img;
img = img - min(min(img));

peak = max(max(img))
edge = peak*0.35;
plus = ceil(row/2)%It can also be column as row = col

%vertices = zeros(9,2);
vertices = find_vertices(l,img,peak*0.35,plus);

vertices_1 = find_vertices(l,img,peak*0.25,plus);

vertices_2 = find_vertices(l,img,peak*0.4,plus);

%polyarea(vertices_2(:,1),vertices_2(:,2));
%polyarea(vertices_2(:,1),vertices_2(:,2));

figure;
imshow(uint8(SAVEFILE.local));hold on;
plot(vertices(:,1),fliplr(vertices(:,2)));
plot(vertices_1(:,1),fliplr(vertices_1(:,2)),'r');
plot(vertices_2(:,1),fliplr(vertices_2(:,2)),'g');
set(gca,'xaxislocation','top','ydir','reverse')