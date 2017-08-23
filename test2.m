N=zeros(20,weishu);  
for i=1:20
    

        try
         eval(['load unknow\unknow',num2str(i)]);
            
        catch
            %
        end
         data = sensor_readings;
         tezheng = tezhengtiqv1(data); 
         
     
        N(i,1:weishu-1)=tezheng;
     
    end
   
           

N(:,1:weishu-1) = mapminmax((N(:,1:weishu-1))', 0, 1)';
% n=zeros(20,impp);
% for i=1:impp
%     n(:,i)=N(:,order(i));
% end
n=N(:,1:weishu-1)*k;
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
[k ll]=mode(hist(i,:));
b=[b;k ll];
end
(b(:,1))'

