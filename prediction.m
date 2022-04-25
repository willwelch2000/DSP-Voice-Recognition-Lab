function choice = prediction(person, sample)
    % Makes an actual guess using "compare_averaging_diff" scorer

    choice = "User not in database.";
    [top_people, top_values] = top_results(person, sample);
    absolute_threshold = 295;
    if (top_values(1) < absolute_threshold)
        choice = top_people(1);
    end
end