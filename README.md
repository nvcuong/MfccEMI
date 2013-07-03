Copyright (C) 2013 Nguyen Viet Cuong.

This is the README file for MfccEMI version 1.0.

MfccEMI is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

MfccEMI is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

The GNU General Public License can be found at http://www.gnu.org/licenses/.

---

This program uses the voicebox toolbox for MATLAB at:
http://www.ee.ic.ac.uk/hp/staff/dmb/voicebox/voicebox.html

This program computes the features for the eye movement identification problem and store them in ARFF format, which can be processed by Weka.

Details of the feature construction algorithm can be found in the following paper:

Nguyen Viet Cuong, Vu Dinh, Lam Si Tung Ho. 
Mel-frequency Cepstral Coefficients for Eye Movement Identification. 
IEEE International Conference on Tools with Artificial Intelligence (ICTAI 2012).

Input to the program is a file named 'data.emd', which stores eye movement data in EMD1 format. 
This is a subset of the dataset A in the EMVIC 2012 Competition.
A description of the EMD1 format can be found at: http://www.emvic.org/
