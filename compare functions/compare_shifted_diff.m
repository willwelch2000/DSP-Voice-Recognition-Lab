function score = compare_shifted_diff(comparison, new_fft)
    % Similar to compare_simple_diff, but this shifts the signals so that
    % the first peaks match on each

    % Scale both to have one as max
    comparison = comparison/max(comparison);
    new_fft = new_fft/max(new_fft);

    % Find (first) max location of each
    peak_comparison = find(comparison == 1);
    peak_comparison = peak_comparison(1);
    peak_new_fft = find(new_fft == 1);
    peak_new_fft = peak_new_fft(1);

    % Shift the one that's farther down so the peaks match
    if (peak_comparison > peak_new_fft)
        comparison = comparison(peak_comparison-peak_new_fft:end);
    else
        new_fft = new_fft(peak_new_fft-peak_comparison+1:end);
    end

    % Use simple difference compare function
    score = compare_simple_diff(comparison, new_fft);
end