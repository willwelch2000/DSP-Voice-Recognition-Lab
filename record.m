function sample = record(time, fs)
    recObj = audiorecorder(fs, 8, 1);
    disp('Start speaking.')
    recordblocking(recObj, time);
    disp('End of Recording.');
    sample = getaudiodata(recObj);
end