clear all; close all; clc;

I = imread("100_4611.JPG");
figure(1); image(I)

[r,g,b] = imsplit(I);

sz = size(I);

figure(2); mesh(r); colormap(jet)
figure(3); mesh(g); colormap(jet)
figure(4); mesh(b); colormap(jet)