#include <stdio.h>
#include <stdlib.h>
/*
 * Author: Marina Ntoko
 * Course: Bachelor of Physics
 * -------------------------
 * Simple ECG Peak Detection Program
 * ---------------------------------
 * This program analyses a short ECG (electrocardiogram) signal
 * to detect heartbeat peaks based on simple thresholding and
 * local maxima comparison.
 *
 * It demonstrates array traversal, condition checking, and
 * basic signal analysis
 */
 // Example ECG signal (test data)
float ecg_signal[] = {0.1, 0.2, 0.15, 0.3, 0.8, 0.2, -0.1, 0.005, 0.2, 0.7, 0.1};
int length = 11; // number of samples in the signal
/*
* Function: detect_peaks
* ----------------------
* Detects the number of peaks in the ECG signal.
* Parameters:
*   signal[] : input array containing ECG amplitude values
*   size     : number of samples in the signal
*
* Returns:
*   The number of detected peaks.
*
* Detection logic:
*   - A peak is detected when a sample is greater than both its neighbours
*   - Additionally, it must exceed a certain amplitude threshold (0.5 in this case)
*/
// Function to detect peaks
int detect_peaks(float signal[], int size) {
    int count = 0; //number of detected peaks
    int i;        // loop counter
    for (i = 1; i < size - 1; i++) { // Iterate through signal samples, excluding the first and last element
        // Condition for a local maximum above threshold
        if (signal[i] > signal[i - 1] &&
            signal[i] > signal[i + 1] &&
            signal[i] > 0.5)
        {

            count++; // increment when a peak is found
        }
    }

    return count;  // return total number of peaks detected
}
int main() {
    // Count the number of peaks in the ECG signal
    int peaks = detect_peaks(ecg_signal, length);

/*
* Heart Rate Formula:
* ------------------
*
* HR = (N_peaks / T) x 60
*
* Where:
* - HR = heart rate (BPM)
* - N_peaks = number of detected peaks
* - T = signal duration (s)
*/

    float duration = 2.0; // seconds
    float heart_rate = (peaks / duration) * 60.0; // beats per minute
    printf("Detected Peaks: %d\n", peaks);
    printf("Estimated Heart Rate: %.2f bpm\n", heart_rate);
        return 0;
}
