function [] = split_samples()
    split_dir = 'split data';

    % clear split data folder if it exists
    if exist(split_dir, 'dir')
       rmdir(split_dir, 's');
    end
    
    % create folders for split data
    mkdir(split_dir);
    mkdir([split_dir, '/system']);
    mkdir([split_dir, '/test']);

    % define sample ranges
    system_range = 1:5;
    test_range = 6:7;

    % get list of sample files
    sampFiles = dir("raw data/database samples");
    sampFiles = sampFiles(3:end);

    for i = 1:length(sampFiles)
        % get the name of each file
        fieldName = split(sampFiles(i).name, ".");
        fieldName = fieldName(1);

        % extract the subject's name
        subjectName = split(fieldName, "_");
        subjectName = subjectName(3);

        % get the list of samples
        samples = load("raw data/database samples/" + sampFiles(i).name);
        samples = getfield(samples, fieldName{1});
        
        % split into respective ranges
        system_samples = samples(system_range, :);
        test_samples = samples(test_range, :);
        
        % save in two .mat files
        save("split data/system/" + subjectName + ".mat", 'system_samples');
        save("split data/test/" + subjectName + ".mat", 'test_samples');
    end
    
    % get list of test only sample files
    sampFiles = dir("raw data/test only samples");
    sampFiles = sampFiles(3:end);
    
    for i = 1:length(sampFiles)
        % get the name of each file
        fieldName = split(sampFiles(i).name, ".");
        fieldName = fieldName(1);

        % extract the subject's name
        subjectName = split(fieldName, "_");
        subjectName = subjectName(3);

        % get the list of samples
        samples = load("raw data/test only samples/" + sampFiles(i).name);
        samples = getfield(samples, fieldName{1});
        
        % split into test range
        test_samples = samples(test_range, :);
        
        % save into .mat file
        save("split data/test/" + subjectName + ".mat", 'test_samples');
    end
end