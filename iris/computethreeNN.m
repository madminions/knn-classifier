%3NN
function output_class = computethreeNN(testing_set,training_set,training_class)

% for each testing_set compute shortest distance point
	testing_set_length = length(testing_set);
	training_set_length = length(training_set);

	for testing_i = 1:testing_set_length
		for training_i = 1:training_set_length
			temp1=(training_set(training_i,1)- testing_set(testing_i,1) )^2 + (training_set(training_i,2)- testing_set(testing_i,2) )^2 + ...
				  (training_set(training_i,3)- testing_set(testing_i,3) )^2  + (training_set(training_i,4)- testing_set(testing_i,4) )^2;
			dist(training_i) = sqrt(temp1);
		end
		
		[outputmin1 output_i1] = min(dist);
		dist(output_i1) = 999999999;
		[outputmin2 output_i2] = min(dist);
		dist(output_i2) = 999999999;
		[outputmin3 output_i3] = min(dist);

		setosa=0;
		versicolor=0;
		virginica=0;

		if( strcmp( training_class(output_i1) , 'Iris-setosa')==1 )
			setosa++;
		elseif( strcmp( training_class(output_i1) , 'Iris-versicolor')==1 )
			versicolor++;
		elseif( strcmp( training_class(output_i1) , 'Iris-virginica')==1 )
			virginica++;
		endif

		if( strcmp( training_class(output_i2) , 'Iris-setosa')==1 )
			setosa++;
		elseif( strcmp( training_class(output_i2) , 'Iris-versicolor')==1 )
			versicolor++;
		elseif( strcmp( training_class(output_i2) , 'Iris-virginica')==1 )
			virginica++;
		endif

		if( strcmp( training_class(output_i3) , 'Iris-setosa')==1 )
			setosa++;
		elseif( strcmp( training_class(output_i3) , 'Iris-versicolor')==1 )
			versicolor++;
		elseif( strcmp( training_class(output_i3) , 'Iris-virginica')==1 )
			virginica++;
		endif

		if(setosa==1 && versicolor==1 && virginica==1)
			output_class(testing_i) = training_class(output_i1);
		elseif(setosa==0 && versicolor==2 && virginica==1)
			output_class(testing_i) = training_class(output_i2);
		elseif(setosa==0 && versicolor==1 && virginica==2)
			output_class(testing_i) = training_class(output_i3);
		elseif(setosa==2 && versicolor==0 && virginica==1)
			output_class(testing_i) = training_class(output_i1);
		elseif(setosa==1 && versicolor==0 && virginica==2)
			output_class(testing_i) = training_class(output_i3);
		elseif(setosa==1 && versicolor==2 && virginica==0)
			output_class(testing_i) = training_class(output_i2);
		elseif(setosa==2 && versicolor==1 && virginica==0)
			output_class(testing_i) = training_class(output_i1);
		
		elseif(setosa==3 && versicolor==0 && virginica==0)
			output_class(testing_i) = training_class(output_i1);
		elseif(setosa==0 && versicolor==3 && virginica==0)
			output_class(testing_i) = training_class(output_i2);
		elseif(setosa==0 && versicolor==0 && virginica==3)
			output_class(testing_i) = training_class(output_i3);

		endif
		
		clear dist;clear setosa;clear versicolor;clear virginica;
	end	% outer for loop ends

	output_class = output_class'; %'

endfunction