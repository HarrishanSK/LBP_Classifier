function class = ICV_Classifier1_T2C4(trainData,testData,windowSize)
% Train 2 images Classify 4

%Get train images from 4D double matrix trainData and convert to uint8
train_image1 = uint8(trainData(:,:,:,1));train_image2 = uint8(trainData(:,:,:,2));

%Get test images from 4D double matrix testData and convert to uint8
test_image1 = uint8(testData(:,:,:,1));test_image2 = uint8(testData(:,:,:,2));
test_image3 = uint8(testData(:,:,:,3));test_image4 = uint8(testData(:,:,:,4));


%Image to be classified are:

%Image 1 used in test to be classified with red label
testGlobal(1,:) = ICV_Get_Global_LBP_Histogram(test_image1, windowSize);

%Image used in test to be classified with red label
testGlobal(2,:) = ICV_Get_Global_LBP_Histogram(test_image2, windowSize);

%Image used in test to be classified with red label
testGlobal(3,:) = ICV_Get_Global_LBP_Histogram(test_image3, windowSize);

%Image used in test to be classified with red label
testGlobal(4,:) = ICV_Get_Global_LBP_Histogram(test_image4, windowSize);

%Image of car used in train
carTrainGlobal = ICV_Get_Global_LBP_Histogram(train_image1, windowSize);

%Image of face used in train
faceTrainGlobal = ICV_Get_Global_LBP_Histogram(train_image2, windowSize);


rows = size(test_image1,1);%number of rows in image
columns = size(test_image1,2);%number of columns in image
numberOfWindows = (rows/windowSize)*(columns/windowSize);%number of windows
columnsInGlobalHistogram = size(testGlobal(1,:),2);%number of columns in global histogram

%Images to be classified
imagesGlobalHistograms = zeros(numberOfWindows,columnsInGlobalHistogram);%intitialises size of imagesGlobalHistogram
imagesGlobalHistograms(1,:) = testGlobal(1,:);%This row is a car
imagesGlobalHistograms(2,:) = testGlobal(2,:);%This row is a car
imagesGlobalHistograms(3,:) = testGlobal(3,:);%This row is a face
imagesGlobalHistograms(4,:) = testGlobal(4,:);%This row is a face
imagesGlobalHistograms(5,:) = carTrainGlobal;%This row is a car used for train
imagesGlobalHistograms(6,:) = faceTrainGlobal;%%This row is a face used for train
%Comment: Images used in train are being classified also as advised by demonstrators
%in the lab. But ofcourse these images would be perfectly classified (These images are labelled in black in the output figure).


%Search Space:----------------------------
for i = 1:size(imagesGlobalHistograms,1)

D = zeros(2,1); %Distance matrix to store euclidean distances between global histograms of images

%car image for train
%img = imread('DatasetA/car-1.jpg');%Load image from Dataset A
carTrainGlobal = ICV_Get_Global_LBP_Histogram(train_image1, windowSize);
Dcar1x1 = sqrt( sum( ((imagesGlobalHistograms(i,:)- carTrainGlobal).^2)));
D(1,1) = Dcar1x1; %First row of distance matrix for car

%face image for train
%img = imread('DatasetA/face-1.jpg');%Load image from Dataset A
faceTrainGlobal = ICV_Get_Global_LBP_Histogram(train_image2, windowSize);
Dface1x1 = sqrt( sum( ((imagesGlobalHistograms(i,:)- faceTrainGlobal).^2)));
D(2,1) = Dface1x1; %Second row of distance matrix for face
% end of search space --------------------------


%Now classify to class with shortest euclidean distance
minD = inf;
class(i) = "null";

if D(1,1) > D(2,1)
    minD = D(2,1); %Shortest euclidean distance is to a face
    class(i) = "face";%so classify this image as a face
else
    minD = D(1,1);%Shortest euclidean distance is to a car
    class(i) = "car";%so classify this image as a face
end

end

figure(); 
subplot(2,3,1);imshow(test_image1); title('\color{red}' + class(1)); 
subplot(2,3,2);imshow(test_image2); title('\color{red}' + class(2));
subplot(2,3,4);imshow(test_image3); title('\color{red}' + class(3));
subplot(2,3,5);imshow(test_image4); title('\color{red}' + class(4));
subplot(2,3,3);imshow(train_image1); title(class(5));
subplot(2,3,6);imshow(train_image2); title(class(6));
end
