clear
%image1=loadimage;
%in tike teste khodame bara khondan
partA=109;

 Underline='_';
partB=0;
partD='.tif';
partE='.dat';
for i=0:1:7
partB=partB+1;

imagefile1=strcat(num2str(partA),char(Underline),num2str(partB),char(partD));
sourcepath=imagefile1;
destpath=strcat(num2str(partA),char(Underline),num2str(partB),char(partE));
cd('C:\Users\Yadboode_AleX\Desktop\fingerprint\yytang_99050056_program_3\source Edited\DB1_B');
image1=readimage(imagefile1);
image1=255-double(image1);
% ta inja
image1=histeq(uint8(image1));
imagesc(image1);
image1=fftenhance(image1,0.45);
imagesc(image1);
image1=adaptiveThres(double(image1),32);
W=str2double(char('16'));
[o1Bound,o1Area]=direction(image1,W);
[o2,o1Bound,o1Area]=drawROI(image1,o1Bound,o1Area);
o1=im2double(bwmorph(o2,'thin',Inf));
imagesc(o1,[0,1]);
o1=im2double(bwmorph(o1,'clean'));
o1=im2double(bwmorph(o1,'hbreak'));
o1=im2double(bwmorph(o1,'spur'));
imagesc(o1,[0,1]);
w=16;
[end_list1,branch_list1,ridgeMap1,edgeWidth]=mark_minutia(o1,o1Bound,o1Area,w);
show_minutia(o1,end_list1,branch_list1);
[pathMap1,real_end1,real_branch1]=remove_spurious_Minutia(o1,end_list1,branch_list1,o1Area,ridgeMap1,edgeWidth);
show_minutia(o1,real_end1,real_branch1);
%W=inputdlg('test');
%W=char(W);
save(destpath,'real_end1','pathMap1','-ASCII');
end;