function choice = prediction(person, sample)
    % Makes an actual guess using "compare_averaging_diff" scorer

    choice = "Unknown User";
    [top_people, top_values] = top_results(person, sample);
    secondary_threshold = 265;
    % First value meets threshold and there's at least 2 of this person in
    % top 4
    if (top_values(2) < secondary_threshold && length(find(top_people(1:4) == top_people(1))) > 1)
        choice = top_people(1);
    end
end