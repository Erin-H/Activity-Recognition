%计算主成分部分

trainnum=14;
weishu=62;
tezheng=zeros(1,weishu);
W=zeros(trainnum*12*3,weishu);
N=zeros((14-trainnum)*12*3,weishu);
for i=1:12
for l = 1:trainnum
    for j = 1: 3
        try
         eval(['load Subject',num2str(l),'\a',num2str(i),'t',num2str(j)]);
        catch
            %
        end
         data = sensor_readings;
         tezheng = tezhengtiqv1(data);    
        W((i-1)*trainnum*3+(l-1)*3+j,1:weishu-1)=tezheng;
        W((i-1)*trainnum*3+(l-1)*3+j,weishu)=i; 
    end       
end
end
W(:,1:weishu-1) = mapminmax((W(:,1:weishu-1))', 0, 1)';%归一化
% % 画图
% t=1:trainnum*3;
% for i=1:weishu-1
%     figure(i);
%     for j=1:12
%     plot(t,W(t+trainnum*(j-1)*3,i));
%     hold on
%     end
% end
% w=W;
[w,k]=zhuchengfen(W,weishu);
% [PC,latent,explained]=pcacov(W);
% [kk,order]=sort(PC(1,:));
fprintf('数据采集完毕\n');
% t = templateSVM('Standardize',1);
impp=30;
% w=zeros(trainnum*12*3,impp);
% for i=1:impp
%     w(:,i)=W(:,order(i));%order???????????
% end
Mdl1 = fitcecoc(w(:,1:impp),W(:,weishu),'Learners','tree');
Mdl2 = fitcecoc(w(:,1:impp),W(:,weishu),'Learners','svm');
Mdl3 = fitcecoc(w(:,1:impp),W(:,weishu),'Learners','discriminant');
Mdl7 = TreeBagger(30,w(:,1:impp),W(:,weishu));
Mdl4 = ClassificationDiscriminant.fit(w(:,1:impp),W(:,weishu));
fprintf('数据训练完毕\n');
% 
% CVMdl = crossval(Mdl);
% 
% 
% 
% oosLoss = kfoldLoss(CVMdl)






