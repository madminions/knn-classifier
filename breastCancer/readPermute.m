% Reading permutation of data

function [testing_set,training_set,testing_class,training_class] = readPermute()
[ a b c d e f g h i j k ]=textread('breast-cancer-wisconsin.data',"%f %f %f %f %f %f %f %f %f %f %f","delimiter",",");

permutation = randperm(699);
read_temp = [ a b c d e f g h i j ];
read_temp = read_temp( permutation,:);

training_set = read_temp;
training_set = training_set (1:floor(end/2),:);	%First half data

testing_set = read_temp;
testing_set = testing_set( floor(end/2)+1:end,:);	%Second half data

clear read_temp;
read_temp = k(permutation,:);
training_class = read_temp(1:floor(end/2),:);
testing_class = read_temp( floor(end/2) +1 : end,:);

end