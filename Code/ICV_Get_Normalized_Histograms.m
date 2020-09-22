function [normalisedHistograms, histograms] = ICV_Get_Normalized_Histograms(windows)
numberOfWindows = size(windows,3);
windowSizeRow = size(windows,1);
windowSizeCol = size(windows,2);
rows = sqrt(numberOfWindows)*windowSizeRow ;%rows in orignal image
columns = sqrt(numberOfWindows) *windowSizeCol ;%columns in original image
   %Compute histogram per window where win is the window number
   histograms = zeros(numberOfWindows,rows); %win = 1;
   for win = 1:numberOfWindows
       for wrow = 1:windowSizeRow
           for wcol = 1:windowSizeCol
                     colour = windows(wrow ,wcol, win);
                     histograms(win,colour+1) = histograms(win,colour+1) + 1; %colour + 1 is done because colour 0 is represented by 1 in the matrix as MatLab vectors start with 1 and not 0.
           end
       end
   end
   
   %Normalise histograms
   for h = 1:size(histograms,1)
    normalisedHistograms(h,:) = histograms(h,:)/sum(histograms(h,:));
   end
end