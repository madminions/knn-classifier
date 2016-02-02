% Reading permutation of data

function [testing_set,training_set,testing_class,training_class] = readPermute()
[ a b c d e f g h i j k l m n ]=textread('wine.data',"%f %f %f %f %f %f %f %f %f %f %f %f %f %f","delimiter",",");

permutation = randperm(178);
read_temp = [ b c d e f g h i j k l m n ];
read_temp = read_temp( permutation,:);

training_set = read_temp;
training_set = training_set (1:end/2,:);	%First half data

testing_set = read_temp;
testing_set = testing_set(end/2+1:end,:);	%Second half data

clear read_temp;
read_temp = a(permutation,:);
training_class = read_temp(1:end/2,:);
testing_class = read_temp( (end/2) +1 : end,:);

end