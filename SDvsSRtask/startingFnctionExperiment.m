function startingFnctionExperiment()

%training part
[pairsT]=creatingAllPairs(35); 
outputSD=expBlock('trainSD',0,0,0.65,1,pairsT,1);
outputSR=expBlock('trainSR',0,0,0.8,2,pairsT,1);


subjectName='FC';

eegFlag=1;
saveFlag=1;
targetSDperf=0.5;

[pairs]=creatingAllPairs(35); 
output1=expBlock(subjectName,eegFlag,saveFlag,targetSDperf,1,pairs,1,0);
output2=expBlock(subjectName,eegFlag,saveFlag,min(output1.finalPerf/100,0.8),2,pairs,2,0);
output3=expBlock(subjectName,eegFlag,saveFlag,targetSDperf,1,pairs,3,output1);
output4=expBlock(subjectName,eegFlag,saveFlag,min(output3.finalPerf/100,0.8),2,pairs,4,output2);
output5=expBlock(subjectName,eegFlag,saveFlag,targetSDperf,1,pairs,5,output3);
output6=expBlock(subjectName,eegFlag,saveFlag,min(output5.finalPerf/100,0.8),2,pairs,6,output4);
output7=expBlock(subjectName,eegFlag,saveFlag,targetSDperf,1,pairs,7,output5);
output8=expBlock(subjectName,eegFlag,saveFlag,min(output7.finalPerf/100,0.8),2,pairs,8,output6);

checkPerf(output1,output2,output3,output4,output5,output6,output7,output8)

[pairs2]=creatingAllPairs(35); 
output21=expBlock(subjectName,eegFlag,saveFlag,targetSDperf,1,pairs2,1,output7);
output22=expBlock(subjectName,eegFlag,saveFlag,min(output21.finalPerf/100,0.8),2,pairs2,2,output8);
output23=expBlock(subjectName,eegFlag,saveFlag,targetSDperf,1,pairs2,3,output21);
output24=expBlock(subjectName,eegFlag,saveFlag,min(output23.finalPerf/100,0.8),2,pairs2,4,output22);
output25=expBlock(subjectName,eegFlag,saveFlag,targetSDperf,1,pairs2,5,output23);
output26=expBlock(subjectName,eegFlag,saveFlag,min(output25.finalPerf/100,0.8),2,pairs2,6,output24);
output27=expBlock(subjectName,eegFlag,saveFlag,targetSDperf,1,pairs2,7,output25);
output28=expBlock(subjectName,eegFlag,saveFlag,min(output27.finalPerf/100,0.8),2,pairs2,8,output26);

checkPerf(output21,output22,output23,output24,output25,output26,output27,output28)
