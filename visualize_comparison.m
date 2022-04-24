function [] = visualize_comparison(person, method)
    results = compare_scores(person, method);
    
    hold off
    for i = 1:length(results)
        vals = [];
        for j = 1:length(results(i).tests)
            vals = [vals, results(i).tests(j).scores];
        end
        
        plot(vals)
        hold on
    end
    
    legend(results.name)
end