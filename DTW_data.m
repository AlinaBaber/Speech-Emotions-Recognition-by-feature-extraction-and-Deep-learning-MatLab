function Status = DTW_data()
  File=load('speech');
 %--------------Normal------------
 [rn,cn]=find(strcmp(File.categories,'Normal'));
 Normal_features=mean(File.features(rn,:));
 save('dtwdata.mat','Normal_features','-append');
 %---------------Special-------------------
 [rn,cn]=find(strcmp(File.categories,'Special'));
 Special_features=mean(File.features(rn,:));
 save('dtwdata.mat','Special_features','-append');
 %----------------Angry--------------------------------
  [rn,cn]=find(strcmp(File.emotions,'Angry'));
 Angry_features=mean(File.features(rn,:));
 save('dtwdata.mat','Angry_features','-append');
 %--------------Happy----------------------------------
  [rn,cn]=find(strcmp(File.emotions,'Happy'));
 Happy_features=mean(File.features(rn,:));
 save('dtwdata.mat','Happy_features','-append');
 %-------------Neutral-------------------
  [rn,cn]=find(strcmp(File.emotions,'Neutral'));
 Neutral_features=mean(File.features(rn,:));
 save('dtwdata.mat','Neutral_features','-append');
 %------------------Sad-------------------------------
  [rn,cn]=find(strcmp(File.emotions,'Sad'));
 Sad_features=mean(File.features(rn,:));
 save('dtwdata.mat','Sad_features','-append');
Status='DTW has been Trained.';