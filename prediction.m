function choice = prediction(person, sample)
    % Makes an actual guess using "compare_averaging_diff" scorer
    % Summary of criteria for correct prediction
        % 1. Only the top person on the top 10 results is considered
        % 2. This person must have two or more samples in the top 4
        % 3. The second highest-scoring sample of this person must fit
            % below the "secondary_threshold"
        % 4. If 2 and 3 aren't satisfied for the top person, the result is
            % "Unknown User."

    choice = "Unknown User";
    [top_people, top_values] = top_results(person, sample);
    secondary_threshold = 250; % At least two correct samples must be below this
    top_person_occurrences = find(top_people(1:4) == top_people(1)); % Occurrences of top result in the top 4
    if (length(top_person_occurrences) > 1 && top_values(top_person_occurrences(2)) < secondary_threshold)
        choice = top_people(1);
    end
end