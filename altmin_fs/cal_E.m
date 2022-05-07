function error = cal_E(vn,fbb,theta)
%输入：标量vn，列向量fbb，行向量theta；输出：标量error
%vn是复数标量，是待逼近的量；fbb是给定的数字波束成形向量；theta是已经求出的未归一化[-pi,pi]角度向量
%给定这些量，可以计算逼近误差
frf=exp(1i.*theta);%行向量
error=abs(vn-frf*fbb);%误差
end

