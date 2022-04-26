function score = compare_shifted_diff(comparison_fft, sample_fft)
    % Similar to compare_averaging_diff, but this shifts the signals so that
    % the first peaks match on each

    % Average both signals
    period = 25;
    average_comparison = conv(comparison_fft, 1/period*ones(1, period));
    average_sample = conv(sample_fft, 1/period*ones(1, period));

    % Scale both to have one as max
    average_comparison = average_comparison/max(average_comparison);
    average_sample = average_sample/max(average_sample);

    % Find (first) max location of each
    peak_comparison = find(average_comparison == 1);
    peak_comparison = peak_comparison(1);
    peak_sample = find(average_sample == 1);
    peak_sample = peak_sample(1);

    % Shift the one that's farther down so the peaks match
    if (peak_comparison > peak_sample)
        average_comparison = average_comparison(peak_comparison-peak_sample:end);
    else
        average_sample = average_sample(peak_sample-peak_comparison+1:end);
    end

    % Only consider up to 1100Hz for each fft
    cutoff_freq = 1100;
    fs = 48000; % Highest frequency on fft is half of this
    cutoff_index = cutoff_freq/(fs/2)*(120000);
    average_comparison = average_comparison(1:cutoff_index);
    average_sample = average_sample(1:cutoff_index);

    % Find sum of absolute value of difference for each point
    score = sum(abs(average_comparison-average_sample));
end