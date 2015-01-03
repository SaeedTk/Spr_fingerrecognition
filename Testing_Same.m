Underline='_';
partE='.dat';
[templatefile , pathname]= uigetfile('*.dat','Open An Fingerprint template file'); 
ins_num=0
partA=100;
avg=0;
for j=1:1:10
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
avg=avg+percent_match;
ins_num=ins_num+1;
end
end
avg=avg/ins_num;
msgbox(num2str(avg));
