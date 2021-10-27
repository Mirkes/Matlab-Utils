function [trainInd, valInd, testInd] = divideClassRand(labels, trainRatio, valRatio)
% divideClassRand splits data set with number of elements equal
% N = length(labels) into three set training with about trainRatio * N
% elements, validationset with about valRatio * N elements, and test set
% with remainder of elements. Records of each class are split separately.
% This means that proportions of all classes are (almost) the same in all
% three sets.
% 
% Inputs:
%   labels is N-by-1 vector with labels of classes.
%   trainRatio is required fraction of records in training set.
%   valRatio is required fraction of records in validation set.
%
% Outputs:
%   trainInd is array of indices of training set records
%   valInd is array of indices of validation set records
%   testInd is array of indices of test set records
%

    % Define auhiliary variables
    labels = labels(:);
    N = size(labels, 1);
    classes = unique(labels);
    trainInd = [];
    valInd = [];
    testInd = [];
    totInd = (1:N)';
    
    % Process class by class
    for k = 1:length(classes)
        % Extract one class
        toSplit = totInd(labels == classes(k));
        % define size of this class
        n = size(toSplit, 1);
        % randomly sort records of this class
        ind = rand(n, 1);
        [~, ind] = sort(ind);
        toSplit = toSplit(ind);
        kk = round(n * trainRatio);
        trainInd = [trainInd; toSplit(1:kk)]; %#ok<AGROW>
        kkk = round(n * valRatio);
        valInd = [valInd; toSplit(kk + 1:kk + kkk)]; %#ok<AGROW>
        testInd = [testInd; toSplit(kk + kkk + 1:end)]; %#ok<AGROW>
    end
end
    
