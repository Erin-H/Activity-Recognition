function [w,eigvector]= zhuchengfen( data,weishu )
  fea = data(:,1:weishu-1);
      gnd = data(:,weishu);
      options = [];
      
      [eigvector, eigvalue] = LSDA(gnd, options, fea);
      w= fea*eigvector;
% [PC,latent,explained]=pcacov(data);
% %PC
% w=PC(1,:);
end

