% evaluating confusion matrix
% setosa = class 1 versicolor = class 2 

function confusion_matrix = confusionMatrix(testing_class,output_class)
	i=1;
	setosa=0;versicolor=0;virginica=0;
	m = length(testing_class);
	for i=1:m
		if( testing_class(i) == 2 )
			if( output_class(i) == 2 )
				setosa++;
			elseif( output_class(i) ==4 )
				versicolor++;
			endif
		endif
	end
	confusion_matrix(1,1)=setosa;
	confusion_matrix(1,2)=versicolor;

	setosa=0;versicolor=0;virginica=0;

	for i=1:m
		if( testing_class(i) == 4 )
			if( output_class(i) == 2)
				setosa++;
			elseif( output_class(i) == 4 )
				versicolor++;
			endif
		endif
	end
	confusion_matrix(2,1)=setosa;
	confusion_matrix(2,2)=versicolor;

endfunction