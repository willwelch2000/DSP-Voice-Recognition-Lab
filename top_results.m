function [top, ordered_scores] = top_results(person, sample)
    % Returns array of descending list of people--top is closest match--and
    % an array of their corresponding scores
    % Sample is which sample to be tested--1 or 2

    results = compare_scores(person, "compare_averaging_diff");

    % Make array of scores and array of people
    all_scores = [];
    all_people = [];
    for i=1:length(results)
        scores = results(i).tests(sample).scores;
        all_scores = [all_scores scores];
        for j=1:length(scores)
            all_people = [all_people string(results(i).name)];
        end
    end

    % Find sort order, descending
    [ordered_scores, order] = sort(all_scores);
    top = all_people(order);

    % Trim to top 10
    top = top(1:10);
    ordered_scores = ordered_scores(1:10);
end