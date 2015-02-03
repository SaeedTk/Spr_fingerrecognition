Underline='_';
partE='.dat';
[templatefile , pathname]= uigetfile('*.dat','Open An Fingerprint template file'); 
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
reshtenew='102_6';
%%%%%%%%%%%bayad az inja hazf she bere toye script dige %%%%%%%%%%%%%%%
if isempty(strfind(BL,reshtenew))
    display('wrong');
    %%%%code aaadi bayad gharar begire
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%ta inja
avg=avg/ins_num;
msgbox(num2str(avg));

