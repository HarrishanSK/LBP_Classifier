function [normalisedHistogram, windows] = ICV_FeatureDescriptors(img, windowSize)

     LBP_img = ICV_LBP(img);
     %figure();imshow(LBP_img);title('LBP Image');%Show LBP Image test
     %Notes: Window size can be any common factors of 256 Check Week 5 p20 Slides
     %windowSize = 128; %4,8,16,32,64,128
     rows = size(LBP_img,1);
     columns = size(LBP_img,2);
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
                  windows(wrow , wcol, n) = LBP_img(wrow+ jumpRow, wcol+ jumpCol);   
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

   %Compute histogram per window where win is the window number
   histogram = zeros(numberOfWindows,rows); %win = 1;
   for win = 1:numberOfWindows
       for wrow = 1:windowSize
           for wcol = 1:windowSize
                     colour = windows(wrow ,wcol, win);
                     histogram(win,colour+1) = histogram(win,colour+1) + 1; %colour + 1 is done because colour 0 is represented by 1 in the matrix as MatLab vectors start with 1 and not 0.
           end
       end
   end
   
   %Normalise histograms
   maximumValue = max(max(histogram(:,:,:)));
   normalisedHistogram = histogram/(rows*columns);
end