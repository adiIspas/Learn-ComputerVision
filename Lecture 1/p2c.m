f = [1001:2000];        %Create a vector f with numbers from 1001 to 2000
g = find(f > 1850);     %Create a vector g with indices numbers from f which are bigger than 1850 
h = f(g);               %Create a vector h with elements from g are bigger than 1850