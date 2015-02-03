function template=fingerTemplateRead
%dialog for opening fingerprint files
%Honors Project 2001~2002
%wuzhili 99050056
%comp sci HKBU
%last update 19/April/2002

[templatefile , pathname]= uigetfile('*.dat','Open An Fingerprint template file'); 
if templatefile ~= 0
%%Pure Code  
%%cd(pathname);
%%template=load(char(templatefile));
%%End of Purecode
%My changes:
temp=strcat(pathname,templatefile);
template=load(char(temp));
%end of my changes
end;
