function score = compare_averaging_diff(comparison_fft, sample_fft)
    % Scoring function that averages the two ffts and reports the total
    % difference between them

    % Only consider up to 1700Hz
    max_freq = 1700; % Potentially change this value
    comparison_fft = comparison_fft(1:max_freq);
    sample_fft = sample_fft(1:max_freq);

    % Average both signals
    period = 25;
    average_comparison = conv(comparison_fft, 1/period*ones(1, period));
    average_new_fft = conv(sample_fft, 1/period*ones(1, period));

    % Scale both to have one as max
    average_comparison = average_comparison/max(average_comparison);
    average_new_fft = average_new_fft/max(average_new_fft);

    % Find sum of absolute value of difference for each point
    score = sum(abs(average_comparison-average_new_fft));
end