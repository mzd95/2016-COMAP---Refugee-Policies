bar(n', 1)
legend('\delta = 105', '\delta = 100', '\delta = 95')
set(gca, 'XTickLabel', {'France', 'Germany', 'Hungary', 'Italy', 'Serbia', 'Sweden'})
title('Number of refugees with different value of \delta')

 for i = 1:6
    n_per(1, i) = (n(1, i) - n(2, i)) / n(2, i);
    n_per(2, i) = (n(3, i) - n(2, i)) / n(2, i);
end