x = 1 : 10;
y = f(x);
e = 10;

plot(x, y, '*');

[k, indexes, as, bs, ee] = SegLinFit(x, y, e);

fprintf('\n����Ҫ��%d��\n���Ϊ%f\n', k, ee);
fprintf('ÿ�ε�������Ϻ���Ϊ��\n');

if k == 1
    fprintf('%.2f*x+%.2f\n', as(1), bs(1));
else
    for i = 1 : k
        if i == 1
            s = 0;
        else
            s = indexes(i - 1);
        end
        if i == k
            t = length(x) - 1;
        else
            t = indexes(i);
        end
        fprintf('��%d�Σ�x%d~x%d����%.2f*x+%.2f\n', i, s, t, as(i), bs(i));
    end
end