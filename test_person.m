%% Starting variables
fs = 8000;
number_of_samples = 5;
count = 1;
time = 5;
L = time*fs;
all_samples = zeros(number_of_samples, L);

%% Add sample
% Plots the new fft on top of old
% Relevant data is added to "all_ffts" variable
sample = record(time, fs);
all_samples(count,:) = sample;
Y = fft(sample);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;
all_ffts(count,:) = P1;
if (count == 1)
    plot(f,P1, 'r');
elseif (count == 2)
    plot(f,P1, 'y');
elseif (count == 3)
    plot(f,P1, 'g');
elseif (count == 4)
    plot(f,P1, 'b');
elseif (count == 5)
    plot(f,P1, 'c');
    disp("Done with samples")
end
count = count + 1;
hold on
title('Single-Sided Amplitude Spectrum')
xlabel('f (Hz)')
ylabel('|P1(f)|')