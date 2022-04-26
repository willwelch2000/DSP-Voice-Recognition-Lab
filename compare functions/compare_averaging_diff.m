function score = compare_averaging_diff(comparison_fft, sample_fft)
    % Scoring function that averages the two ffts and reports the total
    % difference between them

    % Only consider up to 1100Hz for each fft
    cutoff_freq = 1100;
    fs = 48000; % Highest frequency on fft is half of this
    cutoff_index = cutoff_freq/(fs/2)*(length(comparison_fft)-1);
    comparison_fft = comparison_fft(1:cutoff_index);
    sample_fft = sample_fft(1:cutoff_index);

    % Average both signals
    period = 25;
    average_comparison = conv(comparison_fft, 1/period*ones(1, period));
    average_sample = conv(sample_fft, 1/period*ones(1, period));

    % Scale both to have one as max
    average_comparison = average_comparison/max(average_comparison);
    average_sample = average_sample/max(average_sample);

    % Find sum of absolute value of difference for each point
    score = sum(abs(average_comparison-average_sample));
end