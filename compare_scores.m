function results = compare_scores(person, method)
    addpath(genpath('compare functions'));
    
    load system_data.mat
    load test_data.mat
    
    % get the data for person
    subject_data = test_data( strcmp({test_data.name}, person) ).ffts;
    fn_handle = str2func(method);
    
    results = [];
    
    for i = 1:length(system_data)
        results(i).name = system_data(i).name;
        results(i).tests = [];
        
        for j = 1:size(subject_data, 1)
            results(i).tests(j).sample = j;
            results(i).tests(j).scores = [];
            
            for k = 1:size(system_data(1).ffts, 1)
                score = fn_handle(system_data(i).ffts(k, :), subject_data(j, :));
                results(i).tests(j).scores(k) = score;
            end
        end
    end
end