function newQuest = QuestForget(oldQuest,memlength)

newQuest=oldQuest;
newQuest.intensity=zeros(size(newQuest.intensity));
newQuest.response=zeros(size(newQuest.response));
newQuest.trialCount=memlength;
newQuest.intensity(1:memlength)=oldQuest.intensity(oldQuest.trialCount-memlength+1:oldQuest.trialCount);
newQuest.response(1:memlength)=oldQuest.response(oldQuest.trialCount-memlength+1:oldQuest.trialCount);
newQuest=QuestRecompute(newQuest);
