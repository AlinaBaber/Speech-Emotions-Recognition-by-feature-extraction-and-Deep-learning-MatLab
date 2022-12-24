function [ MFCCscepDpDD] = melfccformatching( wav_file )
% hObject    handle to mfcc_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 %[d,sr]=audioread(handles.sample_filepath_txt.String); 
% Define variables
    Tw = 25;                % analysis frame duration (ms)
    Ts = 10;                % analysis frame shift (ms)
    alpha = 0.97;           % preemphasis coefficient
    M = 20;                 % number of filterbank channels 
    C = 13;                 % number of cepstral coefficients
    L = 22;                 % cepstral sine lifter parameter
    R = [ 300 3700 ];               % lower frequency limit (Hz)
                 % upper frequency limit (Hz)
    % hamming window (see Eq. (5.2) on p.73 of [1])
    hammingwindow = @(N)(0.54-0.46*cos(2*pi*[0:N-1].'/(N-1)));
   % wav_file = handles.sample_filepath_txt.String;  % input audio filename


    % Read speech samples, sampling rate and precision from file
    [ speech, fs, nbits ] = readwav( wav_file );


    % Feature extraction (feature vectors as columns)
    [ MFCCs, FBEs, frames ] = mfcc( speech, fs, Tw, Ts, alpha, hammingwindow, R, M, C, L );
        % Generate data needed for plotting 
            % Append deltas and double-deltas onto the cepstral vectors
  % MFCCs= sort(MFCCs);
 mfccdel = deltas(MFCCs);
 % Double deltas are deltas applied twice with a shorter window
 mfccddel = deltas(deltas(MFCCs,5),5);
 % Composite, 39-element feature vector, just like we use for speech recognition
 MFCCscepDpDD = [MFCCs;mfccdel;mfccddel];