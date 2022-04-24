function score = compare_averaging_diff(comparison, new_fft)
    % Similar to compare_simple_diff, but pass the signals through
    % averagers first

    % Average both signals
    period = 20;
    average_comparison = conv(comparison, 1/period*ones(1, period));
    average_new_fft = conv(new_fft, 1/period*ones(1, period));

    score = compare_simple_diff(average_comparison, average_new_fft);
end