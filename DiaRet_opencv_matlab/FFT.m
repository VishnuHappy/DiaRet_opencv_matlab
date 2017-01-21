I = imread('FFT3.jpg');
%I = rgb2gray(I);
%F = fft2(I); %where I is the input
F = fft2(double(I));

F_Phase = exp(1i*angle(F));
F_2 = abs(F_Phase);
F = fftshift(F); % Center FFT

F = abs(F); % Get the magnitude
F_Mag = F;
F = log(F+1); % Use log, for perceptual scaling, and +1 since log(0) is undefined
F = mat2gray(F); % Use mat2gray to scale the image between 0 and 1


F_Phase = mat2gray(F_2);
%imshow(I);
subplot(1,2,1);
imshow(F,[]); % Display the result
subplot(1,2,2);
imshow(F_2,[]);