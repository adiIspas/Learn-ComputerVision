%reads in the image, converts it to grayscale, and converts the intensities
%from uint8 integers to doubles. (Brightness must be in 'double' format for
%computations, or else MATLAB will do integer math, which we don't want.)
dark = double(rgb2gray(imread('u2dark.png')));

%%%%%% Your part (a) code here: calculate statistics
mean_pixel = mean(dark);
min_value = min(dark);
max_value = max(dark);

%%%%%% Your part (b) code here: apply offset and scaling
fixedimg = zeros(m,n);
[m,n] = size(dark);
for i=1:m
   for j=1:n
       fixedimg(i,j) =  mod(dark(i,j),255);
   end
end

%displays the image
%imshow(uint8(fixedimg));

%%%%%% Your part (c) code here: apply the formula to increase contrast,
% and display the image
contrasted = zeros(m,n);
for i=1:m
   for j=1:n
       contrasted(i,j) =  2 * (fixedimg(i,j) - 128) + 128;
   end
end

%displays the image
imshow(uint8(contrasted));