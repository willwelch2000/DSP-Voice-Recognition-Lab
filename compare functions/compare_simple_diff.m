function score = compare_simple_diff(comparison_fft, sample_fft)
    % Compare by simply taking difference between the two
    % Score is proportional to total difference

    % Only consider up to 450Hz for each fft
    cutoff_freq = 450;
    fs = 48000; % Highest frequency on fft is half of this
    cutoff_index = cutoff_freq/(fs/2)*(length(comparison_fft)-1);
    comparison_fft = comparison_fft(1:cutoff_index);
    sample_fft = sample_fft(1:cutoff_index);

    % Scale both to have one as max
    comparison_fft = comparison_fft/max(comparison_fft);
    sample_fft = sample_fft/max(sample_fft);

    % Find absolute value of difference for each point
    difference = abs(comparison_fft-sample_fft);

    % Find total difference
    score = sum(difference);
end