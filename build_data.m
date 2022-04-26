%% Initialize variables and split samples

fs = 48000;     % sampling frequency
time = 5;       % recording time in seconds
L = time*fs;    % # of samples in a recording

% make sure sample data has be split first
split_samples();

%% Build data for system samples

% get list of sample files
sampFiles = dir("split data/system");
sampFiles = sampFiles(3:end);

% initialize struct arrays
system_data = [];

% iterate over all files
for i = 1:length(sampFiles)
    fieldName = "system_samples";
    
    % get the name of each file
    subjectName = split(sampFiles(i).name, ".");
    subjectName = subjectName(1);
    
    % get the list of samples
    load("split data/system/" + sampFiles(i).name);
    samples = system_samples;
    
    % store sample data with subject name in struct
    system_data(i).name = subjectName{1};
    system_data(i).samples = samples;
    
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
    system_data(i).ffts = transformedData;
end

% save system data to .mat file
save('system_data.mat', 'system_data');

%% Now do the same for test samples

% get list of sample files
sampFiles = dir("test samples");
sampFiles = sampFiles(3:end);

% initialize struct arrays
test_data = [];

% iterate over all files
for i = 1:length(sampFiles)
    fieldName = "test_samples";
    
    % get the name of each file
    subjectName = split(sampFiles(i).name, ".");
    subjectName = subjectName(1);
    
    % get the list of samples
    load("split data/test/" + sampFiles(i).name);
    samples = test_samples;
    
    % store sample data with subject name in struct
    test_data(i).name = subjectName{1};
    test_data(i).samples = samples;
    
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
    test_data(i).ffts = transformedData;
end

% save system data to .mat file
save('test_data.mat', 'test_data');