
function [TP,FP,TN,FN, precision, recall, accuracy, corrRate] = evaluatePR(CorrectIndex, Index, siz)
tmp=zeros(1, siz);
tmp(Index) = 1;
tmp(CorrectIndex) = tmp(CorrectIndex)+1;
GFCCorrect = find(tmp == 2);
NumCorrectIndex = length(CorrectIndex);
NumGFCIndex = length(Index);
NumGFCCorrect = length(GFCCorrect);
corrRate = NumCorrectIndex/siz;   
precision = NumGFCCorrect/NumGFCIndex;  
TP=NumGFCCorrect;
FP=NumGFCIndex-TP;
recall = NumGFCCorrect/NumCorrectIndex; 
FN=NumCorrectIndex-TP;
TN=siz-NumGFCIndex-FN;  
accuracy=(TP+TN)/(TP+TN+FP+FN);
