% Reading permutation of data

function [mean_matrix] = readPermutefor5foldsK3()
	[ a b c d e ]=textread('iris.data',"%f %f %f %f %s","delimiter",",");

	permutation = randperm(150);
	read_temp = [ a b c d ];
	read_temp = read_temp( permutation,:);

	training_set = read_temp;
	testing_set = read_temp;
	read_tempclass = e(permutation,:);
	
	start=1;
	training_length = length(training_set);
	for i=1:5
		training_set = read_temp;
		training_class = read_tempclass;
		if(i==1)
			start=1;
		else
			start=(i-1)*training_length/5;
		endif
		testing_set = read_temp( start : i*end/5,:);
		training_set(start: i*end/5,:)=[];
		testing_class = read_tempclass(start : i*end/5,:);
		training_class(start : i*end/5,:)=[];

		output_class = computethreeNN(testing_set,training_set,training_class);
		positive=0;
		m = length(testing_set);
		for iter=1:m
			if( strcmp(output_class{iter,1},testing_class{iter} )==1 )
				positive++;
			endif
		end
		confusion_matrix = confusionMatrix(testing_class,output_class)
		mean_matrix_5folds(i)=positive/length(testing_set)*100;
	end
	mean_matrix = mean(mean_matrix_5folds);

endfunction