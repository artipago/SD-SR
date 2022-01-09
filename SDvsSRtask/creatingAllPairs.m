function [pairs]=creatingAllPairs(m)

%m in your case is 35

v1=[];
v2=[];

k=8;
for ii=1:m
    vectTemp=Shuffle(1:m);
    vectTemp(ii)=[];
    v1=[v1 ii*ones(1,k) ii*ones(1,k)];
    v2=[v2 ii*ones(1,k) vectTemp(1:k)];

end
pairs=[v1' v2'];
pairs=Shuffle(pairs,2);
sum(pairs(:,1)==pairs(:,2))/length(pairs(:,1));


