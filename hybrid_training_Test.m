function Status = hybrid_training_Test()
File=load('speech'); Files=load('Features3');
%=====================SVM==================================%
%==================Speech Disorder======================================%
rng(10);
HybridSVMStruct_categories = fitcsvm(Files.File_hybrid_features,File.categories,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('hybridmodels.mat','HybridSVMStruct_categories','-append');
%==================Speech Emotions======================================%
%------------------Angry----------------------------------------
rng(10);
Features=[Files.File_hybrid_features(1:12,:);Files.File_hybrid_features(13:24,:)];
Angry_Happy=[File.emotions(1:12,:);File.emotions(13:24,:)];
HybridSVMStruct_angry_happy = fitcsvm(Features,Angry_Happy,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('hybridmodels.mat','HybridSVMStruct_angry_happy','-append');
rng(10);
Features=[Files.File_hybrid_features(1:12,:);Files.File_hybrid_features(25:36,:)];
Angry_Neutral=[File.emotions(1:12,:);File.emotions(25:36,:)];
HybridSVMStruct_angry_neutral = fitcsvm(Features,Angry_Neutral,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('hybridmodels.mat','HybridSVMStruct_angry_neutral','-append');
rng(10);
Features=[Files.File_hybrid_features(1:12,:);Files.File_hybrid_features(37:46,:)];
Angry_Sad=[File.emotions(1:12,:);File.emotions(37:46,:)];
HybridSVMStruct_angry_sad = fitcsvm(Features,Angry_Sad,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('hybridmodels.mat','HybridSVMStruct_angry_sad','-append');
%-----------------Happy-----------------------------------------
rng(10);
Features=[Files.File_hybrid_features(13:24,:);Files.File_hybrid_features(1:12,:)];
Happy_Angry=[File.emotions(13:24,:);File.emotions(1:12,:)];
HybridSVMStruct_happy_angry = fitcsvm(Features,Happy_Angry,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('hybridmodels.mat','HybridSVMStruct_happy_angry','-append');
rng(10);
Features=[Files.File_hybrid_features(13:24,:);Files.File_hybrid_features(25:36,:)];
Happy_Neutral=[File.emotions(13:24,:);File.emotions(25:36,:)];
HybridSVMStruct_happy_neutral = fitcsvm(Features,Happy_Neutral,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('hybridmodels.mat','HybridSVMStruct_happy_neutral','-append');
rng(10);
Features=[Files.File_hybrid_features(13:24,:);Files.File_hybrid_features(37:46,:)];
Happy_Sad=[File.emotions(13:24,:);File.emotions(37:46,:)];
HybridSVMStruct_happy_sad = fitcsvm(Features,Happy_Sad,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('hybridmodels.mat','HybridSVMStruct_happy_sad','-append');
%-----------------Neutral---------------------------------------
rng(10);
Features=[Files.File_hybrid_features(25:36,:);Files.File_hybrid_features(13:24,:)];
Neutral_Happy=[File.emotions(25:36,:);File.emotions(13:24,:)];
HybridSVMStruct_neutral_happy = fitcsvm(Features,Neutral_Happy,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('hybridmodels.mat','HybridSVMStruct_neutral_happy','-append');
rng(10);
Features=[Files.File_hybrid_features(25:36,:);Files.File_hybrid_features(1:12,:)];
Neutral_Angry=[File.emotions(25:36,:);File.emotions(1:12,:)];
HybridSVMStruct_neutral_angry = fitcsvm(Features,Neutral_Angry,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('hybridmodels.mat','HybridSVMStruct_neutral_angry','-append');
rng(10);
Features=[Files.File_hybrid_features(25:36,:);Files.File_hybrid_features(37:46,:)];
Neutral_Sad=[File.emotions(25:36,:);File.emotions(37:46,:)];
HybridSVMStruct_neutral_sad = fitcsvm(Features,Neutral_Sad,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('hybridmodels.mat','HybridSVMStruct_neutral_sad','-append');

%-----------------Sad--------------------------------------
rng(10);
Features=[Files.File_hybrid_features(37:46,:);Files.File_hybrid_features(1:12,:)];
Sad_Angry=[File.emotions(37:46,:);File.emotions(1:12,:)];
HybridSVMStruct_sad_angry = fitcsvm(Features,Sad_Angry,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('hybridmodels.mat','HybridSVMStruct_sad_angry','-append');
rng(10);
Features=[Files.File_hybrid_features(37:46,:);Files.File_hybrid_features(25:36,:)];
Sad_Neutral=[File.emotions(37:46,:);File.emotions(25:36,:)];
HybridSVMStruct_sad_neutral = fitcsvm(Features,Sad_Neutral,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('hybridmodels.mat','HybridSVMStruct_sad_neutral','-append');
rng(10);
Features=[Files.File_hybrid_features(37:46,:);Files.File_hybrid_features(13:24,:)];
Sad_Happy=[File.emotions(37:46,:);File.emotions(13:24,:)];
HybridSVMStruct_sad_happy = fitcsvm(Features,Sad_Happy,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('hybridmodels.mat','HybridSVMStruct_sad_happy','-append');
%======================KNN=============================================%
%==================Speech Disorder======================================%

rng(100);
HybridKNNStruct_categories = fitcknn(Files.File_hybrid_features,File.categories,'NumNeighbors',1);
save('hybridmodels.mat','HybridKNNStruct_categories','-append');

%==================Speech Emotions======================================%

rng(100);
HybridKNNStruct_emotions = fitcknn(Files.File_hybrid_features,File.emotions,'NumNeighbors',1);
save('hybridmodels.mat','HybridKNNStruct_emotions','-append');
%==================NN======================================%
%----(1)----------Frequency--------------

[HybridNNStruct_categories,HybridNNTr_categories] = neural_network_trainingcat(Files.File_hybrid_features,File.categories_nn);
save('hybridmodels.mat','HybridNNStruct_categories','-append');
save('hybridmodels.mat','HybridNNTr_categories','-append');
figure, plotperform(HybridNNTr_categories);
figure, plottrainstate(HybridNNTr_categories);
%==================Speech Emotions======================================%
%----(1)----------Frequency--------------
[HybridNNStruct_emotions,HybridNNTr_emotions]  = neural_network_trainingem(Files.File_hybrid_features,File.emotions_nn);
save('hybridmodels.mat','HybridNNStruct_emotions','-append');
save('hybridmodels.mat','HybridNNTr_emotions','-append');
figure, plotperform(HybridNNTr_emotions);
figure, plottrainstate(HybridNNTr_emotions);
%======================DTW================================================%
 %--------------Normal------------
 [rn,cn]=find(strcmp(File.categories,'Normal'));
 HybridDTWNormal_features=mean(Files.File_hybrid_features(rn,:));
 save('hybridmodels.mat','HybridDTWNormal_features','-append');
 %---------------Special-------------------
 [rn,cn]=find(strcmp(File.categories,'Special'));
 HybridDTWSpecial_features=mean(Files.File_hybrid_features(rn,:));
 save('hybridmodels.mat','HybridDTWSpecial_features','-append');
 %----------------Angry--------------------------------
  [rn,cn]=find(strcmp(File.emotions,'Angry'));
 HybridDTWAngry_features=mean(Files.File_hybrid_features(rn,:));
 save('hybridmodels.mat','HybridDTWAngry_features','-append');
 %--------------Happy----------------------------------
  [rn,cn]=find(strcmp(File.emotions,'Happy'));
 HybridDTWHappy_features=mean(Files.File_hybrid_features(rn,:));
 save('hybridmodels.mat','HybridDTWHappy_features','-append');
 %-------------Neutral-------------------
  [rn,cn]=find(strcmp(File.emotions,'Neutral'));
 HybridDTWNeutral_features=mean(Files.File_hybrid_features(rn,:));
 save('hybridmodels.mat','HybridDTWNeutral_features','-append');
 %------------------Sad-------------------------------
  [rn,cn]=find(strcmp(File.emotions,'Sad'));
 HybridDTWSad_features=mean(Files.File_hybrid_features(rn,:));
 save('hybridmodels.mat','HybridDTWSad_features','-append');
Status= 'Hybrid Model has been Trained';