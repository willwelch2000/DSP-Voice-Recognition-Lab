function choice = choose(person, sample)
    choice = "User not in database.";
    [top_people, top_values] = top_results(person, "compare_averaging_diff", sample);
    threshold = 200;
    if (top_values(1) < threshold)
        choice = top_people(1);
    end
end