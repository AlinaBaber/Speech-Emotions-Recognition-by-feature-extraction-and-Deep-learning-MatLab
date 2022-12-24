function [audio_signals, emotions] = load_audio_from_folder(audio_folder)
    audio_signals = {};
    emotions = {}; %mfccs =randn(1,13);
    load 'speech.mat'; 
    for word_folder = struct2cell(dir(audio_folder))
        for word_file = struct2cell(dir(sprintf('%s/*.wav', audio_folder, char(word_folder(1)))))
           file_path = sprintf('%s/%s', audio_folder, char(word_folder(1)), char(word_file(1)));
            
            audio_signals(end + 1) = {file_path}; %#ok<AGROW>
            
                if (size(word_folder)>3)
            emotions(end + 1) = word_folder(1); %#ok<AGROW>
                end
                
        end
    end
      %assignin('speech', 'mfcc',mfccs);
     emotions=emotions(2:end);  audio_signals=audio_signals(2:end);
    %  [dim1 N1]=size(audio_signals); [dim N]= size(mfccs); 
      %   for i=1:N1   
       %   as= audio_signals(1,i);
        % [ mfc] = melfccformatching( as );
         %   a=transpose(mfc);
           %     mfc=mean(a); dim= i;
            %   mfccs(dim + 1,:)=mfc; 
         %end
     
end