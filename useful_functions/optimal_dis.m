function y=optimal_dis(x,b)
%输入标量x,b，输出标量y
%标量x是取值在[-1,1]的归一化角度，标量y是取值在[-1,1]的归一化角度，b是量化位数
%穷举法
%%
%首先生成离散的角度集合ps
ps=linspace(-1,1,2^b);
%%
%穷举法的优化过程,遍历可能取值的离散角度集合
err_min=inf;
y=0;
for i=1:2^b
    if(abs(x-ps(1,i))<err_min)
        err_min=abs(x-ps(1,i));
        y=ps(1,i);
    end
end
end
