function output_image = color_correct_parameters(input, a, kr, kb)
% color correct 
% a is the luminace
% kr correction factor for red
% kb correction factor for blue
% 1 - kr - kb correction factor for green

red = input(:,:,1);
green = input(:,:,2);
blue = input(:,:,3);


red = a * kr * red;
green = a * (1-kr-kb) * green;
blue = a * kb * blue;

output_image = cat(3, red, green, blue);
