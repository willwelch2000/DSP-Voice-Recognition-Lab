% Creates struct array of person and prediction for each sample
% Format is: all_predictions
    % name: String
    % prediction1: String--prediction for first sample
    % prediction2: String--prediction for second sample

all_predictions = [];
num_samples = 2;
load sample_data.mat
for i=1:length(sample_data)
    person = sample_data(i).name;
    all_predictions(i).name = person;
    all_predictions(i).prediction1 = prediction(person, 1);
    all_predictions(i).prediction2 = prediction(person, 2);
end

% Not working correctly:
    % Chris
    % Katherine
    % Amy--switch 5 and 7 and it should work