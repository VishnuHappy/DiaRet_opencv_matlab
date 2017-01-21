A=imread('im0009.ppm');
A=rgb2gray(A);


figure, imshow(A);title('ORIGINAL');

B2=im2bw(A,62); figure, imshow(logical(B2));title('Bit plane 6');

B3=im2bw(A,74); figure, imshow(logical(B3));title('Bit plane 7');

B4=im2bw(A,85); figure, imshow(logical(B4));title('Bit plane 8');
B5=B4+B3+B2;figure, imshow(logical(B5));title('SUM 8');