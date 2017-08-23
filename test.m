N=zeros(((14-trainnum)*60),weishu);  
for i=1:12
    
for l = 1:14
    for j = 4: 5
        try
         eval(['load Subject',num2str(l),'\a',num2str(i),'t',num2str(j)]);
            
        catch
            %
        end
         data = sensor_readings;
         tezheng = tezhengtiqv1(data); 
         
         (i-1)*14*2+(l-1)*2+(j-3)
        N((i-1)*14*2+(l-1)*2+(j-3),1:weishu-1)=tezheng;
        N((i-1)*14*2+(l-1)*2+(j-3),weishu)=i; 
    end
   
           
end


end
N(:,1:weishu-1) = mapminmax((N(:,1:weishu-1))', 0, 1)';
% n=zeros((14*2*12),impp);
% for i=1:impp
%     n(:,i)=N(:,order(i));
% end  
n=N(:,1:weishu-1)*k;
% n=N(:,1:weishu-1);
hist=[];
for i=1:4
Mdl=eval(['Mdl',int2str(i)])
yfit = predict(Mdl, n(:,1:impp));
hist=[hist,yfit]
end
yfit = str2double(predict(Mdl7, n(:,1:impp)));
hist=[hist,yfit];
m=size(hist);
b=[];
for i = 1 : m
[k, ll]=mode(hist(i,:));
b=[b;k ll];
end
b
%yfit = predict(Mdl, N(:,1:weishu-1))
ss=size(yfit);
accu=zeros(1,6);
for i=1:ss
    for l=1:5
    if(hist(i,l)==N(i,weishu))
        accu(1,l)=accu(1,l)+1;
    end
    end
    end
for i=1:ss
    
    if(b(i,1)==N(i,weishu))
        accu(1,6)=accu(1,6)+1;
    end
    
end
accu

fprintf('数据测试正确率为%d\n',accu(1,6)/(14*12*2));
