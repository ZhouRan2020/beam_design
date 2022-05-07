function bin = opti_binary(aim,p)
%输入标量aim，列向量p，输出行向量bin
%给定复数向量p,给定目标复数目标aim,给出使得abs(bin*p-aim)最小的N_c位二进制数bin
%穷举法
N_c=length(p);
%%
%优化过程，目标是逼近误差最小
err_min=inf;
bin=zeros(1,N_c);
for i=0 : 2^N_c-1
    if abs(DEC2BIN(i,N_c)*p-aim)<err_min
        err_min=abs(DEC2BIN(i,N_c)*p-aim);
        bin=DEC2BIN(i,N_c);
    end
end
end