function grayImg = ICV_Convert_To_Grayscale(img)
%Convert RGB to grayscale
 R=img(:,:,1); %Red channel
 G=img(:,:,2); %Green channel
 B=img(:,:,3); %Blue channel
 grayImg = double(.299*R + .587*G + .114*B);  % no need for loops, convert img to gray image of type: double
end