function score = compare_simple_diff(comparison_fft, sample_fft)
    % Compare by simply taking difference between the two
    % Score is proportional to total difference

    % Only consider up to 2000Hz
    max_freq = 2000;
    comparison_fft = comparison_fft(1:max_freq);
    sample_fft = sample_fft(1:max_freq);

    % Scale both to have one as max
    comparison_fft = comparison_fft/max(comparison_fft);
    sample_fft = sample_fft/max(sample_fft);

    % Find absolute value of difference for each point
    difference = abs(comparison_fft-sample_fft);

    % Find total difference
    score = sum(difference);
end