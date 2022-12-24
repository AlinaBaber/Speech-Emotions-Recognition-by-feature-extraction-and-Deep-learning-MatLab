function [Category_Error_Rate,Category_Accuracy_Rate,Emotion_Error_Rate,Emotion_Accuracy_Rate,Categories,Emotions,Category_SampleDistribution,Category_ErrorDistribution,Emotion_SampleDistribution,Emotion_ErrorDistribution,Category_Score,Category_Cost,Emotion_score, Emotion_cost]= SVM_Test_R()
File=load('test_speech');
%==========================Normal================================%
[row,col]=size(File.Features1); Categories={}; Emotions={}; Category_Score=[]; Category_Cost=[]; Emotion_score=[]; Emotion_cost=[];
for i=1:row
[Category,Category_score,Categories_error,Category_cost,Emotion,Emotion_Score,Emotion_Cost,Emotion_Error] = svm_classification_test_r(File.Features1(i,:));
Categories(i)=Category;
Emotions(i)=Emotion; 
Category_Score(i,:)=Category_score;
Category_Cost(i,:)=Category_cost;
Emotion_score(i,:)=Emotion_Score;
Emotion_cost(i,:)=Emotion_Cost;
end
SVM_Category_Analysis = classperf(File.categories,Categories);
Category_Error_Rate=SVM_Category_Analysis.ErrorRate;
Category_Accuracy_Rate=SVM_Category_Analysis.CorrectRate;
SVM_Emotion_Analysis = classperf(File.emotions,Emotions);
Emotion_Error_Rate=SVM_Emotion_Analysis.ErrorRate;
Emotion_Accuracy_Rate=SVM_Emotion_Analysis.CorrectRate;
Category_SampleDistribution=SVM_Category_Analysis.SampleDistribution;
Category_ErrorDistribution=SVM_Category_Analysis.ErrorDistribution;
Emotion_SampleDistribution=SVM_Emotion_Analysis.SampleDistribution;
Emotion_ErrorDistribution=SVM_Emotion_Analysis.ErrorDistribution;
figure(1),subplot(2,1,1);
bar(Category_SampleDistribution-Category_ErrorDistribution); xlabel('Samples');ylabel('Accuracy Rate'); title('Category Performance');
subplot(2,1,2);
bar(Emotion_SampleDistribution-Emotion_ErrorDistribution); xlabel('Samples');ylabel('Accuracy Rate'); title('Emotion Performance');
figure(2),subplot(2,1,1);
bar(Category_ErrorDistribution); xlabel('Samples');ylabel('Error Rate'); title('Category Error');
subplot(2,1,2);
bar(Emotion_ErrorDistribution); xlabel('Samples');ylabel('Error Rate'); title('Emotion Error');