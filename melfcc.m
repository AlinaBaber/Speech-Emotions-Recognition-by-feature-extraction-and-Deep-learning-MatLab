function [ MFCCs, FBEs, frames ] = melfcc( wav_file )
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
    [ Nw, NF ] = size( frames );                % frame length and number of frames
    time_frames =[0:NF-1]*Ts*0.001+0.5*Nw/fs;  % time vector (s) for frames 
    time =[0:length(speech)-1 ]/fs;           % time vector (s) for signal samples 
    logFBEs = 20*log10( FBEs );                 % compute log FBEs for plotting
    logFBEs_floor = max(logFBEs(:))-50;         % get logFBE floor 50 dB below max
    logFBEs( logFBEs<logFBEs_floor ) = logFBEs_floor; % limit logFBE dynamic range
    [x,Fs,bits]=wavread(wav_file);
    % Generate plots
    figure('Position', [30 30 800 600], 'PaperPositionMode', 'auto', ... 
              'color', 'w', 'PaperOrientation', 'landscape', 'Visible', 'on' ); 

    subplot( 311 );
    %plot( time, speech);
    spectrogram(x,Fs,bits);
    % imagesc( time_frames, [1:M], logFBEs );
    %xlim( [ min(time_frames) max(time_frames) ] );
    xlabel( 'Time (s)' ); 
    ylabel( 'Amplitude' ); 
    title( 'Original Spectrogram'); 

    subplot( 312 );
    imagesc( time_frames, [1:M], logFBEs ); 
    %spectrogram(x,Fs,bits);
    xlim( [ min(time_frames) max(time_frames) ] );
    xlabel( 'Time (s)' ); 
    ylabel( 'Channel index' ); 
    title( 'Log (mel) filterbank energies'); 

    subplot( 313 );
    imagesc( time_frames,[1:C], MFCCs(2:end,:) ); % HTK's TARGETKIND: MFCC
    %imagesc( time_frames, [1:C+1], MFCCs );       % HTK's TARGETKIND: MFCC_0
    xlim( [ min(time_frames) max(time_frames) ] );
    xlabel( 'Time (s)' ); 
    ylabel( 'Cepstrum index' );
    title( 'Mel frequency cepstrum' );

    % Set color map to grayscale
    %colormap( 1-colormap('gray') ); 
    % Print figure to pdf and png files
    %print('-dpdf', sprintf('%s.pdf', mfilename)); 
   % print('-dpng', sprintf('%s.png', mfilename)); 




    