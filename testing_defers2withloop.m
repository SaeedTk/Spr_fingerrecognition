Underline='_';
partE='.dat';
[templatefile , pathname]= uigetfile('*.dat','Open An Fingerprint template file'); 
partA=100;
avg=0;
singular=20;
Num_Ins=0;
for k=1:1:10
partA=partA+1;
partB=1;
tempoffirstDat=strcat(num2str(partA),char(Underline),num2str(partB),char(partE));
FirstDat=strcat(pathname,tempoffirstDat);
finger1=load(char(FirstDat));
partC=partA;

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
avg=avg+percent_match-singular;
Num_Ins=Num_Ins+1;
end
end
end
avg=avg/Num_Ins;
msgbox(num2str(avg));
