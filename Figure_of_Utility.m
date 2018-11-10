function [Source_Country, Num_Refugee] = Figure_of_Utility(Source_Country, num_Migrants)

Num_Refugee = [0, 0, 0, 0, 0, 0];                                                                          %number of refugee in each objective country

policy_guide = [0.3, 0.4, 0.4, 0.4, 0.3, 0.5];                                                             %policy guide in each objective country

for i = 1:6                                                                                           %for source country i
    for j = 1:num_Migrants(i)
        y = [-Inf, -Inf, -Inf, -Inf, -Inf, -Inf];                                                          %income in each objective country
        selection = 0;                                                                                %selection of objective country
        
        if i == 1 || i == 3 || i == 5 || i == 6                                                                 %Afgn, Iraq, Pakistan or Syria
            for k = 1:6
                if k ~= 4                                                                             %not Italy
                    y(k) = (Source_Country(1, j, i) * 190 + 1100) * Ave_Income_in_Obj(k) / Income_1950;
                    u(k) = (policy_guide(k) - Num_Refugee(k)) * y(k) - Ave_Consump_in_Obj(k);
                end
            end
            selection = find(u == max(u));                                                              %find the object country
        end
        
        if i == 2 || i == 4                                                                               %Eiritrea or Nigria
            for k = 1:6
                if k ~= 3 && k ~= 5                                                                     %not Hungary or Serbia
                    y(k) = (Source_Country(1, j, i) * 190 + 1100) * Ave_Income_in_Obj(k) / Income_1950;
                    u(k) = (policy_guide(k) - Num_Refugee(k)) * y(k) - Ave_Consump_in_Obj(k);
                end
            end
            selection = find(u == max(u));                                                              %find the object country
        end
        
        Source_Country(2, j, i) = selection;
        Num_Refugee(selection) = Num_Refugee(selection) + 1;
    end
end