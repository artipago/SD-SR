function output=pilot2(subjectName,taskType,pairs,blockNumber)

% DESCRIPTION OF THE TASK AND CONDITIONS:
% Pilot tasks: same different or spatial location task.

% if taskType==1 %real SD
% % if taskType==2 %real SR

% if longFlag==1 nTrials = 60;
% if longFlag==0 nTrials = 4;


% AA 2017, Nov

%% ========================================================================
%                          General Parameters
%  ========================================================================

screens       = Screen('Screens');
whichScreen   = max(screens);
% [w dimWindow] = Screen('OpenWindow',whichScreen, 0, [0 0 640 480]); %debug mode yo!
[w dimWindow] = Screen('OpenWindow',whichScreen, 0);

% Screen center position
centerx    = dimWindow(3)/2;
centery    = dimWindow(4)/2;

% Screen dimentions
winWidth   = dimWindow(3) - dimWindow(1);
winHeight  = dimWindow(4) - dimWindow(2);
winSizeVec = [winWidth winHeight winWidth winHeight];

      %% ========================================================================
%                           Task parameters
%  ========================================================================

totalNumberOfBlocksInTheSession=18;
blockPairs=pairs((blockNumber-1)*size(pairs,1)/totalNumberOfBlocksInTheSession+1:blockNumber*size(pairs,1)/totalNumberOfBlocksInTheSession,:);
numHex1=blockPairs(:,1);
numHex2=blockPairs(:,2);
    
% numHex1=pairs(:,1);
% numHex2=pairs(:,2);

nTrials=length(numHex1);
if mod(nTrials,2)~=0
    nTrials=nTrials+1;
end


rho=180;
theta=3; %in degree

thetaVect=theta.*Shuffle([ones(1,nTrials/2) -1*ones(1,nTrials/2)]);

thetas1=Shuffle([45*ones(1,nTrials/2) 135*ones(1,nTrials/2)])+thetaVect;
thetas2=thetas1+180;

deltaX=30.*(rand(1,nTrials)-0.5);
deltaY=30.*(rand(1,nTrials)-0.5);

posX1=rho.*cosd(thetas1)+deltaX;
posX2=rho.*cosd(thetas2)+deltaX;

posY1=rho.*sind(thetas1)+deltaY;
posY2=rho.*sind(thetas2)+deltaY;



        
if taskType==1 %pilot SD
    correctResponse=[numHex1==numHex2];
%     sum(correctResponse)/length(correctResponse)
elseif taskType==2 %real SR
    correctResponse=zeros(1,nTrials);
    correctResponse(thetas1==45-theta | thetas1==135+theta)=0;
    correctResponse(thetas1==45+theta | thetas1==135-theta)=1;
end

% Colors
bkgColor=200;
stmColor=150;
white = WhiteIndex(w);
black = BlackIndex(w);
blue=[0 0 255 255];
green=[0 255 0 255];
red=[255 0 0 255];
scalingFactor=0.5;
imageStruct=creatingTheImageStruct(stmColor,bkgColor,scalingFactor);


rotatingVector=[-225 0 0 -90 0 0 -90 90 0 180 0 180 -45 0 45 -45 -45 0 0 -90 90 -45 0 90 90 135 135 45 45 225 -45 -45 -45 0 0];
for ii=1:length(rotatingVector) %which is 35
    tex(ii) = Screen('MakeTexture', w, imageStruct(ii).image);
end

% Screen refresh rate and inter-frame interval
resolution  = Screen('Resolution',whichScreen); 
refRate     = resolution.hz;
ifi         = Screen('GetFlipInterval',w);

% Fonts
Screen('Preference','DefaultFontName' ,'Arial');
Screen('Preference','DefaultFontSize' ,20);

    
    


%% ========================================================================
%                       Key response Parameters
%  ========================================================================

KbName('UnifyKeyNames');
escKey = KbName('ESCAPE');
sameVerticalButton = KbName('p');
differentHorizontalButton = KbName('q'); 

%% ========================================================================
%                   Initializing the psychtoolbox
%  ========================================================================

% Suppress all warnings for better timing precision
oldScreenVerbosityLevel = Screen('Preference', 'Verbosity', 0);
oldLevel                = Screen('Preference', 'VisualDebugLevel',0);
oldEnableFlag           = Screen('Preference', 'SuppressAllWarnings', 1);
Screen('Preference','SkipSyncTests', 0);

% Increase priority for better timing precision
priorityLevel           = MaxPriority(w);
Priority(priorityLevel);
    

%% ========================================================================
%                           Start experiment
%  ========================================================================
    outlpt1(100);  %startExp
    stime=GetSecs;
    while GetSecs-stime<0.0005 end; 
    outlpt1(0);
    
HideCursor;
Screen(w,'FillRect',bkgColor); 
Screen('TextSize',w, 20);
if taskType==1
    DrawFormattedText(w,['Same-Different task - Block: ' int2str(blockNumber) ' ... PRESS TO START ...'],'center','center',white);
elseif taskType==2
    DrawFormattedText(w,['Vertical-Horizontal task - Block: ' int2str(blockNumber) ' ... PRESS TO START ...'],'center','center',white);
end
Screen('Flip',w);

% Wait for single keystroke..
[secs, keyCode, deltaSecs] = KbWait([],2);

if keyCode(escKey)
    Priority(0);
    ShowCursor;
    Screen('CloseAll');
    return;    
end;

timeCrossBeginning=0.350; %it's in seconds
timeDisplayStimuli=.033333; %it's in seconds
timeBeforeAnswer=1-timeDisplayStimuli; %it's in seconds
timeDisplayFeedback=0.350;

performance=0;
pause(.5); % Wait for 500 ms to start with the first trial 
response= 100*ones(1,nTrials);

corruptedTrials=zeros(1,length(numHex1));
for tt = 1:length(numHex1)
% for tt = 1:30
    

    DrawFormattedText(w,'+','center','center',black);
    Screen(w,'FillRect',bkgColor);
    [timeBeginTrial(tt)] = Screen('Flip',w);
    
    outlpt1(101);  %trial begin
    stime=GetSecs;
    while GetSecs-stime<0.0005 end; 
    outlpt1(0);

    pause(timeCrossBeginning);
       
    imgheight=size(imageStruct(numHex1(tt)).image,1);
    imgwidth=size(imageStruct(numHex1(tt)).image,2);
    imgheight2=size(imageStruct(numHex2(tt)).image,1);
    imgwidth2=size(imageStruct(numHex2(tt)).image,2);
    
    rect1=[centerx + posX1(tt) - imgwidth/2, centery-posY1(tt)- imgheight/2 ,centerx + posX1(tt) + imgwidth/2,centery-posY1(tt)+ imgheight/2 ];
    rect2=[centerx + posX2(tt) - imgwidth2/2, centery-posY2(tt)- imgheight2/2 ,centerx + posX2(tt) + imgwidth2/2,centery-posY2(tt)+ imgheight2/2 ];

%     Screen('PutImage', w, imageStruct(numHex1(tt)).image,rect1);
%     Screen('PutImage', w, imageStruct(numHex2(tt)).image,rect2);

    Screen('DrawTextures', w, tex(numHex1(tt)), [], rect1,rotatingVector(numHex1(tt)));
    Screen('DrawTextures', w, tex(numHex2(tt)), [], rect2,rotatingVector(numHex2(tt)));
    
    DrawFormattedText(w,'+','center','center',black);
%     [timeStimuli(tt)] = Screen('Flip',w);
    Screen('Flip',w);
    onsetStimTime(tt)=GetSecs; %or something like that
        
    outlpt1(102);  %stimulus on
    stime=GetSecs;
    while GetSecs-stime<0.0005 end; 
    outlpt1(0);

    
 
    %% ====================================================================
    %                        Response collection
    %  ====================================================================

    
    Screen(w,'FillRect',bkgColor);
    DrawFormattedText(w,'+','center','center',black);
    
    while GetSecs-onsetStimTime(tt) < timeDisplayStimuli-(0.5/refRate)
    end
   
    Screen('Flip',w);
    offsetStimTime(tt)=GetSecs; %or something like that
    
    
    
%     pause(timeBeforeAnswer);
    loopIn=0;
    indexTime=0;
    tic
    while loopIn==0 & indexTime<11 
        [~,~,keyCode,~] = KbCheck([],2);
        pause(0.1)
        sum(keyCode)
        if sum(keyCode)~=0
            sound(sin(2*pi*[0:1/44100:.1]*1000),8000)
            loopIn=1;
            corruptedTrials(tt)=1;
        else 
            indexTime=indexTime+1;
        end
    end
    toc
        
        
    outlpt1(103);  %time to response 
    stime=GetSecs;
    while GetSecs-stime<0.0005 end; 
    outlpt1(0);

    
    Screen(w,'FillRect',bkgColor);
    DrawFormattedText(w,'+','center','center',blue);
    [timeBlueCross(tt)] = Screen('Flip',w);
    [timeResponse(tt),keyCode,deltaSecs] = KbWait([],2);
    
    
    outlpt1(104);  %actual response 
    stime=GetSecs;
    while GetSecs-stime<0.0005 end; 
    outlpt1(0);
    
    
    if keyCode(sameVerticalButton)==1 % participant thinks it's same or vertical
        response(tt) = 1;
    elseif keyCode(differentHorizontalButton)==1 % participant thinks it's different or horizontal 
        response(tt) = 0;
    else  % participant don't think - timeOut :P
        response(tt) = 100;
    end
    if correctResponse(tt)==response(tt) %the participant is actually correct
        DrawFormattedText(w,'+','center','center',green);
        Screen('Flip',w);
        performance=performance+1;
        pause(timeDisplayFeedback);
    else
        DrawFormattedText(w,'+','center','center',red);
        Screen('Flip',w);
        pause(timeDisplayFeedback);
    end
    
end


%% END of EXPERIMENT
finalPerf=(performance/tt)*100;
Screen(w,'FillRect',black);
DrawFormattedText(w,'END OF THE BLOCK\n\n','center','center',white);
DrawFormattedText(w,['your performance is: ' int2str(finalPerf) '%'],'center',(winHeight/2)+50,white);
Screen('Flip',w);

    outlpt1(105);  %end of exp
    stime=GetSecs;
    while GetSecs-stime<0.0005 end; 
    outlpt1(0);
    
[secs, keyCode, deltaSecs] = KbWait([],2);
   
output.response=response;
output.timeResponse=timeResponse;
output.correctResponse=correctResponse;
output.onsetStimTime=onsetStimTime;
% output.timeStimuli=timeStimuli;
output.offsetStimTime=offsetStimTime;

output.rho=rho;
output.theta=theta;
output.thetaVect=thetaVect;

output.performance=performance;
output.nTrials=nTrials;

output.corruptedTrials=corruptedTrials;
output.timeBlueCross=timeBlueCross;
output.blockNumber=blockNumber;
output.pairs=pairs;

%% save data
savedir = fullfile('C:\Documents and Settings\alamia\My Documents\MATLAB\artVis\data\pilot2\',subjectName);
if ~exist(savedir)
    mkdir(savedir);
end
% dateTime = datestr(now,'yyyy-mm-dd_HHhMM');
dateTime = datestr(now,30);
fileName= [subjectName '_' dateTime];
% fileName= [subjectName '.mat'];
save(fullfile(savedir,fileName));



Screen('CloseAll')
ShowCursor;



