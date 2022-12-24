function [Normal_Error_Rate,Special_Error_Rate,Normal_Accuracy_Rate,Special_Accuracy_Rate]= algorithm_analysis(Categories,Emotions)

   Categories=transpose(Categories); Emotions=transpose(Emotions);
   NAC=strcmp(Categories(1:6,1),'Normal'); 
   NAE=strcmp(Emotions(1:6,1),'Angry');
   SAC=strcmp(Categories(7:12,1),'Special'); 
   SAE=strcmp(Emotions(7:12,1),'Angry');
   NHC=strcmp(Categories(13:18,1),'Normal'); 
   NHE=strcmp(Emotions(13:18,1),'Happy');
   SHC=strcmp(Categories(19:24,1),'Special'); 
   SHE=strcmp(Emotions(19:24,1),'Happy');
   NNC=strcmp(Categories(25:30,1),'Normal'); 
   NNE=strcmp(Emotions(25:30,1),'Neutral');
   SNC=strcmp(Categories(31:36,1),'Special'); 
   SNE=strcmp(Emotions(31:36,1),'Neutral');
   NSC=strcmp(Categories(37:42,1),'Normal'); 
   NSE=strcmp(Emotions(37:42,1),'Sad');
   SSC=strcmp(Categories(43:46,1),'Special'); 
   SSE=strcmp(Emotions(43:46,1),'Sad');
   Normal_Angry=[sum(NAC),sum(NAE)];
   Special_Angry=[sum(SAC),sum(SAE)];
   Normal_Happy=[sum(NHC),sum(NHE)];
   Special_Happy=[sum(SHC),sum(SHE)];
   Normal_Neutral=[sum(NNC),sum(NNE)];
   Special_Neutral=[sum(SNC),sum(SNE)];
   Normal_Sad=[sum(NSC),sum(NSE)];
   Special_Sad=[sum(SSC),sum(SSE)];
   Normal_Angry_Error_Rate= max([6-Normal_Angry(1,1),6-Normal_Angry(1,2)])/6;
   Special_Angry_Error_Rate= max([6-Special_Angry(1,1),6-Special_Angry(1,2)])/6;
   Normal_Happy_Error_Rate= max([6-Normal_Happy(1,1),6-Normal_Happy(1,2)])/6;
   Special_Happy_Error_Rate= max([6-Special_Happy(1,1),6-Special_Happy(1,2)])/6;
   Normal_Neutral_Error_Rate= max([6-Normal_Neutral(1,1),6-Normal_Neutral(1,2)])/6;
   Special_Neutral_Error_Rate= max([6-Special_Neutral(1,1),6-Special_Neutral(1,2)])/6;
   Normal_Sad_Error_Rate= max([6-Normal_Sad(1,1),6-Normal_Sad(1,2)])/6;
   Special_Sad_Error_Rate= max([4-Special_Sad(1,1),4-Special_Sad(1,2)])/4;
   Normal_Error_Rate=[Normal_Angry_Error_Rate,Normal_Happy_Error_Rate,Normal_Neutral_Error_Rate,Normal_Sad_Error_Rate];
   Special_Error_Rate=[Special_Angry_Error_Rate,Special_Happy_Error_Rate,Special_Neutral_Error_Rate,Special_Sad_Error_Rate];
   
   Normal_Angry_Accuracy_Rate= min([Normal_Angry(1,1),Normal_Angry(1,2)])/6;
   Special_Angry_Accuracy_Rate= min([Special_Angry(1,1),Special_Angry(1,2)])/6;
   Normal_Happy_Accuracy_Rate= min([Normal_Happy(1,1),Normal_Happy(1,2)])/6;
   Special_Happy_Accuracy_Rate= min([Special_Happy(1,1),Special_Happy(1,2)])/6;
   Normal_Neutral_Accuracy_Rate= min([Normal_Neutral(1,1),Normal_Neutral(1,2)])/6;
   Special_Neutral_Accuracy_Rate= min([Special_Neutral(1,1),Special_Neutral(1,2)])/6;
   Normal_Sad_Accuracy_Rate= min([Normal_Sad(1,1),Normal_Sad(1,2)])/6;
   Special_Sad_Accuracy_Rate= min([Special_Sad(1,1),Special_Sad(1,2)])/4;
   Normal_Accuracy_Rate=[Normal_Angry_Accuracy_Rate,Normal_Happy_Accuracy_Rate,Normal_Neutral_Accuracy_Rate,Normal_Sad_Accuracy_Rate];
   Special_Accuracy_Rate=[Special_Angry_Accuracy_Rate,Special_Happy_Accuracy_Rate,Special_Neutral_Accuracy_Rate,Special_Sad_Accuracy_Rate];
Test=load('test_results');
figure, plotconfusion(transpose(Test.Categories_nnTarget),transpose(Test.Categories_nn));
figure, plotconfusion(transpose(Test.SpecialEmotions_nnTarget),transpose(Test.SpecialEmotions_nn));
figure, plotconfusion(transpose(Test.NormalEmotions_nnTarget),transpose(Test.NormalEmotions_nn));
Category_errors = gsubtract(transpose(Test.Categories_nnTarget),transpose(Test.Categories_nn));
figure, ploterrhist(Category_errors);
Category_errors = gsubtract(transpose(Test.NormalEmotions_nnTarget),transpose(Test.NormalEmotions_nn));
figure, ploterrhist(Category_errors);
Category_errors = gsubtract(transpose(Test.SpecialEmotions_nnTarget),transpose(Test.SpecialEmotions_nn));
figure, ploterrhist(Category_errors);
   