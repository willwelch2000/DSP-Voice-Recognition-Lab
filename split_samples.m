function [] = split_samples()
    % define sample ranges
    system_range = 1:5;
    test_range = 6:7;

    % get list of sample files
    sampFiles = dir("samples");
    sampFiles = sampFiles(3:end);

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
        
        % split into respective ranges
        system_samples = samples(system_range, :);
        test_samples = samples(test_range, :);
        
        % save in two .mat files
        save("system samples/" + subjectName + ".mat", 'system_samples');
        save("test samples/" + subjectName + ".mat", 'test_samples');
    end
end