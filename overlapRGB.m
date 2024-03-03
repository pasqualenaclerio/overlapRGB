clear all; close all;

%% Test with an original color image
%  deselect and comment out the RGB overlap part
%{
img = imread('images/alpaca.jpg');

red = img(:, :, 1);
green = img(:, :, 2);
blue = img(:, :, 3);

Rimg = red;
Gimg = green;
Bimg = blue;

Irgb = cat(3,red,green,blue);
%}
%% overlap RGB

Rimg = imread('images/ppR.JPG');
Gimg = imread('images/ppG.JPG');
Bimg = imread('images/ppB.JPG');


red = Rimg(:, :, 1);
green = Gimg(:, :, 2);
blue = Bimg(:, :, 3);
    

Irgb = cat(3,red,green,blue);

%% Show RGB images

allBlack = zeros(size(Irgb, 1), size(Irgb, 2), 'uint8');

% Create color versions of the individual color channels.
just_red = cat(3, red, allBlack, allBlack);
    %figure('Name', 'image with only the red channel')
    %imshow(just_red);

just_green = cat(3, allBlack, green, allBlack);
    %figure('Name', 'image with only the green channel')
    %imshow(just_green);

just_blue = cat(3, allBlack, allBlack, blue);
    %figure('Name', 'image with only the blu channel')
    %imshow(just_blue);

figure('Name', 'the three channels of RGB')

subplot(2,3,1), imshow(Rimg)
title('s1: red channel info')
subplot(2,3,2), imshow(Gimg)
title('s2: green channel info')
subplot(2,3,3), imshow(Bimg)
title('s3: blu channel info')

subplot(2,3,4), imshow(just_red)
title('s4: red channel info color')
subplot(2,3,5), imshow(just_green)
title('s5: green channel info color')
subplot(2,3,6), imshow(just_blue)
title('s6: blu channel info color')

%% Color Correct with the average
img_color_avarage = color_correct_avarage(Irgb);

figure('Name', 'Color Correct with the average')

imshow(img_color_avarage);
imwrite(img_color_avarage,'images/img_avarage.jpg');

%% Color Correct with parameters

a = 4;
kr = 1/3 + 0.021;
kb = 1/3 + 0.038;

img_color_parameters = color_correct_parameters(Irgb, a, kr, kb);

figure('Name', 'Color Correct with parameters')

imshow(img_color_parameters);
imwrite(img_color_parameters,'images/img_parameters.jpg');
