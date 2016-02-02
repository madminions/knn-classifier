% Reading permutation of data

function [testing_set,training_set,testing_class,training_class] = readPermute()
[ a b c d e ]=textread('iris.data',"%f %f %f %f %s","delimiter",",");

permutation = randperm(150);
read_temp = [ a b c d ];
read_temp = read_temp( permutation,:);

training_set = read_temp;
training_set = training_set (1:end/2,:);	%First half data

testing_set = read_temp;
testing_set = testing_set(end/2+1:end,:);	%Second half data

clear read_temp;
read_temp = e(permutation,:);
training_class = read_temp(1:end/2,:);
testing_class = read_temp( (end/2) +1 : end,:);

end