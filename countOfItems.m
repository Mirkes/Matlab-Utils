function [items, counts] = countOfItems(arr)
% countOfItems calculates the number of occurrences of each unique value of
% elements in array ar into arr.
%
% Inputs:
%   arr is vector to calculate occurrences.
%
% Outputs:
%   items is vector of unique values from arr
%   cnt is vector of counts of occurrences of unique values in arr in the
%       same order as items.

    arr = arr(:);
    [items, ~, ic] = unique(arr);
    counts = accumarray(ic, 1);    
end