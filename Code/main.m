%% Author: Harrishan Sureshkumar
%My Classifier for cars and faces
%
%% Task(a) Split Image into LBP windows and get normalized histograms
close all;clear; clc ; %Clear workspace
img = imread('DatasetA/car-1.jpg');%Load image from Dataset A
windowSize = 128; %window Size can be 4,8,16,32,64 or 128 for Dataset A images    
windows = ICV_Get_Windows(img, windowSize);%Get windows
windowsLBP = ICV_Get_LBP_Windows(img, windowSize);%Split Image into LBP windows and get windows
[normalisedHistograms, histograms] = ICV_Get_Normalized_Histograms(windowsLBP);%Get normalise histograms of these windows

%% Task(a) Show each window and its histogram side by side per second
   i = 0;
   for h = 1:size(normalisedHistograms,1)
        i = i+ 1;% i is the current window number being shown
        %Plot window and histogram side by side per window
        figure(1)
        subplot(2,2,1), imshow(img);title('Original Image');
        subplot(2,2,2), imshow(windows(:,:,h)); title(strcat('Window: ',num2str(i)));
        subplot(2,2,3), plot(0:255, normalisedHistograms(h,:)); title(strcat('Normalised Histogram of LBP Window: ',num2str(i)));                 
            ax = gca;ax.FontSize = 5;%makes title font size smaller to prevent overlap with y axis values
        subplot(2,2,4), imshow(windowsLBP(:,:,h)); title(strcat('LBP of Window: ',num2str(i)));
        pause(0.7);%Delay execution by this many seconds
   end
%% Task(a) Show normalised histogram for chosen window at hand
   chosenWindow = 1; %Set chosen window number into this variable to visualise the normalised histogram,window, LBP window & Original image
   figure(); 
   subplot(2,2,1), imshow(windows(:,:,chosenWindow)); title(strcat('Window: ',num2str(chosenWindow)));
   subplot(2,2,2), plot(0:255, normalisedHistograms(chosenWindow,:)); title(strcat('Histogram of Window: ',num2str(chosenWindow)));
   subplot(2,2,3), plot(0:255, normalisedHistograms(chosenWindow,:)); title(strcat('Normalised Histogram of LBP Window: ',num2str(chosenWindow)));                 
            ax = gca;ax.FontSize = 5;%makes title font size smaller to prevent overlap with y axis values
   subplot(2,2,4), imshow(windowsLBP(:,:,chosenWindow)); title(strcat('LBP of Window: ',num2str(chosenWindow)));
%% Task(b) Global descriptor by combining local descriptors

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

figure();plot(globalHistogram); 

%% Task(c) Classifier 1
%Read in the images from Dataset A
car3 = imread('DatasetA/car-4.jpg');%Load image from Dataset A to classify
car2 = imread('DatasetA/car-5.jpg');%Load image from Dataset A to classify
car1 = imread('DatasetA/car-1.jpg');%Load image from Dataset A to train/use as model

face3 = imread('DatasetA/kunjuFace.jpg');%Load image from Dataset A to classify
face2 = imread('DatasetA/harriFace.jpg');%Load image from Dataset A to classify
face1 = imread('DatasetA/face-1.jpg');%Load image from Dataset A to train/use as model

windowSize = 64; %Choose window size 8,16,32,128

%Assign train and test data
trainData = zeros(256,256,3,2);
    trainData(:,:,:,1) = car1; %This location must store a car image
    trainData(:,:,:,2) = face1; %This location must store a face image

testData = zeros(256,256,3,2);
    testData(:,:,:,1) = car2; 
    testData(:,:,:,2) = car3; 
    testData(:,:,:,3) = face2; 
    testData(:,:,:,4) = face3; 

%Classifier which uses 2 images to train the model and classifies all
%images in dataset A, Red labelled images are the test data and are classified using the model
%and black labelled images are images used in the training to build the
%model
classLabels1 = ICV_Classifier1_T2C4(trainData, testData,windowSize);


%% Task(c) Classifier 2
close all;clear; clc ;
%Read in the images from Dataset A
car3 = imread('DatasetA/car-3.jpg');%Load image from Dataset A to train/use as model
car2 = imread('DatasetA/car-2.jpg');%Load image from Dataset A to train/use as model
car1 = imread('DatasetA/car-1.jpg');%Load image from Dataset A to classify

face3 = imread('DatasetA/face-3.jpg');%Load image from Dataset A to train/use as model
face2 = imread('DatasetA/face-2.jpg');%Load image from Dataset A to train/use as model
face1 = imread('DatasetA/face-1.jpg');%Load image from Dataset A to classify

windowSize = 128; %Choose window size 8,16,32,64,128

%Assign train and test data
trainData = zeros(256,256,3,2);
    trainData(:,:,:,1) = car3; %This location must store a car image
    trainData(:,:,:,2) = car2; %This location must store a car image
    trainData(:,:,:,3) = face3; %This location must store a face image
    trainData(:,:,:,4) = face2; %This location must store a face image
testData = zeros(256,256,3,2);
    testData(:,:,:,1) = car1; 
    testData(:,:,:,2) = face1; 

%Classifier which uses 4 images to train the model and classifies all
%images in dataset A, Red labelled images are the test data and are classified using the model
%and black labelled images are images used in the training to build the model
classLabels2 = ICV_Classifier2_T4C2(trainData, testData, windowSize);