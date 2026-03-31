# ECG-Signal-Analysis
## Overview
This project explores electrocardiogram (ECG) signals to detect heart rate using signal processing techniques. The implementation is carried out across multiple programming enviroments to demonstrate versatility and computational understanding.

The project uses real ECG data from the MIT-BIH Arrhythmia Dataset and applies filtering and peak detection to estimate heart rate.

---

### Objectives
- Process real ECG data
- Remove noise from signals
- Detect R-peaks (heartbeats)
- Compare implementations across Python, MATLAB, and C
  
---

## Project Components

### Python (Data Analysis and Visualisation)
- ECG signal loading from real dataset
- Bandpass filtering (0.5-40 Hz)
- Peak detection
- Heart rate estimation
- Visualisation of ECG signals

---

### C (Low-level Signal Processing)
- Manual peak detection implementation
- Efficient array-based signal processing
- Focus on performance and embedded systems concepts

---

### MATLAB (Engineering Analysis)
- Signal filtering and modelling
- Frequency domain analysis
- Engineering-focused visualisation

---

## Dataset
The ECG dataset used in this project is the MIT-BIH Arrhythmia Dataset.

Due to file size limitations, the dataset is not included in this repository.

### How to Run
1. Download from Kaggle:
   
https://www.kaggle.com/datasets/shayanfazeli/heartbeat

2. Place the file in a local "data/" folder:

project/ |----data/ ¬ mitbih_train.csv

3. Run the scripts:
- Python:
  
  data = pd.read_csv('../data/mitbih_train.csv')
- Matlab:
  
  data = readmatrix('../data/mitbih_train.csv');

---

## Mathematical Model
$$
HR = \frac{N_{\text{peaks}}}{T} \times 60
$$

where:

- HR = heart rate (BPM)
- N_peaks = number of detected peaks
- T = signal duration (seconds)

---

## Results
- Succesful ECG peak detection
- Estimated heart rate (~55 bpm)
- Clear signal visualisation

---

## Technologies Used
- Python
- C
- MATLAB

---
## Author
Marina Ntoko

Bachelor of Physics Student

## Data Source
MIT-BIH Arrhythmia Dataset (via PhysioNet / Kaggle)

## License
This project is licensed under the MIT License

## Notes
This project demonstrates the application of physics and signal processing techniques to biomedical data, relevant to medical device development




