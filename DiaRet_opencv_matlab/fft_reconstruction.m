image = rgb2gray(imread('sample.jpg')); 
subplot(131),imshow(image),title('original image');
set(gcf, 'Position', get(0, 'ScreenSize')); % maximize the figure window
%:::::::::::::::::::::
F = fft2(double(image));
F_Mag = abs(F); % has the same magnitude as image, 0 phase 
F_Phase = exp(1i*angle(F)); % has magnitude 1, same phase as image
% OR: F_Phase = cos(angle(F)) + 1i*(sin(angle(F)));
%:::::::::::::::::::::
% reconstruction
I_Mag = log(abs(ifft2(F_Mag*exp(i*0)))+1);
I_Phase = ifft2(F_Phase);
%:::::::::::::::::::::
% Calculate limits for plotting
% To display the images properly using imshow, the color range
% of the plot must the minimum and maximum values in the data.
I_Mag_min = min(min(abs(I_Mag)));
I_Mag_max = max(max(abs(I_Mag)));

I_Phase_min = min(min(abs(I_Phase)));
I_Phase_max = max(max(abs(I_Phase)));
%:::::::::::::::::::::
% Display reconstructed images
% because the magnitude and phase were switched, the image will be complex.
% This means that the magnitude of the image must be taken in order to
% produce a viewable 2-D image.
subplot(132),imshow(abs(I_Mag),[I_Mag_min I_Mag_max]), colormap gray 
title('reconstructed image only by Magnitude');
subplot(133),imshow(abs(I_Phase),[I_Phase_min I_Phase_max]), colormap gray 
title('reconstructed image only by Phase');
d = I_Mag.*I_Phase;
d_Mag_min = min(min(abs(d)));
d_Mag_max = max(max(abs(d)));
figure;
imshow(abs(d),[d_Mag_min d_Mag_max]), colormap gray ;