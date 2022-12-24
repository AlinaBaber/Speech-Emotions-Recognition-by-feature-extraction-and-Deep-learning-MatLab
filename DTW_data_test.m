function Status = DTW_data_test()
  File=load('test_speech');
 %--------------Normal------------
 [rn,cn]=find(strcmp(File.categories,'Normal'));
 Normal_Features1=mean(File.Features1(rn,:));
 save('dtwdatas.mat','Normal_Features1','-append');
 %---------------Special-------------------
 [rn,cn]=find(strcmp(File.categories,'Special'));
 Special_Features1=mean(File.Features1(rn,:));
 save('dtwdatas.mat','Special_Features1','-append');
 %----------------Angry--------------------------------
  [rn,cn]=find(strcmp(File.emotions,'Angry'));
 Angry_Features1=mean(File.Features1(rn,:));
 save('dtwdatas.mat','Angry_Features1','-append');
 %--------------Happy----------------------------------
  [rn,cn]=find(strcmp(File.emotions,'Happy'));
 Happy_Features1=mean(File.Features1(rn,:));
 save('dtwdatas.mat','Happy_Features1','-append');
 %-------------Neutral-------------------
  [rn,cn]=find(strcmp(File.emotions,'Neutral'));
 Neutral_Features1=mean(File.Features1(rn,:));
 save('dtwdatas.mat','Neutral_Features1','-append');
 %------------------Sad-------------------------------
  [rn,cn]=find(strcmp(File.emotions,'Sad'));
 Sad_Features1=mean(File.Features1(rn,:));
 save('dtwdatas.mat','Sad_Features1','-append');
Status='DTW has been Trained.';