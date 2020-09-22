function finalImage = ICV_LBP(img)
% 6a) Texture - LBP

        grayImg = ICV_Convert_To_Grayscale(img);%Convert to grayscale
        paddedImg = ICV_Pad_Image(grayImg,1);%Pad gray image
        %figure(1);imshow(uint8(paddedImg)); %Show gray image  
        rowsPI = size(paddedImg,1); %rows in padded image
        columnsPI = size(paddedImg,2); %columns in padded image
        bitcode = zeros(1,8);%array to store bitcode for each pixel
        
              %For each pixel..do LBP
               for row = 2: rowsPI-1
                    for col = 2: columnsPI-1
                                            
                       %left
                       if (paddedImg(row,col-1) > paddedImg(row,col))
                           bitcode(1) = 1;
                       else
                           bitcode(1) = 0;
                       end
                      
                       
                       
                       %left-bottom
                       if (paddedImg(row+1,col-1) > paddedImg(row,col))
                           bitcode(2) = 1;
                       else
                           bitcode(2) = 0;
                       end     
                       
                       
                       
                       %bottom
                       if (paddedImg(row+1,col) > paddedImg(row,col))
                           bitcode(3) = 1;
                       else
                           bitcode(3) = 0;
                       end
                       
                       
                       %right-bottom
                       if (paddedImg(row+1,col+1) > paddedImg(row,col))
                           bitcode(4) = 1;
                       else
                           bitcode(4) = 0;
                       end    
                      
                       
                       %right
                       if (paddedImg(row,col+1) > paddedImg(row,col))
                           bitcode(5) = 1;
                       else
                           bitcode(5) = 0;
                       end
                       
                       
                       %right-top
                       if (paddedImg(row-1,col+1) > paddedImg(row,col))
                           bitcode(6) = 1;
                       else
                           bitcode(6) = 0;
                       end
                       
                       
                       %top
                       if (paddedImg(row-1,col) > paddedImg(row,col))
                           bitcode(7) = 1;
                       else
                           bitcode(7) = 0;
                       end
                       
                       
                       %left-top
                       if (paddedImg(row-1,col-1) > paddedImg(row,col))
                           bitcode(8) = 1;
                       else
                           bitcode(8) = 0;
                       end
                       
                       
                       finalImage(row-1,col-1) = ICV_ConvertBinaryToDecimal(bitcode); %store decimal value in this pixel location in LBP final image
                    end

               end
                
     
  %   figure(2);imshow(finalImage);
   %  figure(3);imshow(uint8(finalImage));title('uint8');
   finalImage = uint8(finalImage);
end