function [questStruct,estimate]=updatingQuest(n,questStruct,correct)
    
%     correct=1;
    epsilon=0.0001;
    for ii=1:n
        estimate(ii)=max(QuestQuantile(questStruct),epsilon);
        estimate(ii)=-estimate(ii)+360;
        questStruct = QuestUpdate(questStruct,estimate(ii),correct);
%         questStruct = QuestUpdate(questStruct,estimate(ii),mod(ii,2));
    end

end
