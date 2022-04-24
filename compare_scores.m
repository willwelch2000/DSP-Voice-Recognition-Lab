function results = compare_scores(person, method)
    addpath(genpath('compare functions'));

    system_samples = 1:5;
    test_samples = 6:7;
    
    load fft_data.mat
    
    % get the data for person
    subject_data = fft_data( strcmp({fft_data.name}, person) ).data;
    fn_handle = str2func(method);
    
    results = [];
    
    for i = 1:length(fft_data)
        results(i).name = fft_data(i).name;
        results(i).tests = [];
        
        for j = test_samples
            test_index = j - test_samples(1) + 1;
            results(i).tests(test_index).sample = j;
            results(i).tests(test_index).scores = [];
            
            for k = system_samples
                score_index = k - system_samples(1) + 1;
                
                score = fn_handle(fft_data(i).data(k, :), subject_data(j, :));
                results(i).tests(test_index).scores(score_index) = score;
            end
        end
    end
end