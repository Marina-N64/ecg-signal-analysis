%% =========================================
% ECG Signal Analysis (MATLAB - Advanced)
% Name: Marina Ntoko
% Course: Bachelor of Physics
% =========================================

clear; clc; close all;

%% =========================================
% LOAD DATA
% =========================================
% ECG signal imported from MIT-BIH dataset (CSV format)
data = readmatrix('mitbih_train.csv');

% Select a segment of the signal
ecg_signal = data(1:1000);

%% =========================================
% TIME DOMAIN SETUP
% =========================================
% Time vector:
% t = n / f_s
% where:
% n = sample index
% f_s = sampling frequency (Hz)

fs = 250; % Sampling frequency (Hz)
t = (0:length(ecg_signal)-1)/fs;

%% =========================================
% NOISE SIMULATION
% =========================================
% Add Gaussian noise:
% x_noisy(t) = x(t) + n(t)
% where n(t) ~ N(0, sigma^2)

noise = 0.05 * randn(size(ecg_signal));
noisy_signal = ecg_signal + noise;

%% =========================================
% FILTER DESIGN (BUTTERWORTH LOW-PASS)
% =========================================
% Transfer function:
% |H(jw)| = 1 / sqrt(1 + (w/w_c)^(2n))
%
% where:
% w_c = cutoff frequency
% n = filter order

cutoff_freq = 30; % Hz
[b, a] = butter(2, cutoff_freq/(fs/2), 'low');

%% =========================================
% APPLY FILTER
% =========================================
% Zero-phase filtering:
% y(t) = filtfilt(b, a, x(t))
% Eliminates phase distortion

filtered_ecg = filtfilt(b, a, noisy_signal);

%% =========================================
% PEAK DETECTION
% =========================================
% Peaks satisfy:
% x(i) > x(i-1), x(i+1)
% and x(i) > threshold

[pks, locs] = findpeaks(filtered_ecg, ...
    'MinPeakHeight', 0.7, ...
    'MinPeakDistance', round(0.6*fs));

%% =========================================
% HEART RATE CALCULATION
% =========================================
% Heart rate:
% HR = (N_peaks / T) * 60
%
% where:
% N_peaks = number of detected peaks
% T = signal duration (seconds)

duration = length(filtered_ecg)/fs;
heart_rate = (length(pks)/duration) * 60;

%% =========================================
% VISUALISATION
% =========================================
figure;

% Raw signal
subplot(3,1,1);
plot(t, ecg_signal);
title('Raw ECG Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Noisy signal
subplot(3,1,2);
plot(t, noisy_signal);
title('Noisy ECG Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Filtered signal with peaks
subplot(3,1,3);
plot(t, filtered_ecg, 'b'); hold on;
plot(t(locs), pks, 'ro');
title('Filtered ECG with Peak Detection');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Filtered ECG','Detected Peaks');

%% =========================================
% OUTPUT RESULTS
% =========================================
fprintf('Detected Peaks: %d\n', length(pks));
fprintf('Estimated Heart Rate: %.2f BPM\n', heart_rate);