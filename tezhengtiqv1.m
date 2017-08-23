function tezheng= tezhengtiqv1(data)
ss=size(data);
Fs=100;%����Ƶ��
fc=10;%��ֹƵ��
WC=2*pi*fc;%��ֹ��Ƶ��
N=5;%����
[b,a]=butter(N,WC,'s');
[bz,az]=impinvar(b,a,Fs);%�弤��Ӧ���䷨
k = 1:ss;                                   %????????????
for i=1:6
x=data(:,i);
data(:,i)=(filtfilt(bz,az,x'))';
end
      %��ֵ
      fac1=mean(data(:,1));
      fac2=mean(data(:,4));
      %��׼��
      fac3=std(data(:,1),1,1);
      fac4to6=std(data(:,4:6),1,1);
      %����
      fac7=fac3.^2;
      fac8to10=fac4to6.^2;
      
      %��ֵ
      fac11=median(data(:,1));
      fac12=median(data(:,4));
      
      %AI��Tʱ����������ٶȵ�ʸ���;�ֵ
      mi=sqrt(data(:,1).^2+data(:,2).^2+data(:,3).^2);
      fac13=mean(mi);  
   
      %VI��Tʱ����mi�ķ���
      fac14=mean((mi-fac13).^2);
      
      %SMA�����ٶ��źŵķ�ֵ
      sma=sum(abs(data(:,1)))+sum(abs(data(:,2)))+sum(abs(data(:,3)));
      fac15=sma/N;
        
      %���
      fac16=kurtosis(data(:,1));
      fac17=kurtosis(data(:,2));
      fac18=kurtosis(data(:,4));
      fac19=kurtosis(data(:,5));
        
      %ƫ��
      fac20=skewness(data(:,1));
        
      %�ķ�λ��
      fac21to26=iqr(data);
      r=[range(data(21:220,:));range(data(121:320,:));range(data(221:420,:));range(data(321:520,:))];
      fac27to32=mean(r);  
      %����
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
      %25�ٷ�λ��
      fac48to53=prctile(data,25);
      
      %75�ٷ�λ��
      fac54to59=prctile(data,75);
      
      %���ݳ������ݵ���ֱ���ٶȱ仯������ǰ���ֵ�ͺ���ֵ
      fac60=mean(data(1:N/2,1));
      fac61=mean(data(N/2+1:N,1));
      
      factor=[fac1,fac2,fac3,fac4to6,fac7,fac8to10,fac11,fac12,fac13,fac14,fac15,fac16,fac17,fac18,fac19,fac20,fac21to26,fac27to32];
      factor=[factor,fac33,fac34,fac35,fac36,fac37,fac38,fac39,fac40,fac41,fac42,fac43,fac44,fac45,fac46,fac47,fac48to53,fac54to59,fac60,fac61];
      tezheng=factor;


end