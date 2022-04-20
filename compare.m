function score = compare(comparison, new_fft)
    % Parameters: 
    %   comparison is fft of sample inside database to compare
    %   against
    %   new_fft is fft of the sample outside database that is being tested
    % Returns: a score relating the two
    % Note: this is not completed

    %% Find relative extrema of comparison fft
    % Average both signals--period of 4
    period = 1;
    average_comparison = conv(comparison, 1/period*ones(1, period));
    average_new_fft = conv(new_fft, 1/period*ones(1, period));

    % Take first difference of signals
    diff1_comparison = conv(average_comparison, [1 -1]);
    diff1_new_fft = conv(average_new_fft, [1 -1]);

    % Remove trivial first and last values--add zero at beginning--this
    % makes it represent the change that just happened, so it looks at
    % previous value, not next
    diff1_comparison = [diff1_comparison(2:end-1)];
    diff1_new_fft = [diff1_new_fft(2:end-1)];

    % Label all locations as increasing/straight (1) or decreasing
    % (0)--increasing is based on previous value, not next
    increasing_comparison = diff1_comparison >= 0;
    increasing_new_fft = diff1_new_fft >= 0;

    % First difference of these gives relative maxs (-1) and mins (1)
    maxmin_comparison = conv(increasing_comparison, [1 -1]);
    maxmin_new_fft = conv(increasing_new_fft, [1 -1]);

    % Remove trivial first and last values--add zero at end--results in
    % locations of relative extrema
    maxmin_comparison = [maxmin_comparison(2:end-1) 0];
    maxmin_new_fft = [maxmin_new_fft(2:end-1) 0];

    score = 5;
end