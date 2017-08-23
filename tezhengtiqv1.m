function tezheng= tezhengtiqv1(data)
ss=size(data);
Fs=100;%采样频率
fc=10;%截止频率
WC=2*pi*fc;%截止角频率
N=5;%阶数
[b,a]=butter(N,WC,'s');
[bz,az]=impinvar(b,a,Fs);%冲激响应不变法
k = 1:ss;                                   %????????????
for i=1:6
x=data(:,i);
data(:,i)=(filtfilt(bz,az,x'))';
end
      %均值
      fac1=mean(data(:,1));
      fac2=mean(data(:,4));
      %标准差
      fac3=std(data(:,1),1,1);
      fac4to6=std(data(:,4:6),1,1);
      %方差
      fac7=fac3.^2;
      fac8to10=fac4to6.^2;
      
      %中值
      fac11=median(data(:,1));
      fac12=median(data(:,4));
      
      %AI：T时间内三轴加速度的矢量和均值
      mi=sqrt(data(:,1).^2+data(:,2).^2+data(:,3).^2);
      fac13=mean(mi);  
   
      %VI：T时间内mi的方差
      fac14=mean((mi-fac13).^2);
      
      %SMA：加速度信号的幅值
      sma=sum(abs(data(:,1)))+sum(abs(data(:,2)))+sum(abs(data(:,3)));
      fac15=sma/N;
        
      %峰度
      fac16=kurtosis(data(:,1));
      fac17=kurtosis(data(:,2));
      fac18=kurtosis(data(:,4));
      fac19=kurtosis(data(:,5));
        
      %偏度
      fac20=skewness(data(:,1));
        
      %四分位差
      fac21to26=iqr(data);
      r=[range(data(21:220,:));range(data(121:320,:));range(data(221:420,:));range(data(321:520,:))];
      fac27to32=mean(r);  
      %方差
      cor=corrcoef(data);
      fac33=cor(2,1);
      fac34=cor(3,1);
      fac35=cor(3,2);
      fac36=cor(4,1);
      fac37=cor(4,2);
      fac38=cor(4,3);
      fac39=cor(5,1);
      fac40=cor(5,2);
      fac41=cor(5,3);
      fac42=cor(5,4);
      fac43=cor(6,1);
      fac44=cor(6,2);
      fac45=cor(6,3);
      fac46=cor(6,4);
      fac47=cor(6,5);
      %25百分位点
      fac48to53=prctile(data,25);
      
      %75百分位点
      fac54to59=prctile(data,75);
      
      %根据乘坐电梯的竖直加速度变化，增加前半均值和后半均值
      fac60=mean(data(1:N/2,1));
      fac61=mean(data(N/2+1:N,1));
      
      factor=[fac1,fac2,fac3,fac4to6,fac7,fac8to10,fac11,fac12,fac13,fac14,fac15,fac16,fac17,fac18,fac19,fac20,fac21to26,fac27to32];
      factor=[factor,fac33,fac34,fac35,fac36,fac37,fac38,fac39,fac40,fac41,fac42,fac43,fac44,fac45,fac46,fac47,fac48to53,fac54to59,fac60,fac61];
      tezheng=factor;


end