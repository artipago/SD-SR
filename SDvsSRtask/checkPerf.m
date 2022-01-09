function checkPerf(output1,output2,output3,output4,output5,output6,output7,output8)

figure
hold on
plot(1,mean([output1.finalPerf output3.finalPerf output5.finalPerf output7.finalPerf]),'*')
plot(2,mean([output2.finalPerf output4.finalPerf output6.finalPerf output8.finalPerf]),'*')
plot(0.8,([output1.finalPerf output3.finalPerf output5.finalPerf output7.finalPerf]),'*')
plot(2.2,([output2.finalPerf output4.finalPerf output6.finalPerf output8.finalPerf]),'*')
axis([0.5 2.5 50 100])

