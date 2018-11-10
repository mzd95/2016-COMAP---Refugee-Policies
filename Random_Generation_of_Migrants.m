function [Source_Country, num_Migrants] = Random_Generation_of_Migrants(Source_Country, total_num)
num_Migrants = [0, 0, 0, 0, 0, 0];                             %population of migrants from 6 source countries

for i = 1:total_num
    i
    num = rand(1, 1);
    year = 0;
    Years_of_education = rand(1, 1) * 100;

    if num >= 0 && num <= 0.024                                  %Nigrea
        if Years_of_education >= 0 && Years_of_education <= 55
            year = 0;
        else
            if Years_of_education > 55 && Years_of_education <= 63
                year = (Years_of_education - 55);
            else
                if Years_of_education > 63 && Years_of_education <= 84
                    year = (Years_of_education - 63) * 4 / 21 + 8;
                else
                    if Years_of_education > 84 && Years_of_education <= 100
                        year = (Years_of_education - 84) * 8 / 16 + 12;
                    end
                end
            end
        end
        num_Migrants(4) = num_Migrants(4) + 1;
        Source_Country(1, i) = year;
        Source_Country(5, i) = 4;
    end

    if num > 0.024 && num <= 0.069                                 %Eritrea
        if Years_of_education >= 0 && Years_of_education <= 55
            year = 0;
        else
            if Years_of_education > 55 && Years_of_education <= 63
                year = (Years_of_education - 55);
            else
                if Years_of_education > 63 && Years_of_education <= 84
                    year = (Years_of_education - 63) * 4 / 21 + 8;
                else
                    if Years_of_education > 84 && Years_of_education <= 100
                        year = (Years_of_education - 84) * 8 / 16 + 12;
                    end
                end
            end
        end
        num_Migrants(2) = num_Migrants(2) + 1;
        Source_Country(1, i) = year;
        Source_Country(5, i) = 2;
    end

    if num > 0.069 && num <= 0.629                                %Syria
        if Years_of_education >= 0 && Years_of_education <= 4
            year = 0;
        else
            if Years_of_education > 4 && Years_of_education <= 16
                year = Years_of_education - 4;
            else
                if Years_of_education > 16 && Years_of_education <= 59
                    year = (Years_of_education - 16) * 4 / 43 + 8;
                else
                    if Years_of_education > 59 && Years_of_education <= 100
                        year = (Years_of_education - 59) * 8 / 42 + 12;
                    end
                end
            end
        end
        num_Migrants(6) = num_Migrants(6) + 1;
        Source_Country(1, i) = year;
        Source_Country(5, i) = 6;
    end

    if num > 0.629 && num <= 0.868                               %Afgn
        if Years_of_education >= 0 && Years_of_education <= 6
            year = 0;
        else
            if Years_of_education > 6 && Years_of_education <= 29
                year = (Years_of_education - 6) * 8 / 23;
            else
                if Years_of_education > 29 && Years_of_education <= 79
                    year = (Years_of_education - 29) * 4 / 50 + 8;
                else
                    if Years_of_education > 79 && Years_of_education <= 100
                        year = (Years_of_education - 79) * 8 / 21 + 12;
                    end
                end
            end
        end
        num_Migrants(1) = num_Migrants(1) + 1;
        Source_Country(1, i) = year;
        Source_Country(5, i) = 1;
    end

    if num > 0.868 && num <= 0.897                               %Pakistan
        if Years_of_education >= 0 && Years_of_education <= 40
            year = 0;
        else
            if Years_of_education > 40 && Years_of_education <= 46
                year = (Years_of_education - 40) * 8 / 6;
            else
                if Years_of_education > 46 && Years_of_education <= 81
                    year = (Years_of_education - 46) * 4 / 35 + 8;
                else
                    if Years_of_education > 81 && Years_of_education <= 100
                        year = (Years_of_education - 81) * 8 / 19 + 12;
                    end
                end
            end
        end
        num_Migrants(5) = num_Migrants(5) + 1;
        Source_Country(1, i) = year;
        Source_Country(5, i) = 5;
    end

    if num > 0.897 && num <= 1	                             %Iraq
        if Years_of_education >= 0 && Years_of_education <= 56
            year = 0;
        else
            if Years_of_education > 56 && Years_of_education <= 59
                year = (Years_of_education - 56) * 8 / 6;
            else
                if Years_of_education > 59 && Years_of_education <= 72
                    year = (Years_of_education - 59) * 4 / 13 + 8;
                else
                    if Years_of_education > 72 && Years_of_education <= 100
                        year = (Years_of_education - 72) * 8 / 28 + 12;
                    end
                end
            end
        end
        num_Migrants(3) = num_Migrants(3) + 1;
        Source_Country(1, i) = year;
        Source_Country(5, i) = 3;
    end

end