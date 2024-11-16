# Speech Emotion Recognition Using Feature Extraction and Deep Learning (MatLab)

This repository presents a comprehensive thesis project on **Speech Emotion Recognition** using a combination of feature extraction techniques and **Deep Learning** in **MATLAB**. The research focuses on analyzing speech data from both normal and autistic subjects to classify emotions (Angry, Happy, Neutral, Sad) and detect language disorders.

The project introduces the first-ever **Urdu speech dataset** for emotion recognition, created in collaboration with local medical experts. The dataset is balanced and covers diverse emotional states, making it a valuable contribution to the field of speech processing.

## 🎯 Key Features
1. **Urdu Speech Dataset**:
   - Collected from normal and autistic subjects.
   - Balanced across four emotions: Angry, Happy, Neutral, Sad.
2. **Feature Extraction**:
   - Includes pitch contour, rate of acceleration, formant frequencies, intensity, MFCC, LPCC, Rasta PLP, and more.
   - Comprehensive analysis of audio signal characteristics like frequency, intensity, formants, and energy.
3. **Emotion Recognition**:
   - Classification of emotions using **Support Vector Machines (SVM)**, **K-Nearest Neighbors (KNN)**, **Neural Networks (NN)**, and a **Hybrid Model**.
   - Dynamic Time Warping (DTW) and Hidden Markov Models (HMM) for speech disorder recognition.
4. **MATLAB Implementation**:
   - Feature extraction and classification performed using MATLAB’s powerful signal processing and machine learning libraries.
5. **Comparative Analysis**:
   - Comparison of normal and autistic speech patterns at the audio signal level.
   - Detailed error rates and performance metrics for classification algorithms.
---
## Demostration
![464832052_27429708910007088_361722359150592736_n](https://github.com/user-attachments/assets/78517d76-ab9d-42cb-9f41-766b916085d4)
## Flow Diagram
![image](https://github.com/user-attachments/assets/43796264-a24b-4349-8f0c-990a390f9d49)


## 📊 Performance Summary
### Classification Algorithms:
| Algorithm | Normal Error | Disorder Error | Performance (Normal) | Performance (Disorder) |
|-----------|--------------|----------------|-----------------------|-------------------------|
| **SVM**   | 0            | 0.1667         | 1                     | 0.8333                 |
| **KNN**   | 0.1667       | 0.6667         | 0.8333                | 0                      |
| **NN**    | 0.1667       | 0.3333         | 0.8333                | 0.6667                 |
| **Hybrid**| 0            | 0.333          | 1                     | 1                       |

### Feature Comparisons:
#### Emotions and Signal Characteristics
| **Feature**         | **Angry**                                 | **Happy**                                 | **Neutral**                               | **Sad**                                   |
|----------------------|-------------------------------------------|-------------------------------------------|-------------------------------------------|-------------------------------------------|
| **Frequency**        | Aperiodic Wave (1 to -1)                 | Aperiodic Wave (1 to -1)                 | Aperiodic Wave (0.5 to -0.5)              | Aperiodic Wave (0.5 to -0.5)              |
|                      | Spectrum: -50 to 50                      | Spectrum: -50 to 50                      | Spectrum: -50 to 50                      | Spectrum: -50 to 50                      |
|                      | Cepstrum: 0 to 2700                      | Cepstrum: 0 to 1800                      | Cepstrum: 0 to 2500                      | Cepstrum: 0 to 4000                      |
| **Intensity**        | Light concavity (-2 to -14)              | Light concavity (-1 to -7)               | Medium concavity (-0.4 to -2)            | Light concavity (-2 to -15)              |
| **Formants**         | Vowel Wave (-0.5 to 1)                   | Vowel Wave (-0.5 to 1)                   | Vowel Wave (-0.5 to 1)                   | Vowel Wave (-0.5 to 1)                   |
|                      | High Intensity finer wave                | Medium Intensity finer wave              | Very Small Intensity finer wave          | Small Intensity finer wave               |
| **Pitch Autocorrelation** | Aperiodic pitch pattern (-100 to 100)  | Aperiodic pitch pattern (-200 to 200)    | Aperiodic pitch pattern (-500 to 500)    | Aperiodic pitch pattern (-200 to 200)    |
| **Pitch Contour**    | Pitch variation (0 to 1000)              | Pitch variation (0 to 1000)              | Pitch variation (0 to 1000)              | Pitch variation (0 to 1000)              |
| **Velocity**         | Light concavity (0 to 0.01)              | Light concavity (0 to 0.01)              | Deep concavity (0 to 0.01)               | Light concavity (0 to 0.01)              |
| **Acceleration**     | Straight Line (-5 to 0)                  | Straight Line (-5 to -1)                 | Straight Line (-5 to 2)                  | Straight Line (-5 to 0)                  |
| **Average Energy**   | Less intense pattern (0 to 62K)          | Less intense pattern (0 to 65K)          | Less intense pattern (0 to 9K)           | Less intense pattern (0 to 11K)          |
| **Average Power**    | Less intense pattern (0 to 0.2)          | Less intense pattern (0 to 0.22)         | Less intense pattern (0 to 0.03)         | Less intense pattern (0 to 0.035)        |
| **Rate of Zero Passage** | High intensity pattern (0.04 to 0.5)     | High intensity pattern (0.05 to 0.3)     | High intensity pattern (0.4 to 0.35)     | High intensity pattern (0.02 to 0.22)    |
| **MFCC**             | Medium intense energies                  | Highly intense energies                  | Low intense energies                     | Very low intense energies                |
| **LPCC**             | Less intense pattern (-0.2 to -0.05)     | Less intense pattern (-0.25 to -0.05)    | Less intense pattern (-0.3 to -0.05)     | Less intense pattern (-0.35 to -0.05)    |
| **Rasta PLP**        | Highly intense energies                  | Medium intense energies                  | Very low intense energies                | Low intense energies                     |


## ⚙️ Methodology
1. **Speech Feature Extraction**:
   - Extracted features include pitch, intensity, formants, zero-passage rate, energy, and more.
   - Features computed for interval-based emotion classification.
2. **Model Training and Testing**:
   - Speech-dependent emotion recognition using machine learning classifiers like SVM, KNN, and NN.
   - Dynamic Time Warping (DTW) and Hidden Markov Models (HMM) used for language disorder recognition.
3. **Evaluation**:
   - Metrics include accuracy, error rates, and performance analysis across emotional states and disorders.

---

## 🛠️ How to Use
### Requirements:
- **MATLAB** (with Signal Processing Toolbox and Machine Learning Toolbox).

### Steps:
1. Clone the repository:
   ```bash
   git clone https://github.com/AlinaBaber/Speech-Emotions-Recognition-by-feature-extraction-and-Deep-learning-MatLab
    ```
2. Open MATLAB and navigate to the project directory.
3. Run the feature extraction scripts to preprocess the dataset it Also has UI to Use.
4. Execute the classification models to evaluate the recognition accuracy.
📚 Contribution
This project represents a step forward in understanding speech disorders and emotion recognition. By utilizing machine learning and deep learning techniques on real-life Urdu speech data, it provides valuable insights into the intersection of linguistics, AI, and healthcare.

### Acknowledgments
Medical Experts: For their collaboration in creating the dataset.
Support Team: For assisting with data collection and annotation.
For any queries or suggestions, feel free to open an issue or connect with me!

### License
This project is licensed under the MIT License. See the LICENSE file for details.
