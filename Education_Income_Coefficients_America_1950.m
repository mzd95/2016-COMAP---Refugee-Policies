wage_30_America_1950 = [1082, 1585, 2005, 2478, 2790, 3202, 3642];
education_30_America_1950 = [0, 2.5, 6, 8, 10, 12, 14];
p_30_America_1950 = polyfit(education_30_America_1950, wage_30_America_1950, 1)

wage_40_America_1950 = [1374, 1714, 2191, 2750, 3115, 3614, 4390];
education_40_America_1950 = [0, 2.5, 6, 8, 10, 12, 14];
p_40_America_1950 = polyfit(education_40_America_1950, wage_40_America_1950, 1)