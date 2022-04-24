%% Starting variables
fs = 48000;
number_of_samples = 7;
count = 1;
time = 5;
L = time*fs;
all_samples_Coen = zeros(number_of_samples, L);

%% Add sample
% Plots the new fft on top of old
% Relevant data is added to "all_ffts" variable
sample = record(time, fs);
all_samples_Coen(count,:) = sample;
Y = fft(sample);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;
all_ffts_Coen(count,:) = P1;
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
elseif (count == 6)
    plot(f,P1, 'k');
elseif (count == 7)
    plot(f,P1, 'm');
    disp("Done with samples")
end
count = count + 1;
hold on
title('Single-Sided Amplitude Spectrum')
xlabel('f (Hz)')
ylabel('|P1(f)|')