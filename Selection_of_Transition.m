function [Source_Country, Num_Refugee_Transit] = Selection_of_Transition(Source_Country, total_num)

load('Distance_O_to_Transit_Land.mat');
load('Distance_O_to_Transit_Water.mat');
load('Distance_Transit_to_Obj.mat');

year = 20;
t = 0;                                                                                                %transition
Num_Refugee_Transit = [0, 0, 0, 0];
land_per_km = 0.16;
water_per_km = 0.12;

for i = 1:total_num                                                                                    %for source country i
    i
        obj = Source_Country(2, i);                                                                    %object country
        src = Source_Country(5, i);                                                                                        %source country
        t_temp = 0;
        cost_accident = [0, 0, 0, 0];
        cost_travel = [0, 0, 0, 0];
        dist_land = [Inf, Inf, Inf, Inf];
        dist_water = [0, 0, 0, 0];
        cost = [Inf, Inf, Inf, Inf];
        if obj ~= 0
            for k = 1:4
                if Distance_O_to_Transit_Land(src, k) < 100000 && Distance_Transit_to_Obj(k, obj) < 100000            %if the route is avialable
                    dist_land(k) = Distance_O_to_Transit_Land(src, k) + Distance_Transit_to_Obj(k, obj);              %overall travel distance on land 
                    dist_water(k) = Distance_O_to_Transit_Water(src, k);                                         %overall travel distance by water
                
                    if (src == 1 || src == 3 || src == 5 || src == 6) && k == 2                                              %cost of accidents during travel on water
                        cost_accident(2) = year * Source_Country(4, i) * 477 / 72000;                                 %water to Greece
                    end
                    if (src == 2 || src == 4) && k == 3
                        cost_accident(3) = year * Source_Country(4, i) * 2860 / 150000;                              %water to Italy
                    end
                    if (src == 2 || src == 4) && k == 4
                        cost_accident(4) = year * Source_Country(4, i) * 69 / 20000;                                 %water to Spain
                    end
                
                    cost_travel(k) = dist_land(k) * land_per_km + dist_water(k) * water_per_km;                     %cost on transportations during travel
                    cost(k) = cost_travel(k) + cost_accident(k);
                end
            end
            t_temp = find(cost == min(cost));
            Source_Country(3, i) = t_temp;
            Num_Refugee_Transit(t_temp) = Num_Refugee_Transit(t_temp) + 1;
        end
end