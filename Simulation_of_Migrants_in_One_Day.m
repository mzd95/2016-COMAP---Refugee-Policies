tic
load('Distance_O_to_Transit_Land.mat');
load('Distance_O_to_Transit_Water.mat');
load('Distance_Transit_to_Obj.mat');
load('Income_1950.mat');
load('Ave_Income_in_Obj.mat');
load('Ave_Consump_in_Obj.mat');
load('Population_Obj_Country.mat');
total_num = 1000000;
Num_Refugee = zeros(1,6);

s = zeros(5,1000000);                                %Years of education; Obj country; Transition country; Expected Profit per year

[Source_Country, num_Migrants] = Random_Generation_of_Migrants(Source_Country, total_num);
[Source_Country, Num_Refugee] = Selection_of_Obj_Country(Source_Country, total_num);                                          %selection of object country

[Source_Country, Num_Refugee_Transit] = Selection_of_Transition(Source_Country, total_num);                      %selection of route
[First_Migration, Second_Migration, Total_Migration, Num_Diff_Edu_Obj] = Data_Collection(Source_Country, total_num);           %data collection

toc