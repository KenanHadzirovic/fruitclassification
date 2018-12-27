function [ ] = compareLabels( labels, predictedLabels )
%COMPARELABELS Summary of this function goes here
%   Detailed explanation goes here

disp('Accuracy for apple:')
[TP, TN, NP, NN, OP, ON, PP, PN] = analyze(labels, predictedLabels, 'apple')
calculateAccuracy(TP, TN, OP, ON);
disp('Accuracy for banana:')
[TP, TN, NP, NN, OP, ON, PP, PN] = analyze(labels, predictedLabels, 'banana')
calculateAccuracy(TP, TN, OP, ON);
disp('Accuracy for orange:')
[TP, TN, NP, NN, OP, ON, PP, PN] = analyze(labels, predictedLabels, 'orange')
calculateAccuracy(TP, TN, OP, ON);

end

