clc
clear all
close all
warning off

% Read the image
I = imread("Examples/R2023b/images/carImg.jpg");
I2 = imread('visionteam1.jpg');
I3 = imread("Examples/R2023b/images/ftronaldo.jpg");


% Create a HOG person detector

detector = peopleDetectorACF;

% Detect people

[bboxes,scores] = detect(detector,I);
[bboxes2,scores2] = detect(detector,I2);
[bboxes3,scores3] = detect(detector,I3);


% Annotate the detected people

I = insertObjectAnnotation(I,'rectangle',bboxes,scores);
I2 = insertObjectAnnotation(I2,'rectangle',bboxes2,scores2);
I3 = insertObjectAnnotation(I3,'rectangle',bboxes3,scores3);
figure(1)
imshow(I)
title('Detected People and Detection Scores')

figure(2)
imshow(I2)
title('Detected People and Detection Scores')

figure(3)
imshow(I3)
title('Detected People and Detection Scores')




%alternate method

%detector = vision.CascadeObjectDetector('ClassificationModel', 'UpperBody');
%bboxes = step(detector, x);
%img = insertObjectAnnotation(x, 'rectangle', bboxes, 'person', 'Color', 'red');
%title('Detected People and detection scores');
%imshow(img);