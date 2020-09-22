function windows = ICV_Get_Windows(img, windowSize)

     %windowSize = 128; %4,8,16,32,64,128
     rows = size(img,1);
     columns = size(img,2);
     numberOfWindows = (rows/windowSize)*(columns/windowSize);                                                                         

     jumpRow = 0; jumpCol = 0;
     windows = zeros(windowSize, windowSize, numberOfWindows);
     numberOfWindowsInHorizontal = rows/windowSize; horizontalCount = 0;
     
     %Save windows from left to right and then start new row and so on...
     for n = 1:numberOfWindows %for each window
         horizontalCount = horizontalCount + 1;
         for wrow = 1:windowSize %for each pixel in each row of window
             for wcol = 1:windowSize %for each pixel in each column of window
                 
                 if (jumpCol < columns && jumpRow <rows)
                  windows(wrow , wcol, n) = img(wrow+ jumpRow, wcol+ jumpCol);   
                 end
                 %jumpRow and jumpCol are used to skip "this" many pixels to
                  %get to new window on original image
             end     
         end
         
         if horizontalCount == numberOfWindowsInHorizontal%if number of windows traversed = the number of windows in horizontal/row
             horizontalCount = 0; %Reset horizontalCount counter as we are starting a new row
             jumpCol = 0; %Set jumpCol to 0 as we are about to start new row in new window
             jumpRow = jumpRow + windowSize;
         else
             jumpCol = jumpCol + windowSize;
         end
         
         
     end
    windows = uint8(windows);     
    %window = windows(:,:,1);
    %figure();imshow(uint8(window)); %show first window test

end