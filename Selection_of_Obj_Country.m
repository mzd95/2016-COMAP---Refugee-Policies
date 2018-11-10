function [Source_Country, Num_Refugee] = Selection_of_Obj_Country(Source_Country, total_num)
load('Income_1950.mat');
load('Ave_Income_in_Obj.mat');
load('Ave_Consump_in_Obj.mat');
load('Population_Obj_Country.mat');

coeff = 100;
b = 190;
a = 1100;
policy_guide = [0.76, 0.76, 0.76, 0.76, 0.76, 0.76];                                                             %policy guide in each objective country
Num_Refugee = [0, 0, 0, 0, 0, 0];

for i = 1:total_num                                                                                     
    i
        y = [-Inf, -Inf, -Inf, -Inf, -Inf, -Inf];                                                          %income in each objective country
        selection = 0;                                                                                %selection of objective country
        u = [-Inf, -Inf, -Inf, -Inf, -Inf, -Inf];
        src = Source_Country(5, i);
        
        if src == 1 || src == 3 || src == 5 || src == 6                                                             %Afgn, Iraq, Pakistan or Syria
            for k = 1:6
                    y(k) = (Source_Country(1, i) * b + a) * (Ave_Income_in_Obj(k) - Ave_Consump_in_Obj(k)) / Income_1950;
                    u(k) = (policy_guide(k) - coeff * Num_Refugee(k) / Population_Obj_Country(k)) * y(k);
            end
            if max(u) > 0
                selection = find(u == max(u));                                                              %find the object country
            end
        end
        
        if src == 2 || src == 4                                                                             %Eiritrea or Nigria
            for k = 1:6
                if k ~= 3 && k ~= 5                                                                     %not Hungary or Serbia
                    y(k) = (Source_Country(1, i) * b + a) * (Ave_Income_in_Obj(k) - Ave_Consump_in_Obj(k)) / Income_1950;
                    u(k) = (policy_guide(k) - coeff * Num_Refugee(k) / Population_Obj_Country(k)) * y(k);
                end
            end
            if max(u) > 0
                selection = find(u == max(u));                                                              %find the object country
            end
        end
        
        if selection ~= 0
            Num_Refugee(selection) = Num_Refugee(selection) + 1;
            Source_Country(2, i) = selection;
            Source_Country(4, i) = u(selection);
        end
end