function top5_peaks = find_peaks(signal)
    % Scale to have one as max
    signal = signal/max(signal);

    % Average and downsample signal
    period = 50;
    avg_fft = conv(signal, 1/period*ones(1, period));
    down = 20;
    down_fft = avg_fft(1:down:end);

    % Take first difference of signal
    diff1 = conv(down_fft, [1 -1]);

    % Remove trivial first and last values--add zero at beginning--this
    % makes it represent the change that just happened, so it looks at
    % previous value, not next
    diff1 = diff1(2:end-1);

    % Label all locations as increasing/straight (1) or decreasing
    % (0)--increasing is based on previous value, not next
    increasing = diff1 >= 0;

    % First difference of these gives relative maxs (-1) and mins (1)
    maxmin = conv(increasing, [1 -1]);

    % Remove trivial first and last values--add zero at beginning and end--
    % results in locations of relative extrema
    % 1s are in same index as minimums, -1s are in same index as maximums
    maxmin = [0 maxmin(2:end-1) 0];

    % Find locations of peaks
    peaks = find(maxmin == -1);

    % Get rid of peaks that aren't much bigger than surroundings
    true_peaks = [];
    cutoff_diff = .02;
    dist = 4;
    for i=1:length(peaks)
        if (peaks(i)-dist < 1)
            if (down_fft(peaks(i)) - cutoff_diff > down_fft(peaks(i)+3))
                true_peaks = [true_peaks down*peaks(i)];
            end
        elseif (peaks(i)+dist > length(down_fft))
            if (down_fft(peaks(i)) - cutoff_diff > down_fft(peaks(i)-3))
                true_peaks = [true_peaks down*peaks(i)];
            end
        else
            if (down_fft(peaks(i)) - cutoff_diff > down_fft(peaks(i)-3) || down_fft(peaks(i)) - cutoff_diff > down_fft(peaks(i)+3))
                true_peaks = [true_peaks down*peaks(i)];
            end
        end
    end

    % Finally, choose highest 5
    peak_values = down_fft(true_peaks/down);
    peak_values = sort(peak_values, 'descend');
    for i=1:5
        top5_peaks(i) = find(down_fft == peak_values(i));
    end
    top5_peaks = down*sort(top5_peaks);
end

