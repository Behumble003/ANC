# Active Noise Control System for Headphone Applications

**Author(s):** Sen M. Kuo, Woon-Seng Gan, Sohini Mitra

**Source:** DOI:10.1109/TCST.2005.863667

**Date Read:** 2025-09-24

---

## 🔑 Key Takeaways

* **Optimized Microphone Placement:** The system's superior performance is largely due to placing the error microphone at an experimentally determined optimal location (Position #8) inside the ear-cup. This spot yields the flattest frequency response for the secondary path, which is critical for the stability and effectiveness of the ANC algorithm.
* **Music as a Training Signal:** The research successfully demonstrated that music with rich frequency content ("O Fortuna from Carmina Burana") can be used to model the secondary acoustic path just as accurately as traditional, annoying signals like white noise.
* **Superior Performance:** When implemented on a real-time DSP, the designed Adaptive Feedback ANC (AFANC) headphone significantly outperformed a leading commercial model (Bose QuietComfort 2) in reducing recorded low-frequency engine noise.

---

## 📝 Detailed Summary

### I. System Design and Objective

The project addresses the challenge of attenuating low-frequency noise from sources like engines and fans, where passive methods are often ineffective. The solution is an **Active Noise Control (ANC)** system that generates "anti-noise" to cancel unwanted sound inside a headphone.

The system uses an **Adaptive Feedback Active Noise Control (AFANC)** architecture, which is more compact and lower-cost than feedforward systems because it doesn't require an external reference microphone. The core of the system is the **Filtered-X Least-Mean-Square (FXLMS)** algorithm. This algorithm's performance is critically dependent on accurately modeling the **secondary path** (the path from the DSP output to the error microphone input).

The primary goal was to optimize this secondary path to achieve noise cancellation superior to high-end commercial headphones.

<img width="437" height="267" alt="image"  src="https://github.com/user-attachments/assets/fa946518-24d8-4f64-8290-d385fa39bd3e" />

### II. Core Technical Innovations

#### A. Secondary Path Optimization via Microphone Placement

The stability of the ANC system is tied to the adaptive filter `W(z)` correctly modeling the inverse of the secondary path `S(z)`. If `S(z)` has dips or nulls, the system can become unstable. Therefore, achieving a flat secondary path response is a key design goal.

* **Methodology:** Eight different microphone locations were tested on a KEMAR (Knowles electronics mannequin for acoustics research) to study the effect of the outer ear on the acoustic path.
* **Optimal Location:** Position #8, near the external auditory meatus (ear canal entrance), was found to produce "the flattest frequency response with least number of dips and peaks."
* **Validation:** The response at position #8 closely matched the response measured deep inside the KEMAR's ear canal, confirming that this placement optimizes noise reduction as perceived by a human listener.
<img width="419" height="326" alt="image" src="https://github.com/user-attachments/assets/50493bcb-56fb-4b47-ad87-4860221ca64d" />
<img width="395" height="301" alt="image" src="https://github.com/user-attachments/assets/5aa2c3a3-8758-4429-9447-dc59465c655c" />


#### B. Secondary Path Modeling with Music Signals

Accurate modeling of the secondary path is essential but typically requires annoying excitation signals like white noise.

* **Alternative Approach:** The study investigated using music as a user-friendly alternative.
* **Signal Selection:** A piece from “O Fortuna from Carmina Burana” was found to have consecutive frames that were rich in frequency content and nearly flat from 0–4 kHz.
* **Result:** The music signal produced an estimate of the secondary path's magnitude response that was "closely matched to the system to be modeled," proving it can be as effective as conventional training signals.

### III. Real-Time Implementation and Experimental Setup

* **Hardware Platform:**
    * **Headphone:** A modified Sennheiser HD 565 Ovation with a microphone added at position #8.
    * **Processor:** Spectrum Signal Processing Inc. TMS320C32 DSP board.
    * **Test Fixture:** A KEMAR mannequin was used for all tests to simulate a human listener.
* **Algorithm Parameters:**
    * **Secondary Path Modeling Filter:** Length 65, step size 0.05.
    * **ANC Adaptive Filter:** Length 110, step size 0.3.

### IV. Performance Evaluation and Results

#### A. Sinusoidal Noise Performance

The system achieved significant attenuation for pure tones, with over **50-dB attenuation** for frequencies up to 2 kHz.

#### B. Comparative Engine Noise Performance

The designed headphone was compared directly against a leading commercial ANC headphone using recorded engine noises.

| Engine Speed | Harmonic Freq. | Designed AFANC Headphone (NIU) | Commercial ANC Headphone |
| :----------- | :------------- | :----------------------------- | :----------------------- |
| **3700 rpm** | 61 Hz          | **20.906 dB** | 0.685 dB                 |
|              | 122 Hz         | **18.387 dB** | 8.284 dB                 |
|              | 183 Hz         | **16.293 dB** | 14.575 dB                |
| **2200 rpm** | 76 Hz          | **14.371 dB** | 0.919 dB                 |
|              | 116 Hz         | **25.627 dB** | 6.955 dB                 |
|              | 156 Hz         | **26.767 dB** | 12.25 dB                 |
|              | 196 Hz         | 13.197 dB                      | **13.409 dB** |

#### C. Analysis of Comparative Results

The data shows a "marked improvement in noise cancellation" for the designed headphone compared to the commercial model, especially at the most prominent low-frequency harmonics. The performance gaps at 116 Hz and 156 Hz for the 2200 rpm noise are particularly large.
Prefer in the article for more pictures of the result.

### V. Conclusion

The research successfully demonstrates that meticulous system optimization—specifically **ideal microphone placement** and the novel use of **music for system modeling**—can lead to an ANC headphone with performance superior to that of high-end commercial products.

---

## 🤔 My Thoughts & Reflections

* How does this connect to my current ANC project?
  
  Knowing of the best position of the error microphone will enhance the project set-up, which may lead to better results.
* What did I find surprising or disagree with?

  Disagree: I found that the comparation results at Fig.8 and Fig.10 are not very positive.
  <img width="876" height="332" alt="image" src="https://github.com/user-attachments/assets/9cf25002-cfba-406c-be9e-921c255cdcf4" />
  They did attually well at the Frequency below 200Hz. But the commercial ANC headphone canceled the noise far better in the 200-500Hz range.

* What questions do I have after reading this?
