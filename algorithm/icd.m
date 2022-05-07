function    v_ideal = icd(N_t,K,S_each)
%输出：列向量v_ideal
angle_sample=linspace(-1,1,K);%行向量
g_Omega_k= normalized_g(angle_sample);%行向量
g_Omega_k=g_Omega_k.';%K*1列向量g_Omega_k
%%
A=zeros(N_t,K);
for i=1:K
    A(:,i)=alpha(N_t,angle_sample(i));
end
A=sqrt(N_t).*A;
R=[real(A'*A),-imag(A'*A);imag(A'*A),real(A'*A)];%2K*2K矩阵R
%%
%初始化待求的K*1列向量Omega, 并由Omega求g
Omega=pi.*(2.*rand(K,1)-1);%K*1列向量Omega [-pi,pi]
g=g_Omega_k.*exp(1i.*Omega);%K*1列向量g
%总迭代次数S_max，本次迭代的是第k个相位
S_max=S_each*K;
for i=1:S_max
    %验证：i=1,更新k=1;i=K,更新k=K;i=S_max,k=mod((S_each-1)K+K-1,K)+1=K;
    k=mod(i-1,K)+1;
    %当前的g的信息即Omega的信息传递给t
    t=[real(g);imag(g)];
    %t的信息传递给d,p,q, 其中d是2K*1列向量
    d_tran=zeros(1,2*K);
    p=0;
    q=0;
    for m=1:2*K
        if (m~=k)&&(m~=k+K)
            d_tran=d_tran+t(m,1)*R(m,:);
            p=p+t(m,1)*R(k,m);
            q=k+t(m,1)*R(k+K,m);
        end
    end
    d=d_tran.';
    %d,p,q的信息传递给alphaa,betaa
    alphaa=g_Omega_k(k,1).*(p+d(k,1))./sqrt((p+d(k,1))^2+(q+d(k+K,1))^2);
    betaa=g_Omega_k(k,1).*(q+d(k+K,1))./sqrt((p+d(k,1))^2+(q+d(k+K,1))^2);
    %利用alphaa,betaa的信息更新Omega，也就是
    %利用当前的Omega推导出下一次的Omega
    %并由下一次的Omega求下一次的g
    Omega(k,1)=angle(alphaa+1i*betaa); %[-pi,pi]
    g=g_Omega_k.*exp(1i.*Omega);
end
%%
%K*1列向量g,N_t*1列向量v_ideal
v_ideal=1/K.*A*g;
v_ideal=v_ideal./norm(v_ideal);
end


