function [status]= cleardata(Flag)
if(Flag==1)
File=load('speech');
File.FileName={}; 
FileName=File.FileName;
save('speech.mat','FileName','-append');
File.emotions={};  
emotions=File.emotions; 
save('speech.mat','emotions','-append');
File_Path={FilePath};
File.FilePath={}; 
FilePath=File.FilePath;
save('speech.mat','FilePath','-append');
File.categories={};
categories=File.categories;
save('speech.mat','categories','-append');
status='Data is cleared';
end