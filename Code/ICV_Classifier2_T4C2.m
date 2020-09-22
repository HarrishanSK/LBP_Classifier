function class = ICV_Classifier2_T4C2(trainData, testData,windowSize)
% Train 4 and Classify 2 - works
%windowSize = 128; %window Size can be 4,8,16,32,64 or 128 for Dataset A images   

%Get train images from 4D double matrix trainData and convert to uint8
train_image1 = uint8(trainData(:,:,:,1));train_image2 = uint8(trainData(:,:,:,2));train_image3 = uint8(trainData(:,:,:,3));
train_image4 = uint8(trainData(:,:,:,4));
%Get test images from 4D double matrix testData and convert to uint8
test_image1 = uint8(testData(:,:,:,1));test_image2 = uint8(testData(:,:,:,2));

%Image to be classified are:
%car image for train
carTrainGlobal1 = ICV_Get_Global_LBP_Histogram(train_image1, windowSize);

%car image for train
carTrainGlobal2 = ICV_Get_Global_LBP_Histogram(train_image2, windowSize);

%face image for train
faceTrainGlobal1 = ICV_Get_Global_LBP_Histogram(train_image3, windowSize);

%face image for train
faceTrainGlobal2= ICV_Get_Global_LBP_Histogram(train_image4, windowSize);

%car image for test
test1global = ICV_Get_Global_LBP_Histogram(test_image1, windowSize);

%faceimage for test
test2global = ICV_Get_Global_LBP_Histogram(test_image2, windowSize);


rows = size(train_image1,1);%number of rows in image
columns = size(train_image1,2);%number of columns in image
numberOfWindows = (rows/windowSize)*(columns/windowSize);%number of windows
columnsInGlobalHistogram = size(test1global,2);%number of columns in global histogram, assuming all images are of same dimensions

imagesGlobalHistograms = zeros(numberOfWindows,columnsInGlobalHistogram);%intitialises size of imagesGlobalHistogram
imagesGlobalHistograms(1,:) = carTrainGlobal1;%
imagesGlobalHistograms(2,:) = carTrainGlobal2;%
imagesGlobalHistograms(3,:) = faceTrainGlobal1;%
imagesGlobalHistograms(4,:) = faceTrainGlobal2;%
imagesGlobalHistograms(5,:) = test1global;% test image to be classified
imagesGlobalHistograms(6,:) = test2global;% %test image to be classified
%Comment: Images used in train are being classified also as advised by demonstrators
%in the lab. But ofcourse these images would be perfectly classified.
%Search Space:----------------------------

for i = 1:size(imagesGlobalHistograms,1)

%car2
%img = imread('DatasetA/car-2.jpg');%Load image from Dataset A 
carTrainGlobal1 = ICV_Get_Global_LBP_Histogram(train_image2, windowSize);
Dface1car2 = sqrt( sum( ((imagesGlobalHistograms(i,:) - carTrainGlobal1).^2)));
D(1,2) = Dface1car2; 

%car3
%img = imread('DatasetA/car-3.jpg');%Load image from Dataset A
carTrainGlobal2 = ICV_Get_Global_LBP_Histogram(train_image1, windowSize);
Dface1car3 = sqrt( sum( ((imagesGlobalHistograms(i,:)- carTrainGlobal2).^2)));
D(1,3) = Dface1car3;



%face2
%img = imread('DatasetA/face-2.jpg');%Load image from Dataset A 
faceTrainGlobal1 = ICV_Get_Global_LBP_Histogram(train_image4, windowSize);
Dface1face3 = sqrt( sum( ((imagesGlobalHistograms(i,:)- faceTrainGlobal1).^2)));
D(2,2) = Dface1face3;

%face3
%img = imread('DatasetA/face-3.jpg');%Load image from Dataset A
faceTrainGlobal2 = ICV_Get_Global_LBP_Histogram(train_image3, windowSize);
Dface1face3 = sqrt( sum( ((imagesGlobalHistograms(i,:)- faceTrainGlobal2).^2)));
D(2,3) = Dface1face3;
% end of search space --------------------------

D(2,1) = 100; %D first row for cars, 2nd row for faces
D(1,1) = 100;
%Now classify to class with shortest euclidean distance
minD = D(1,1);
class(i) = "";
for r =1 : 2
    for c = 1:3
        if D(r,c) < minD
            minD = D(r,c);
            if r == 1
                class(i) = "car";
            else
                class(i) = "face";
            end
        end
    end
end
end
figure(); 
subplot(2,3,1);imshow(train_image1); title(class(1)); 
subplot(2,3,2);imshow(train_image2); title(class(2));
subplot(2,3,4);imshow(train_image3); title(class(3));
subplot(2,3,5);imshow(train_image4); title(class(4));
subplot(2,3,3);imshow(test_image1); title('\color{red}' + class(5));
subplot(2,3,6);imshow(test_image2); title('\color{red}' + class(6));
end