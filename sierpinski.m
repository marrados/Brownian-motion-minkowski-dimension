function [s1, s2] = sierpinski(size)

% SIERPINSKI(n) creates a Sierpinksi triangle of size 2^n using
% binary addressing (see "Fractals for the Classroom", chapter 2).
% Every odd number in Pascal's triangle is plotted and so the Sierpinski
% triangle is formed. The edge of the triangle is the origin.

% SIERPINSKI creates a triangle of size 2^9.

% This file was generated by students as a partial fulfillment 
% for the requirements of the course "Fractals", Winter term
% 2004/2005, Stuttgart University.	
	
% Author : Raphael Loechner
% Date   : Nov 2004
% Version: 1.0

if nargin ~= 1      % default setting
	size = 9;
end

clf;                 % clear screen
groesse = 2^size;    % size of the triangle - the larger, the more exact
axis square;         
hold on;             % overlay plot

s1 = zeros(1, groesse);
s2 = zeros(1, groesse);
i = 1; 
j = 1;

for y = 1:groesse                       % loop on the rows
    for x = 1:y                         % loop on the columns
        if bitand((x-1),(y-x)) == 0     % valid point?
            s1(i) = x;
            i = i + 1;
            s2(j) = y;
            j = j + 1;
            plot(x-.5*x,groesse-y);
        end
    end                                 % next column
end                                     % next row