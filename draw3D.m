function draw3D(data, classes, todraw, titStr, fName)
%draw3D serves to draw 3D data,
%Inputs:
%   data is n-by-3 matrix of coordinates
%   classes is n-by-1 vector of classes
%   todraw is list of classes to draw
%   titStr is title to write
%   fName is file name to store 

    figure;
    cl = unique(classes);
    cols = {'b'; 'r'; 'g'; 'm'; 'k'; 'c'; 'y'};
    if nargin < 3
        todraw = cl;
    end
    for k = 1:length(cl);
        if ismember(cl(k), todraw) 
            ind = classes == cl(k);
            plot3(data(ind, 1), data(ind, 2), data(ind, 3), [cols{k}, 'x']);
            hold on;
        end
    end
    axis equal;
    legend(num2str(todraw));
    if nargin > 3 
        if ~isempty(titStr)
            title(titStr);
        end
    end
    if nargin > 4 
        if ~isempty(fName)
            set(gcf,'PaperPositionMode','auto');
            print(gcf,'-dpng', '-noui', '-loose', fName);
        end
    end
end