DATA WEATHER_HISTOGRAMS;

/*
 * ----ASSIGMENT_2---------
 * Author: Jose L Rodriguez
 * Assigment: 2
 * Probleml:  2.2c
 * Date: September 18th, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 * 
 * Histogram#1 for Mean Wind Speed MPH variable
 * Histogram#2 for Max Wind Speed MPH variable
 * Histogram#3 for Max Gust Speed MPH variable
 */
Proc Univariate Data = WORK.WEATHER NOPRINT;
Title "MEAN WIND SPEED MPH";
   histogram MeanWindSpeedMPH /NORMAL;
   inset  	skewness = "Skew" (4.3)  
		 	Kurtosis = "Kurtosis" (4.3)
			mean = "Mean" (4.3)
			std="Std Dev" (4.3)/ 				
			Pos = NE
			Height = 4;
Run;
Proc Univariate Data = WORK.WEATHER NOPRINT;
Title "MAX WIND SPEED MPH";
   histogram MaxWindSpeedMPH /NORMAL;
   inset  	skewness = "Skew" (4.3)  
		 	Kurtosis = "Kurtosis" (4.3)
			mean = "Mean" (4.3)
			std="Std Dev" (4.3)/ 				
			Pos = NE
			Height = 4;
Run;
Proc Univariate Data = WORK.WEATHER NOPRINT;
Title "MAX GUST SPEED MPH";
   histogram MaxGustSpeedMPH /NORMAL;
   inset  	skewness = "Skew" (4.3)  
		 	Kurtosis = "Kurtosis" (4.3)
			mean = "Mean" (4.3)
			std="Std Dev" (4.3)/ 				
			Pos = NE
			Height = 4;
Run;

/*
 * Histogram_1 - Mean Wind Speed 
 *
 *****Skew description******
 * Skewness - indicates symmetry of the distribution.
 * Skew > 0 --- skew right, tail longer on right.
 *
 *****Kurtosis description*****
 * Kurtosis -  fourth moment, indicates how flat or peaked data
 * Kurtosis > 0 - Leptokurtic - Peaked/Fat tails
 *
 * Histogram_2 - Max Wind Speed
 *
 *****Skew description******
 * Skewness - indicates symmetry of the distribution.
 * Skew > 0 --- skew right, tail longer on right.
 *****Kurtosis description*****
 * Kurtosis -  fourth moment, indicates how flat or peaked data
 * Kurtosis > 0 - Leptokurtic - Peaked/Fat tails
 *
 * Histogram_3 - Max Gust Speed
 *
 *****Skew description******
 * Skewness - indicates symmetry of the distribution.
 * Skew > 0 --- skew right, tail longer on right.
 *****Kurtosis description*****
 * Kurtosis -  fourth moment, indicates how flat or peaked data
 * Kurtosis > 0 - Leptokurtic - Peaked/Fat tails
 *
 */