fs = 48000;     % sampling frequency
time = 5;       % recording time in seconds
L = time*fs;    % # of samples in a recording

% get list of sample files
sampFiles = dir("samples");
sampFiles = sampFiles(3:end);

% initialize struct arrays
sample_data = [];
fft_data = [];

% iterate over all files
for i = 1:length(sampFiles)
    % get the name of each file
    fieldName = split(sampFiles(i).name, ".");
    fieldName = fieldName(1);
    
    % extract the subject's name
    subjectName = split(fieldName, "_");
    subjectName = subjectName(3);
    
    % get the list of samples
    samples = load("samples/" + sampFiles(i).name);
    samples = getfield(samples, fieldName{1});
    
    % store sample data with subject name in struct
    sample_data(i).name = subjectName{1};
    sample_data(i).data = samples;
    
    % array to hold fft data for each sample
    transformedData = zeros(size(samples, 1), size(samples, 2)/2 + 1);
    
    % iterate over all samples
    for j = 1:size(samples, 1)
        % perform fft
        Y = fft(samples(j, :));
        
        % normalize and scale
        P2 = abs(Y/L);          
        P1 = P2(1:L/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        
        % add fft data to array
        transformedData(j, :) = P1;
    end
    
    % store fft data with subject name in struct
    fft_data(i).name = subjectName{1};
    fft_data(i).data = transformedData;
end

% save variables to .mat files
save('sample_data.mat', 'sample_data');
save('fft_data.mat', 'fft_data');