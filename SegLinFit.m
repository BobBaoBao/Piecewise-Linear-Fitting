function [ k, indexes, as, bs, ee ] = SegLinFit( x, y, e )
%�Ը�����һ���ͺ���ֵ�������㾫�ȵ�ǰ���£������ٵ����������зֶ��������
%SegLinFit( x, y, e )
%   x:  (n+1)����֪����ֵ�ĵ�
%   y:  (n+1)����֪���Ӧ�ĺ���ֵ
%   e:  �����������

%   k:  ���ֵ����ٶ���
%   indexes:    (k-1)���ֵ���±꣨��0����
%   a:  k������������Ϻ�����һ����ϵ��
%   b:  k������������Ϻ����ĳ�����ϵ��
%   ee: ���շֶ�������ϵ����

    %��x����Ϊn�������ֳ�(n-1)��
    for k = 1 : (length(x) - 1)
        [as, bs, indexes, ee ] = SegFitRecu(x, y, 0, length(x) - 1, k);
        if ee <= e
            break;
        end
    end
end

