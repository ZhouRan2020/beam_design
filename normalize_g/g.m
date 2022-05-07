function beam_gain = g(Ommega)
%输入行向量Ommega，输出行向量beam_gain
%Ommega是采样角度，beam_gain是采样角度上的增益值
K=length(Ommega);
beam_gain=ones(1,K);
for i=1:K
    beam_gain(1,i)=g_scalar(Ommega(1,i));
end
end

