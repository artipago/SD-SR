function [pairs]=creatingSubSetPairs(m)

%m is your 35, number of stimuli

a=load('finalPairToBeUsed.mat');
finalPairsToBeUsed=a.finalPairsToBeUsed;

k=8;
for ii=1:m
    tempOnes=ii*ones(k,2);
    finalPairsToBeUsed=[finalPairsToBeUsed; tempOnes];
end

vect=1:size(finalPairsToBeUsed,1);
vect=Shuffle(vect);
pairs=finalPairsToBeUsed(vect,:);

sum(pairs(:,1)==pairs(:,2))/length(pairs(:,1))


