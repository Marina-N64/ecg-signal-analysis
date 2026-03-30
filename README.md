# ecg-signal-analysis
## Overview
This project explores electrocardiogram (ECG) signal processing using multiple programming enviroments: Python, C and MATLAB.

It demonstrates how biomedical signals can be analysed, filtered, and interpreted using both high-level and low-level approaches.

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
Due to file size limitations, the dataset is not included in this repository.

Download from Kggle:
https://www.kaggle.com/datasets/shayanfazeli/heartbeat

Place "mitbih_train.csv" in the same folder as the Python notebook.

---

## Mathematical Model

$$
HR = \frac{N_\text{peaks}}}{T} \times 60
$$

where:
- HR = heart rate (BPM)
- \(N_{\text{peaks}}\) = number of detected peaks
- \(T\) = signal duration (seconds)

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
Bachelor of Physics

## Notes
This project demonstrates the application of physics and signal processing techniques to biomedical data, relevant to medical device development




