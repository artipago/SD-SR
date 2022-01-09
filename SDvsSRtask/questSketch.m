function questSketch()

%     tGuessSd=60;
    qInit=initQuest();
    
    n=100;
    [qCorrect,estimatesC]=updatingQuest(n,qInit,1);
    [qWrong,estimatesW]=updatingQuest(n,qInit,0);

%     qCorrect=QuestRecompute(qCorrect);
%     qWrong=QuestRecompute(qWrong);
    
    figure
    subplot(1,2,1)
    hold on
    plot(qCorrect.x,qCorrect.pdf,'r')
    plot(qWrong.x,qWrong.pdf,'b')
    plot(qInit.x,qInit.pdf,'k')
    subplot(1,2,2)
    hold on
    plot(estimatesC,'r')
    plot(estimatesW,'b')
    
    guessCorrect=QuestQuantile(qCorrect)
    guessWrong=QuestQuantile(qWrong)
    
end






