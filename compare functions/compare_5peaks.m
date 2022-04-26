function score = compare_5peaks(comparison_fft, sample_fft)
    % Don't used--never finished--didn't result in consisitent data

    % Only consider up to 2000Hz
    max_freq = 2000;
    comparison_fft = comparison_fft(1:max_freq);
    sample_fft = sample_fft(1:max_freq);

    % Find peaks
    peaks_comparison = find_peaks(comparison_fft);
    peaks_sample = find_peaks(sample_fft);

    % Find distances between peaks
    distances_comparison = conv(peaks_comparison, [1 -1]);
    distances_comparison = distances_comparison(2:end-1);
    distances_sample = conv(peaks_sample, [1 -1]);
    distances_sample = distances_sample(2:end-1);
end