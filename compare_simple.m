function score = compare_simple(comparison, new_fft)
    % Only consider up to 4000Hz
    max_freq = 4000;
    comparison = comparison(1:max_freq);
    new_fft = new_fft(1:max_freq);

    % Scale both to have one as max
    comparison = comparison/max(comparison);
    new_fft = new_fft/max(new_fft);

    % Find absolute value of difference for each point
    difference = abs(comparison-new_fft);

    % Find total difference
    score = sum(difference);
end