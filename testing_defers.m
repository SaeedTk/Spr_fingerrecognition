partA=110;
Underline='_';
partB=1;
partE='.dat';
[templatefile , pathname]= uigetfile('*.dat','Open An Fingerprint template file'); 
tempoffirstDat=strcat(num2str(partA),char(Underline),num2str(partB),char(partE));
FirstDat=strcat(pathname,tempoffirstDat);
finger1=load(char(FirstDat));
avg=0;

threshold=46;
partC=partA;
Num_Ins=0;
FAR=0;
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
avg=avg/Num_Ins;
msgbox(num2str(avg));
msgbox(num2str(FAR));
msgbox(num2str(Num_Ins));

