function Features= allfeatures_extraction( wav_file )
%--(1)----Frequency------------------------------
[Frequency,t,x,f,magnitude,q,amplitude] = frequency( wav_file );
%---(2)----------pitch contour-------------------------
[ Pitch_Contour_min, Pitch_Contour_max,Pitch_Contour_mean,pitch_con] = pitch_contour( wav_file );
%pitch_con= [min(pitch_con),max(pitch_con),mean(pitch_con),median(pitch_con),mode(pitch_con),std(pitch_con),var(pitch_con)];
pitch_con = pitch_con([1,1:100]);
%---(3)----------- pitch autocorrelation---------------
[ pitch_freq_auto] = pitch_autocor (wav_file);
%---(4)-----------acceleration----------------
[acceleration1,velocity1,~,t1,rate_of_acceleration]= acceleration(wav_file);
%Acceleration=acceleration1(1,1:19500);
Acceleration=rate_of_acceleration;
% Acceleration=[min(acceleration1),max(acceleration1),mean(acceleration1),median(acceleration1),mode(acceleration1),std(acceleration1),var(acceleration1)];
%-----(5)-------------Intensity------------
[Intensity_of_Sound,f]= intensity_extraction(wav_file);
%Intensity_of_Sound=Intensity_of_Sound(1,1:19500);
Intensity_of_Sound=mean(Intensity_of_Sound);
%Intensity_of_Sound=[min(Intensity_of_Sound),max(Intensity_of_Sound),mean(Intensity_of_Sound),median(Intensity_of_Sound),mode(Intensity_of_Sound),std(Intensity_of_Sound),var(Intensity_of_Sound)];
%---(6)-------------formants frquency----------------------
[ formant_frequencies ] = formant( wav_file );
formant_frequencies= transpose(formant_frequencies(1:8));
%formant_frequencies =[min(formants),max(formants),mean(formants),median(formants),mode(formants),std(formants),var(formants)];
%----(7)---------------LPCCs-------------------------------
% p=128
[LPCCs_Coeff,lpcddel,LPCCscepDpDD]= lpccs(wav_file);
 LPCCs=mean ( LPCCscepDpDD);
  %LPCCs=[min(LPCCs),max(LPCCs),mean(LPCCs),median(LPCCs),mode(LPCCs),std(LPCCs),var(LPCCs)];
 %LPCCsMax= max ( LPCCscepDpDD);
 %LPCCsMin= min( LPCCscepDpDD);
 %-----(8)---------------MFCCs------------------------------------
 [ MFCCscepDpDD] = melfccformatching( wav_file );
 MFCCscepDpDD=mean(MFCCscepDpDD);
 MFCCs=MFCCscepDpDD([1,1:100]);
 %MFCCs=[min(MFCCscepDpDD),max(MFCCscepDpDD), mean( MFCCscepDpDD),median( MFCCscepDpDD),mode( MFCCscepDpDD),std( MFCCscepDpDD),var( MFCCscepDpDD)];
 %MFCCsMax= max ( MFCCscepDpDD);
 %MFCCsMin= min( MFCCscepDpDD);
 %-------(9)------------RastaPLP----------------------------------------
 [RastaPLPcepDpDD] = rastaplp_matching( wav_file );
 RastaPLP=mean (RastaPLPcepDpDD);
 RastaPLP=RastaPLP([1,1:100]);
 %RastaPLP=[min( RastaPLP),max( RastaPLP), mean( RastaPLP),median( RastaPLP),mode( RastaPLP),std( RastaPLP),var( RastaPLP)];
 %RastaPLPsMax= max (RastaPLPcepDpDD);
 %RastaPLPsMin= min(RastaPLPcepDpDD);
%--------(10)-------Average Power--------------------------------------------
[Power]= logpower(wav_file);
Average_Power=Power([1,1:100]);
%Average_Power=[min(Power),max(Power), mean(Power),median(Power),mode(Power),std(Power),var(Power)];
%Average_Power_Max= max(Average_Power); 
%Average_Power_Min= min(Average_Power);
%--------(11)------- Average Energy--------------------------------------------
[Energy]= logenergy(wav_file);
Average_Energy=Energy([1,1:100]);
%Average_Energy=[min(Energy),max(Energy), mean(Energy),median(Energy),mode(Energy),std(Energy),var(Energy)];
%-------(12)----Zero Passage Rate----------
[Rate_Zero_Passages] = rate_zero_passages(wav_file);
Rate_Zero_Passages= Rate_Zero_Passages([1,1:100]);
%Rate_Zero_Passages=[min(Rate_Zero_Passages),max(Rate_Zero_Passages), mean(Rate_Zero_Passages),median(Rate_Zero_Passages),mode(Rate_Zero_Passages),std(Rate_Zero_Passages),var(Rate_Zero_Passages)];
Features=[Frequency,pitch_con,rate_of_acceleration,Intensity_of_Sound,formant_frequencies,LPCCs,MFCCs,RastaPLP,Average_Power,Average_Energy,Rate_Zero_Passages];
%Features1=[pitch_con,Intensity_of_Sound,formant_frequencies];
%Features=[pitch_con,Intensity_of_Sound,formant_frequencies,LPCCs,MFCCs,RastaPLP];
%Features=[pitch_con,Intensity_of_Sound,formant_frequencies,Rate_Zero_Passages];
%Features=Rate_Zero_Passages;
%Features=[rate_of_acceleration,Average_Power,Average_Energy,Rate_Zero_Passages];

