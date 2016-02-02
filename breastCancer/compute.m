% computing K nearest neighbour algorithm
function output_class = compute(testing_set,training_set,training_class)


% for each testing_set compute shortest distance point
testing_set_length = length(testing_set);
training_set_length = length(training_set);

for testing_i = 1:testing_set_length
	for training_i = 1:training_set_length
		temp1=(training_set(training_i,1)- testing_set(testing_i,1) )^2 + (training_set(training_i,2)- testing_set(testing_i,2) )^2 + ...
				(training_set(training_i,3)- testing_set(testing_i,3) )^2 + (training_set(training_i,4)- testing_set(testing_i,4) )^2 + ...
				(training_set(training_i,5)- testing_set(testing_i,5) )^2 + (training_set(training_i,6)- testing_set(testing_i,6) )^2 + ...
				(training_set(training_i,7)- testing_set(testing_i,7) )^2 + (training_set(training_i,8)- testing_set(testing_i,8) )^2 + ...
			  (training_set(training_i,9)- testing_set(testing_i,9) )^2  + (training_set(training_i,10)- testing_set(testing_i,10) )^2;
		dist(training_i) = sqrt(temp1);
	end
	[outputmin output_i] = min(dist);
	output_class(testing_i) = training_class(output_i);
	clear dist;
end

output_class = output_class'; %'

end