bar(n', 1)
legend('P = 0.8', 'P = 0.5', 'P = 0.2')
set(gca, 'XTickLabel', {'France', 'Germany', 'Hungary', 'Italy', 'Serbia', 'Sweden'})
title('Number of refugees with different value of P')

 for i = 1:6
    n_per(1, i) = (n(1, i) - n(2, i)) / n(2, i);
    n_per(2, i) = (n(3, i) - n(2, i)) / n(2, i);
end