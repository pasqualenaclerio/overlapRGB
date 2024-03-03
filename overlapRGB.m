clear all; close all;

%%

Rimg = imread('images/ppR.JPG');
Gimg = imread('images/ppG.JPG');
Bimg = imread('images/ppB.JPG');

redChannel = Rimg(:, :, 1);
greenChannel = Gimg(:, :, 2);
blueChannel = Bimg(:, :, 3);


red = Rimg(:, :, 1);
green = Gimg(:, :, 2);
blue = Bimg(:, :, 3);
    

Irgb = cat(3,red,green,blue);

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
