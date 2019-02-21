% GFC demo
% PR'2018


close all
clear all
clc

load('graf.mat');
label=CorrectIndex;
delta =0.5;
[index] = GFC_match(X,Y,delta);
[TP,FP,TN,FN, precision, recall, accuracy, corrRate]  = evaluatePR(label, index, size(X,1))

