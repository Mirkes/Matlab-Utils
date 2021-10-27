function b = barLabelled(b)
% Add labels to bar graph
% b is bar object.
%
    % Get data for labels
    y = b.YData';
    barstrings = num2str(y);
    % Get coordinates
    x = b.XData';
    % Define graph type
    if strcmpi('off', b.Horizontal)
        % Vertical graph
        text(x, y, barstrings, 'horizontalalignment', 'center',...
            'verticalalignment', 'bottom');
    else
        % Horizontal graph.
        text(y, x, barstrings, 'horizontalalignment', 'left',...
            'verticalalignment', 'middle');
    end
end
