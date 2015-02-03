Underline='_';
partE='.dat';
[templatefile , pathname]= uigetfile('*.dat','please show a file with a format of .dat in source folder'); 
ins_num=0;
partA=100;
avg=0;
%edited for implementing improvments
matchingArray=ones(1,80);
matchingArray(1)=1.5;
matchingArrayCounter=1;
BLcounter=1;
BL=0;
%%%%%
for j=1:1:10
    min=100;
partA=partA+1;
partB=1;
tempoffirstDat=strcat(num2str(partA),char(Underline),num2str(partB),char(partE));
FirstDat=strcat(pathname,tempoffirstDat);
finger1=load(char(FirstDat));

for i=0:1:6
partB=partB+1;
tempofsecond=strcat(num2str(partA),char(Underline),num2str(partB),char(partE));
SecondDat=strcat(pathname,tempofsecond);
finger2=load(char(SecondDat));
percent_match=matching(finger1,finger2,10);
%%%%%%%%%
if min > percent_match
    min=percent_match;
    tempstring='';
    tempstring=strcat(num2str(partA),char(Underline),num2str(partB));
    
end
matchingArray(matchingArrayCounter)=matching(finger1,finger2,10);
matchingArrayCounter=matchingArrayCounter+1;
%%%%%%%%%
avg=avg+percent_match;
ins_num=ins_num+1;
end

BL=strcat(BL,tempstring);
BLcounter=BLcounter+1;
end
threshold=0;
FARArray=ones(1,100);
avgArray=ones(1,100);
FRRArray=ones(1,100);
FARArray(1)=1.5;
GARArray=ones(1,100);
GARArray(1)=1.5;
avgArray(1)=1.5;
FRRArray(1)=1.5;


for threshold=1:1:100
avg=0;
Num_Ins=0;
partA=100;
FAR=0;
FRR=0;
GAR=0;
SameInstanceCounter=0;
for k=1:1:10
partA=partA+1;
partB=1;
tempoffirstDat=strcat(num2str(partA),char(Underline),num2str(partB),char(partE));
FirstDat=strcat(pathname,tempoffirstDat);
finger1=load(char(FirstDat));
partC=partA;
%%%%%%%%%%
partofTestingSame=0;
for i=0:1:7
partofTestingSame=partofTestingSame+1;
tempofTestingSame=strcat(num2str(partA),char(Underline),num2str(partofTestingSame),char(partE));
TestingSame_SecondInstance=strcat(pathname,tempofTestingSame);
finger2_SameInstance=load(char(TestingSame_SecondInstance));
tempstr=strcat(num2str(partA),char(Underline),num2str(partofTestingSame));
if isempty(strfind(BL,tempstr))
    percentmatch_SameInstance=matching(finger1,finger2_SameInstance,10);
    if(percentmatch_SameInstance<threshold)
        FRR=FRR+1;
    end
    SameInstanceCounter=SameInstanceCounter+1;
else
    ttt='1';
end
end
%%%%%%%%%%

%%%%%
for j=1:1:9
   
    partC=partC+1;
   if partC>110 
        partC=101;
   end;
    partB=1;
for i=0:1:7

tempofsecond=strcat(num2str(partC),char(Underline),num2str(partB),char(partE));
partB=partB+1;
SecondDat=strcat(pathname,tempofsecond);
finger2=load(char(SecondDat));
percent_match=matching(finger1,finger2,10);
if threshold <= percent_match 
    FAR=FAR+1;
end;
avg=avg+percent_match;
Num_Ins=Num_Ins+1;
end
end
%%%%%%%

%%%%%%
end
avg=avg/Num_Ins;
FRR=FRR/SameInstanceCounter;
FAR=FAR/Num_Ins;
GAR=1-FRR;
FRRArray(threshold)=FRR;
FARArray(threshold)=FAR;
avgArray(threshold)=avg;
GARArray(threshold)=GAR;


end
 plot(FARArray, 'DisplayName', 'FARArray', 'YDataSource', 'FARArray'); hold all; plot(FRRArray, 'DisplayName', 'FRRArray', 'YDataSource', 'FRRArray'); hold off; figure(gcf);

msgbox(num2str(avg));
msgbox(num2str(FAR));
msgbox(num2str(Num_Ins));
