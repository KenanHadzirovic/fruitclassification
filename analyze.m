function [ TP, TN, NP, NN, OP, ON, PP, PN ] = analyze( labels, predictedLabels, analyzedLabel )
%ANALYZE Summary of this function goes here
%   Detailed explanation goes here

[numberOfLabels] = numel(labels);
TP = 0; NP = 0; TN = 0; NN = 0; 
predictedLabels = cellstr(predictedLabels);
analyzedLabel = cellstr(analyzedLabel);
for i = 1 : numberOfLabels
    if isequal(labels(i),analyzedLabel)
        if isequal(labels(i), predictedLabels(i))
            TP = TP + 1;
        else
            NP = NP + 1;
        end
    else
        if isequal(labels(i),predictedLabels(i))
            TN = TN +1;
        else
            NN = NN +1;
        end
    end
end 

OP = TP + NN;
ON = NP + TN;
PP = TP + NP;
PN = TN + NN;

end

