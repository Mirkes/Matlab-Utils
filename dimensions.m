function [kr, bDim, cnDim] = dimensions(eigenvalues, cn)
% Estimate linear dimension of data by Kaiser rule (kr), broken stick
% (bDim), and conditional number 10
% Inputs:
%   eigenvalues is vector of eigenvalues
%   cn is conditional number to use for CN dimension.
%
% Outputs:
%   kr dimension according to Kaiser rule
%   bDim is dimension according to broken stick rule
%   cnDim is dimension according to conditional number

    if nargin < 2
        cn = 10;
    end
    figure;
    eigenvalues = abs(eigenvalues);
    eigenvalues = eigenvalues / sum(eigenvalues);
    n = length(eigenvalues);
    % Plot eigenvalues
    eigenvalues = sort(eigenvalues, 'descend');
    plot(eigenvalues, 'k-');
    hold on;
    % Plot Kaiser rule
    yline(1 / n, 'r-');
    tmp = find(eigenvalues < 1 / n);
    if isempty(tmp)
        kr = 0;
    else
        kr = tmp(1) - 1;
    end
    % Brocken stick
    [bDim, bs] = brokenStick(eigenvalues);
    plot(bs, 'g-');
    % Conditional numbers
    tmp = find(eigenvalues < eigenvalues(1) / cn);
    if isempty(tmp)
        cnDim = 0;
    else
        cnDim = tmp(1) - 1;
    end
    yline(eigenvalues(1) / cn, 'b-');
    % Decoration
    xlabel('Number of PCs');
    ylabel('Fraction of explained variance');
    legend('FVE', 'Kaiser rule', 'Broken stick', 'Conditional number');
end