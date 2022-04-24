# Voice Recognition Lab
## Sample and FFT data format
The data in `sample_data.mat` and `fft_data.mat` is stored in an array of structs with the following structure:

```
sample_data : Array {1 x # of people}
    [1] : Struct
        name: String
        data: double array (7, 240000)
    [2]
    [3]
    .
    .
    .
```
### Examples

Accessing the name of the third subject:
```MATLAB
sample_data(3).name
```

Accessing the sample data for the 5th sample from the third subject:
```MATLAB
sample_data(3).data(5, :)
```

Accessing the fft data for the 5th sample from the third subject:
```MATLAB
fft_data(3).data(5, :)
```
