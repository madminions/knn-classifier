% computing K nearest neighbour algorithm
%{==================================== For Wine Data ==========================================%}
clear;close all;clc;
%=============================================KNN K= 1==========================================
printf('Knn classifier for WINE DATA for K=1 random subsampling \n');

for iteration = 1:10
	[testing_set,training_set,testing_class,training_class]=readPermute();
	output_class = compute(testing_set,training_set,training_class);

	positive=0;
	m = length(testing_set);
	for i=1:m
		if( output_class(i,1) == testing_class(i,1) )
			positive=positive+1;
		endif
	end
	mean_matrix(iteration)=positive/length(testing_set)*100;
	confusion_matrix = confusionMatrix(testing_class,output_class)
end %iteration for
printf('Mean for K=1 is   %f \n',mean(mean_matrix));
printf('Standard Deviation for K=1 is   %f \n',std(mean_matrix) );

%=============================================KNN K = 3 =========================================
printf('Knn classifier for WINE DATA for K=3 random subsampling \n');
clear;
for iteration = 1:10
	[testing_set,training_set,testing_class,training_class]=readPermute();
	output_class = computethreeNN(testing_set,training_set,training_class);

	positive=0;
	m = length(testing_set);
	for i=1:m
		if( output_class(i,1) == testing_class(i,1) )
			positive=positive+1;
		endif
	end
	mean_matrix(iteration)=positive/length(testing_set)*100;
	confusion_matrix = confusionMatrix(testing_class,output_class)
end %iteration for

printf('Mean for K=3 is   %f \n',mean(mean_matrix));
printf('Standard Deviation for K=3 is   %f \n',std(mean_matrix) );

%=====================================KNN 5 folds cross validation===============================
clear;
printf('Knn classifier for WINE DATA for K=1 five folds cross validation \n');
for i=1:10
	mean_matrix(i) = readPermutefor5foldsK1();
end
mean_matrix
printf("Grand Mean for 5 folds for K=1 is %f\n", mean(mean_matrix));
printf('Standard Deviation for 5 folds for K=1  %f \n',std(mean_matrix) );

printf('Knn classifier for Wine DATA for K=3 five folds cross validation \n');
clear;
for i=1:10
	mean_matrix(i) = readPermutefor5foldsK3();
end
mean_matrix
printf("Grand Mean for 5 folds for K=3 is %f\n", mean(mean_matrix));
printf('Standard Deviation for 5 folds for K=3   %f \n',std(mean_matrix) );
