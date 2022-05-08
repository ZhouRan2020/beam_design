function bin_v = DEC2BIN(dec,N_c)
%输入: 标量dec, 标量N_c; 输出N_c*1的行向量bin_v
%dec是一个十进制数, N_c是二进制位数, bin_v是生成的N_c位的二进制向量
%先把dec转换成二进制字符串，再把二进制字符串转换成二进制向量
%%
% 利用matlab自带函数dec2bin()将dec转换成二进制字符串bin_ch
bin_ch=dec2bin(dec,N_c);
%%
% 逐位将二进制字符串转换成二进制向量
bin_v=zeros(1,N_c);
for i=1:N_c
    if bin_ch(i)=='0'
        bin_v(1,i)=0;
    else
        bin_v(1,i)=1;
    end
end
end
