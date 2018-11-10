function [Source_Country, Num_Refugee, Num_Refugee_Transit] = Selection_of_both(Source_Country, num_Migrants)
load('Income_1950.mat');
load('Ave_Income_in_Obj.mat');
load('Ave_Consump_in_Obj.mat');
load('Population_Obj_Country.mat');
load('Distance_O_to_Transit_Land.mat');
load('Distance_O_to_Transit_Water.mat');
load('Distance_Transit_to_Obj.mat');

Num_Refugee = [0, 0, 0, 0, 0, 0];                                                                          %number of refugee in each objective country
Num_Refugee_Transit = [0, 0, 0, 0];

b = 190;
a = 1100;
policy_guide = [0.8, 0.8, 0.8, 0.8, 0.8, 0.8];                                                             %policy guide in each objective country
year = 20;
t = 0;                                                                                                %transition
land_per_km = 0.16;
water_per_km = 0.12;

for i = 1:6                                                                                           %for source country i
    for j = 1:num_Migrants(i)
        y = [-Inf, -Inf, -Inf, -Inf, -Inf, -Inf];                                                          %income in each objective country
        selection = 0;                                                                                %selection of objective country
        u = [-Inf, -Inf, -Inf, -Inf, -Inf, -Inf];
        obj = Source_Country(2, j, i);                                                                    %object country
        src = i;                                                                                        %source country
        t_temp = 0;
        cost_accident = [0, 0, 0, 0];
        cost_travel = [0, 0, 0, 0];
        dist_land = [Inf, Inf, Inf, Inf];
        dist_water = [0, 0, 0, 0];
        cost = [Inf, Inf, Inf, Inf];
        
        if i == 1 || i == 3 || i == 5 || i == 6                                                             %Afgn, Iraq, Pakistan or Syria
            for k = 1:6
                if k ~= 4                                                                             %not Italy
                    for l = 1:2
                        y(k) = (Source_Country(1, j, i) * b + a) * Ave_Income_in_Obj(k) / Income_1950;
                        u(k) = (policy_guide(k) - 100 * Num_Refugee(k) / Population_Obj_Country(k)) * (y(k) - Ave_Consump_in_Obj(k));
                    end
                end
            end
            selection = find(u == max(u));                                                              %find the object country
        end
        
    end
end