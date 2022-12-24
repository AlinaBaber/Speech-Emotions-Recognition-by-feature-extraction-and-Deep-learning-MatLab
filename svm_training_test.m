function [Status] = svm_training_test()
File=load('test_speech');
%==================Speech Disorder======================================%
rng(10);
SVMStruct_categories = fitcsvm(File.Features1,File.categories,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('svmmodel.mat','SVMStruct_categories','-append');
%==================Speech Emotions======================================%
%------------------Angry----------------------------------------
rng(10);
Features=[File.Features1(1:12,:);File.Features1(13:24,:)];
Angry_Happy=[File.emotions(1:12,:);File.emotions(13:24,:)];
SVMStruct_angry_happy = fitcsvm(Features,Angry_Happy,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('svmmodel.mat','SVMStruct_angry_happy','-append');
rng(10);
Features=[File.Features1(1:12,:);File.Features1(25:36,:)];
Angry_Neutral=[File.emotions(1:12,:);File.emotions(25:36,:)];
SVMStruct_angry_neutral = fitcsvm(Features,Angry_Neutral,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('svmmodel.mat','SVMStruct_angry_neutral','-append');
rng(10);
Features=[File.Features1(1:12,:);File.Features1(37:46,:)];
Angry_Sad=[File.emotions(1:12,:);File.emotions(37:46,:)];
SVMStruct_angry_sad = fitcsvm(Features,Angry_Sad,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('svmmodel.mat','SVMStruct_angry_sad','-append');
%-----------------Happy-----------------------------------------
rng(10);
Features=[File.Features1(13:24,:);File.Features1(1:12,:)];
Happy_Angry=[File.emotions(13:24,:);File.emotions(1:12,:)];
SVMStruct_happy_angry = fitcsvm(Features,Happy_Angry,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('svmmodel.mat','SVMStruct_happy_angry','-append');
rng(10);
Features=[File.Features1(13:24,:);File.Features1(25:36,:)];
Happy_Neutral=[File.emotions(13:24,:);File.emotions(25:36,:)];
SVMStruct_happy_neutral = fitcsvm(Features,Happy_Neutral,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('svmmodel.mat','SVMStruct_happy_neutral','-append');
rng(10);
Features=[File.Features1(13:24,:);File.Features1(37:46,:)];
Happy_Sad=[File.emotions(13:24,:);File.emotions(37:46,:)];
SVMStruct_happy_sad = fitcsvm(Features,Happy_Sad,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('svmmodel.mat','SVMStruct_happy_sad','-append');
%-----------------Neutral---------------------------------------
rng(10);
Features=[File.Features1(25:36,:);File.Features1(13:24,:)];
Neutral_Happy=[File.emotions(25:36,:);File.emotions(13:24,:)];
SVMStruct_neutral_happy = fitcsvm(Features,Neutral_Happy,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('svmmodel.mat','SVMStruct_neutral_happy','-append');
rng(10);
Features=[File.Features1(25:36,:);File.Features1(1:12,:)];
Neutral_Angry=[File.emotions(25:36,:);File.emotions(1:12,:)];
SVMStruct_neutral_angry = fitcsvm(Features,Neutral_Angry,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('svmmodel.mat','SVMStruct_neutral_angry','-append');
rng(10);
Features=[File.Features1(25:36,:);File.Features1(37:46,:)];
Neutral_Sad=[File.emotions(25:36,:);File.emotions(37:46,:)];
SVMStruct_neutral_sad = fitcsvm(Features,Neutral_Sad,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('svmmodel.mat','SVMStruct_neutral_sad','-append');

%-----------------Sad--------------------------------------
rng(10);
Features=[File.Features1(37:46,:);File.Features1(1:12,:)];
Sad_Angry=[File.emotions(37:46,:);File.emotions(1:12,:)];
SVMStruct_sad_angry = fitcsvm(Features,Sad_Angry,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('svmmodel.mat','SVMStruct_sad_angry','-append');
rng(10);
Features=[File.Features1(37:46,:);File.Features1(25:36,:)];
Sad_Neutral=[File.emotions(37:46,:);File.emotions(25:36,:)];
SVMStruct_sad_neutral = fitcsvm(Features,Sad_Neutral,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('svmmodel.mat','SVMStruct_sad_neutral','-append');
rng(10);
Features=[File.Features1(37:46,:);File.Features1(13:24,:)];
Sad_Happy=[File.emotions(37:46,:);File.emotions(13:24,:)];
SVMStruct_sad_happy = fitcsvm(Features,Sad_Happy,'KernelScale','auto','Standardize',true,'OutlierFraction',0.5);
save('svmmodel.mat','SVMStruct_sad_happy','-append');

Status= 'SVM Model has been Trained';