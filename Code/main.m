%% Author: Harrishan Sureshkumar
%My Classifier for cars and faces
%
%%Classifier 1
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


%%Classifier 2
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
