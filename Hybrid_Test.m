function [Category_Error_Rate,Category_Accuracy_Rate,Emotion_Error_Rate,Emotion_Accuracy_Rate,Categories,Emotions,Category_SampleDistribution,Category_ErrorDistribution,Emotion_SampleDistribution,Emotion_ErrorDistribution]= Hybrid_Test()
File=load('speech'); 
Result_File=load('test_results');
Categories_nn=[];
save('test_results.mat','Categories_nn','-append');
NormalEmotions_nn=[];
save('test_results.mat','NormalEmotions_nn','-append');
SpecialEmotions_nn=[];
save('test_results.mat','SpecialEmotions_nn','-append'); 
[row,col]=size(File.hybrid_features); Categories={}; Emotions={}; 
for i=1:row
[Category,Category_Cost,Emotion,Emotion_Cost]=hybrid_classification_Test(File.hybrid_features(i,:));
Categories(i)=Category;
Emotions(i)=Emotion;
Result_File=load('test_results');
Categories_nn=[Result_File.Categories_nn;Category_Cost;];
save('test_results.mat','Categories_nn','-append');
if strcmp(Result_File.Categories(i),'Normal')==1
NormalEmotions_nn=[Result_File.NormalEmotions_nn;Emotion_Cost;];
save('test_results.mat','NormalEmotions_nn','-append');
else
SpecialEmotions_nn=[Result_File.SpecialEmotions_nn;Emotion_Cost;];
save('test_results.mat','SpecialEmotions_nn','-append'); 
end
end
Hybrid_Category_Analysis = classperf(File.categories,Categories);
Category_Error_Rate=Hybrid_Category_Analysis.ErrorRate;
Category_Accuracy_Rate=Hybrid_Category_Analysis.CorrectRate;
Hybrid_Emotion_Analysis = classperf(File.emotions,Emotions);
Emotion_Error_Rate=Hybrid_Emotion_Analysis.ErrorRate;
Emotion_Accuracy_Rate=Hybrid_Emotion_Analysis.CorrectRate;
Category_SampleDistribution=Hybrid_Category_Analysis.SampleDistribution;
Category_ErrorDistribution=Hybrid_Category_Analysis.ErrorDistribution;
Emotion_SampleDistribution=Hybrid_Emotion_Analysis.SampleDistribution;
Emotion_ErrorDistribution=Hybrid_Emotion_Analysis.ErrorDistribution;
figure(1),subplot(2,1,1);
bar(Category_SampleDistribution-Category_ErrorDistribution); xlabel('Samples');ylabel('Accuracy Rate'); title('Category Performance');
subplot(2,1,2);
bar(Emotion_SampleDistribution-Emotion_ErrorDistribution); xlabel('Samples');ylabel('Accuracy Rate'); title('Emotion Performance');
figure(2),subplot(2,1,1);
bar(Category_ErrorDistribution); xlabel('Samples');ylabel('Error Rate'); title('Category Error');
subplot(2,1,2);
bar(Emotion_ErrorDistribution); xlabel('Samples');ylabel('Error Rate'); title('Emotion Error');
