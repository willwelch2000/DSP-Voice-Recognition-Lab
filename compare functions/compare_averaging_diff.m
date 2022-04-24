function score = compare_averaging_diff(comparison_fft, sample_fft)
    % Similar to compare_simple_diff, but pass the signals through
    % averagers first
    % Doesn't work well for: Katherine, Chris

    % Average both signals
    period = 20;
    average_comparison = conv(comparison_fft, 1/period*ones(1, period));
    average_new_fft = conv(sample_fft, 1/period*ones(1, period));

    score = compare_simple_diff(average_comparison, average_new_fft);
end