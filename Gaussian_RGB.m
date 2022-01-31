clc; close all; clear;
% reading the image and adding Gaussian Noise for it
img = imread('C:\Users\m\Desktop\img.png');
img = imnoise(img, 'gaussian');
% I = imgaussfilt(img,2)   % Matlab bulid-in Filter
% Seperate RGB Image
red = double(img(:, :, 1));
green = double(img(:, :, 2));
blue = double(img(:, :, 3));

sigma = input('Enter Segma value: '); % sigma = 1.75
sz = input('Enter size: '); % sz = 1
% appling the equation - GenerateI function
ored = GenerateI(red, sigma, sz);
ogreen = GenerateI(green, sigma, sz);
oblue = GenerateI(blue, sigma, sz);
% Concatinate RGB Image after filtering
Output = cat(3, ored, ogreen, oblue);
% Convering image from double to uint8
Output = uint8(Output);

subplot(2, 1, 1), imshow(img); title('Before: Image with Gaussian Noise');
subplot(2, 1, 2), imshow(Output); title('After: Image after Gaussian Filter');