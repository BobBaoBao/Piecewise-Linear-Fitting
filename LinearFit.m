function [a, b, e] = LinearFit( x, y, i, j )
%�Ը�����һ���ͺ���ֵ���Լ�����ϵ����䣬��������ϵ�ϵ��a��b��������
%LinearFit( x, y )
%   x:  (n+1)����֪����ֵ�ĵ�
%   y:  (n+1)����֪���Ӧ�ĺ���ֵ
%   i:  ������������ʼ���±꣨��0����
%   j:  ������������ֹ���±꣨��0����

%   a:  ������Ϻ�����һ����ϵ��
%   b:  ������Ϻ����ĳ�����ϵ��
%   e:  ������ϵ����

    %��a��b
    aa = polyfit(x(i + 1 : j + 1), y(i + 1 : j + 1), 1);
    a = aa(1);
    b = aa(2);
    
    %��������ϵ����
    e = 0;
    for m = (i + 1) : (j + 1)
        e = e + (a * x(m) + b - y(m))^2;
    end
    
end
