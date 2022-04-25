function [] = visualize_comparison(person, method)
    % compute the scores
    results = compare_scores(person, method);
    
    hold off
    for i = 1:length(results)
        % concatenate results from all tests
        vals = [];
        for j = 1:length(results(i).tests)
            vals = [vals, results(i).tests(j).scores];
        end
        
        % plot on top of each other
        plot(vals)
        hold on
    end
    
    % add labels for each plotted line
    legend(results.name)
end