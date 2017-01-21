image = rgb2gray(imread('sample.jpg')); 
F = fft2(double(image));

F_Mag = abs(F); %# has same magnitude as F, 0 phase
F_Phase = cos(angle(F)) + 1i*(sin(angle(F))); %# has magnitude 1, same phase as F
%I_Mag = ifft2(F_Mag);
%I_Phase = ifft2(F_Phase);

d = F_Mag.*F_Phase;
e = abs(ifft2(d));
imshow(e/256);