function [a, b, indexes, e ] = SegFitRecu( x, y, i, j, k )
%�Ը�����һ���ͺ���ֵ�����з�k�ε�������ϣ��ݹ飩
% SegFitRecu( x, y, k )
%   x:  (n+1)����֪����ֵ�ĵ�
%   y:  (n+1)����֪���Ӧ�ĺ���ֵ
%   i:  ���ֶ�����������ʼ���±꣨��0����
%   j:  ���ֶ�����������ֹ���±꣨��0����
%   k:  ���ֵĶ���

%   a:  k������������Ϻ�����һ����ϵ��
%   b:  k������������Ϻ����ĳ�����ϵ��
%   indexes:    (k-1)���ֵ���±꣨��0����
%   e:  �ֶ�������ϵ������
    
    if k == 1
        [a, b, e] = LinearFit(x, y, i, j);
        indexes = [];
    elseif k > 1
        best_e = Inf;
        best_a = zeros(1, k);
        best_b = zeros(1, k);
        best_indexes = zeros(1, k - 1);
        
        for m = (i + 1) : (j - 1)
            %xi~xm���������������
            [a0, b0, e1] = LinearFit(x, y, i, m);
            %xm~xj��(k-1)���������
            [a, b, indexes, e2] = SegFitRecu(x, y, m, j, k - 1);
            %���浱ǰ�����С�����Ч����õķ��������
            if e1 + e2 < best_e
                best_a = [a0, a];
                best_b = [b0, b];
                best_e = e1 + e2;
                best_indexes = [m, indexes];
            end
        end
        
        a = best_a;
        b = best_b;
        e = best_e;
        indexes = best_indexes;
    end
end

