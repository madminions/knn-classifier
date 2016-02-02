% evaluating confusion matrix
function confusion_matrix = confusionMatrix(testing_class,output_class)
	i=1;
	setosa=0;versicolor=0;virginica=0;
	m = length(testing_class);
	for i=1:m
		if(strcmp(testing_class(i),'Iris-setosa')==1)
			if( strcmp(output_class(i),'Iris-setosa') ==1)
				setosa++;
			elseif( strcmp(output_class(i),'Iris-versicolor') ==1)
				versicolor++;
			elseif( strcmp(output_class(i),'Iris-virginica') ==1)
				virginica++;
			endif
		endif
	end
	confusion_matrix(1,1)=setosa;
	confusion_matrix(1,2)=versicolor;
	confusion_matrix(1,3)=virginica;

	setosa=0;versicolor=0;virginica=0;

	for i=1:m
		if(strcmp(testing_class(i),'Iris-versicolor')==1)
			if( strcmp(output_class(i),'Iris-setosa') ==1)
				setosa++;
			elseif( strcmp(output_class(i),'Iris-versicolor') ==1)
				versicolor++;
			elseif( strcmp(output_class(i),'Iris-virginica') ==1)
				virginica++;
			endif
		endif
	end
	confusion_matrix(2,1)=setosa;
	confusion_matrix(2,2)=versicolor;
	confusion_matrix(2,3)=virginica;

	setosa=0;versicolor=0;virginica=0;

	for i=1:m
		if(strcmp(testing_class(i),'Iris-virginica')==1)
			if( strcmp(output_class(i),'Iris-setosa') ==1)
				setosa++;
			elseif( strcmp(output_class(i),'Iris-versicolor') ==1)
				versicolor++;
			elseif( strcmp(output_class(i),'Iris-virginica') ==1)
				virginica++;
			endif
		endif
	end
	confusion_matrix(3,1)=setosa;
	confusion_matrix(3,2)=versicolor;
	confusion_matrix(3,3)=virginica;
	
endfunction