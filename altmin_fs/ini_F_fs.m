function F_RF_fs = ini_F_fs(N_t,N_RF,b)
%随机初始化F_RF_fs
%%
%首先生成离散的角度集合ps
ps=linspace(-1,1,2^b);
%初始化
F_RF_fs=ones(N_t,N_RF);
%每个元素随机赋值
for i=1:N_t
    for j=1:N_RF
        F_RF_fs(i,j)=exp(1i.*pi.*ps(randi([1 2^b],1,1)));
    end
end
end


