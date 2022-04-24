# Voice Recognition Lab
## Sample and FFT data format
The data in `sample_data.mat` and `fft_data.mat` is stored in a cell aray with the following structure:

```
sample_data : Cell Array {1 x # of people}
    person1 : Cell Array {1 x 2}
        String                      : subject name
        double array (7, 240000)    : data
    person2
    person3
    .
    .
    .
```
### Examples

Accessing the name of the third subject:
```MATLAB
sample_data{3}{1}
```

Accessing the sample data for the 5th sample from the third subject:
```MATLAB
sample_data{3}{2}(5, :)
```

Accessing the fft data for the 5th sample from the third subject:
```MATLAB
fft_data{3}{2}(5, :)
```
