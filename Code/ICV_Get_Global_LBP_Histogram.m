function globalHistogram = ICV_Get_Global_LBP_Histogram(img, windowSize)

%windows = ICV_Get_Windows(img, windowSize);%Get windows
windowsLBP = ICV_Get_LBP_Windows(img, windowSize);%Split Image into LBP windows and get windows
[normalisedHistograms, histograms] = ICV_Get_Normalized_Histograms(windowsLBP);%Get normalise histograms of these windows

%Take normalised histograms of LBP windows and concatonate them 
[windowSizeColumns,windowSizeRows,numberOfWindows]  = size(windowsLBP,1,2,3);
numberOfColumnsInGlobal = numberOfWindows * 256; %256, for 0 to 255 pixel intensity values
numberOfHistograms = size(normalisedHistograms,1);%each window has a histogram 
numberOfIntensityValues = size(normalisedHistograms,2); %256
globalHistogram = zeros(1, numberOfColumnsInGlobal);
n = 1;
    for h = 1 : numberOfHistograms
     for i = 1:numberOfIntensityValues
      globalHistogram(1,n) = normalisedHistograms(h,i);
      n = n +1;
     end
    end

%figure();plot(globalHistogram); 
end