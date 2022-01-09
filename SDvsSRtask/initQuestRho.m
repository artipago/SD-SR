function questStruct=initQuestRho(targetPerf)

    % quest parameters
%     alpha_d=0.5; % alpha for dynamic and static conditions, range [0 1]
%     epsilon=0.0001;
%     if alpha_d < epsilon
%         alpha_d = epsilon;
%     end
%     contrast_d= log(1/alpha_d);
    tGuess_d=240;
    tGuessSd=240;
    pThteshold=targetPerf;
    beta=3.5;
    delta=0.01;
    gamma=0.5;
    step=1;
    range=500;
    questStruct=QuestCreate(tGuess_d,tGuessSd,pThteshold,beta,delta,gamma,step,range);
    questStruct.normalizePdf=1; 

end

