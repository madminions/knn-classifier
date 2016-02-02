clear;
[ a b c d e ]=textread('iris.data',"%f %f %f %f %s","delimiter",",");
temp = b(1:50,:);
x= temp;
temp = d(1:50,:);
y=temp;

plot(x,y,'rd');
hold on;
xlabel('sepal width');
ylabel('petal width');

temp = b(50:100,:);
x= temp;
temp = d(50:100,:);
y=temp;
plot(x,y,'bd');


temp = b(100:end,:);
x= temp;
temp = d(100:end,:);
y=temp;
plot(x,y,'gd');

training_set = [ b d ];
x_points = 2:0.1:4.5;
y_points = 0:0.1:2.5;
training_class = e;

% computing K(=1) nearest neighbour algorithm for each testing_set compute shortest distance point

for i=1:26
	for j=1:26
		testing_set( 26*(i-1) + j,1)=x_points(1,i);
		testing_set( 26*(i-1) + j,2)=y_points(1,j);
	end
end


testing_set_length = length(testing_set);
training_set_length = length(training_set);

for testing_i = 1:testing_set_length
	for training_i = 1:training_set_length
		temp1=(training_set(training_i,1)- testing_set(testing_i,1) )^2 + (training_set(training_i,2)- testing_set(testing_i,2) )^2 ;
		dist(training_i) = sqrt(temp1);
	end
	[outputmin output_i] = min(dist);
	output_class(testing_i) = training_class(output_i);
	clear dist;
end
hold on;
output_class = output_class'; %'
length_output_class = length(output_class);

%{
for i=1:length_output_class
	if(strcmp(output_class{i},'Iris-setosa')==1)
		plot(testing_set(i,1),testing_set(i,2),'rd');
	elseif(strcmp(output_class{i},'Iris-versicolor')==1)
		plot(testing_set(i,1),testing_set(i,2),'bd');
	elseif(strcmp(output_class{i},'Iris-virginica')==1)
		plot(testing_set(i,1),testing_set(i,2),'gd');
	endif
end
%}

row=1;
i=1;
while( i<=length_output_class)
	if(strcmp(output_class{i},'Iris-setosa')!=1)
		%plot(testing_set(i,1),testing_set(i,2) );
		decision_boundary(row,1)=testing_set(i,1);
		decision_boundary(row,2)=testing_set(i,2);
		row++;
	if(i<length_output_class-26)
		while(strcmp(output_class{i},'Iris-setosa')!=1)
			i++;
		endwhile
	endif
	endif
i++;
endwhile

plot(decision_boundary(:,1),decision_boundary(:,2),'o-k');

clear decision_boundary;
i=1;
row=1;
while( i<=length_output_class)
	if(strcmp(output_class{i},'Iris-virginica')==1)
		%plot(testing_set(i,1),testing_set(i,2) );
		decision_boundary(row,1)=testing_set(i,1);
		decision_boundary(row,2)=testing_set(i,2);
		row++;
	if(i<length_output_class-26)
		while(strcmp(output_class{i},'Iris-virginica')==1)
			i++;
		endwhile
	endif
	endif
i++;
endwhile

length_dec = length(decision_boundary);
for i=1:length_dec
	if(decision_boundary(i,1)==4.5)
		collect_i(end+1)=i;
	endif
end
decision_boundary(collect_i,:)=[];

plot(decision_boundary(:,1),decision_boundary(:,2),'o-k');
