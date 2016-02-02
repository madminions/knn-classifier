% evaluating confusion matrix
% setosa = class 1 versicolor = class 2 virginica = class 3

function confusion_matrix = confusionMatrix(testing_class,output_class)
	i=1;
	setosa=0;versicolor=0;virginica=0;
	m = length(testing_class);
	for i=1:m
		if( testing_class(i) == 1 )
			if( output_class(i) == 1 )
				setosa++;
			elseif( output_class(i) ==2 )
				versicolor++;
			elseif( output_class(i) == 3 )
				virginica++;
			endif
		endif
	end
	confusion_matrix(1,1)=setosa;
	confusion_matrix(1,2)=versicolor;
	confusion_matrix(1,3)=virginica;

	setosa=0;versicolor=0;virginica=0;

	for i=1:m
		if( testing_class(i) == 2 )
			if( output_class(i) == 1)
				setosa++;
			elseif( output_class(i) == 2 )
				versicolor++;
			elseif( output_class(i) == 3 )
				virginica++;
			endif
		endif
	end
	confusion_matrix(2,1)=setosa;
	confusion_matrix(2,2)=versicolor;
	confusion_matrix(2,3)=virginica;

	setosa=0;versicolor=0;virginica=0;

	for i=1:m
		if( testing_class(i) == 3 )
			if( output_class(i) == 1)
				setosa++;
			elseif( output_class(i) == 2 )
				versicolor++;
			elseif( output_class(i) == 3 )
				virginica++;
			endif
		endif
	end
	confusion_matrix(3,1)=setosa;
	confusion_matrix(3,2)=versicolor;
	confusion_matrix(3,3)=virginica;
	
endfunction