img = rgb2gray(imread('gulfstream.png'));

%The matrix "A" from part a) is provided for convenience:
theta = pi/4;
A = [cos(theta) -sin(theta); sin(theta) cos(theta)];

%Replace the identity matrix below with your transformation
%matrix, and run this script.
%%%%%%%%%%%% Your code here %%%%%%%%%%%%%%
T = [1 2;2 1];

rads=90;

%midpoints
midx=ceil((size(img,1)+1)/2);
midy=ceil((size(img,2)+1)/2);

imagerot=zeros(size(img)); % midx and midy same for both

for i=1:size(imagerot,1)
    for j=1:size(imagerot,2)

         x= (i-midx)*cos(rads)+(j-midy)*sin(rads);
         y=-(i-midx)*sin(rads)+(j-midy)*cos(rads);
         x=round(x)+midx;
         y=round(y)+midy;

         if (x>=1 && y>=1 && x<=size(img,1) && y<=size(img,2))
              imagerot(i,j)=img(x,y);        
         end
    end
end

figure
imshow(imagerot)

%%%%%%%%%%%% end of your code %%%%%%%%%%%%%%

%The code below applies the transformation to every pixel in the image, and 
%displays both images. This code takes care of some MATLAB-specific things 
%that have low educational value, and you don't need to understand it.

%adds the translation part to get a complete affine transformation matrix
TWithTranslation = [T [0;0];0 0 1];

%MATLAB affine-transform convention is the transpose of ours, so we feed it
%the transpose of the transformation matrix
tform = maketform('projective',TWithTranslation');
%Images are drawn with the +y axis pointing down. So flip the image before
%and after the transformation to simulate normal Cartesian coordinates
transformed = flipud(imtransform(flipud(img), tform, 'FillValues',255));
figure
imshow(img)
figure
imshow(uint8(transformed))
