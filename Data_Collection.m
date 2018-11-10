function [First_Migration, Second_Migration, Total_Migration, Num_Diff_Edu_Obj] = Data_Collection(Source_Country, total_num)

First_Migration = zeros(6,4);
Second_Migration = zeros(4,6);
Total_Migration = zeros(6,6);
Num_Diff_Edu_Obj = zeros(6,4);

for i = 1:total_num                                                               %i-----number of refugees
    i
    
    for j = 1:4                                                                   %j-----transition country
        for l = 1:6                                                               %l-----source country
            if Source_Country(3, i) == j && Source_Country(5, i) == l
                First_Migration(l, j) = First_Migration(l, j) + 1;
            end
            
            for m = 1:6                                                           %m-----objective country
                if Source_Country(2, i) == m && Source_Country(5, i) == l
                    Total_Migration(l, m) = Total_Migration(l, m) + 1;
                end
            end
        end
        
        for m = 1:6
            if Source_Country(2, i) == m && Source_Country(3, i) == j
                Second_Migration(j, m) = Second_Migration(j, m) + 1;
            end
        end
    end
    
    for m = 1:6
        if m == Source_Country(2, i)
            if Source_Country(1, i) == 0
                    Num_Diff_Edu_Obj(m, 1) = Num_Diff_Edu_Obj(m, 1) + 1;
            else
                if Source_Country(1, i) > 0 && Source_Country(1,i) <= 8
                        Num_Diff_Edu_Obj(m, 2) = Num_Diff_Edu_Obj(m, 2) + 1;
                else
                    if Source_Country(1, i) > 8 && Source_Country(1, i) <= 12
                            Num_Diff_Edu_Obj(m, 3) = Num_Diff_Edu_Obj(m, 3) + 1;
                    else
                        if Source_Country(1, i) > 12
                                Num_Diff_Edu_Obj(m, 4) = Num_Diff_Edu_Obj(m, 4) + 1;
                        end
                    end
                end
            end
        end
    end
    
end
Total_Migration = Total_Migration / 4;