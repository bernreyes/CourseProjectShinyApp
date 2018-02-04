Course Project: Shiny Application and Reproducible Pitch
========================================================
author: Bern Reyes
date: 2/5/18
autosize: true

Overview
========================================================

This presentation contains the documentation for the application about the survival rate of Female and Male Australian patients diagnosed of AIDs before July 1991.

This application computes the survival rate given the selected values in the following categories:

- Age (years) by the time of diagnosis
- State origin of the patient

Data
========================================================

The data used is Aids2 from COUNT library. It contains 2843 observations and 7 variables. Other information can be found [**here**] (https://stat.ethz.ch/R-manual/R-devel/library/MASS/html/Aids2.html). 


Here is the summary of the Aids2 data:

```r
library(COUNT)
summary(Aids2)
```

```
   state      sex           diag           death       status  
 NSW  :1780   F:  89   Min.   : 8302   Min.   : 8469   A:1082  
 Other: 249   M:2754   1st Qu.:10163   1st Qu.:10672   D:1761  
 QLD  : 226            Median :10665   Median :11235           
 VIC  : 588            Mean   :10584   Mean   :10990           
                       3rd Qu.:11103   3rd Qu.:11504           
                       Max.   :11503   Max.   :11504           
                                                               
    T.categ          age       
 hs     :2465   Min.   : 0.00  
 blood  :  94   1st Qu.:30.00  
 hsid   :  72   Median :37.00  
 other  :  70   Mean   :37.41  
 id     :  48   3rd Qu.:43.00  
 haem   :  46   Max.   :82.00  
 (Other):  48                  
```

Web Application
========================================================

The created application is located here:
https://breyes0409.shinyapps.io/CourseProjectShinyApp/

In this application, the user will need to select two demographic information and analyze the survival rate by sex. Only two categories were used to filter the data to get enough sample size.

1. The age when the patient was diagnosed: Using a slider, the user will select the range of the age to be considered in the data.

2. The state of origin of the patient: using dropdown list, the user will choose from the list of states.

The application will compute and graph the survival rate of female and male patients.


Overall Survival Rate by Sex
========================================================

![plot of chunk unnamed-chunk-2](Presentation-figure/unnamed-chunk-2-1.png)

Overall, the survival rate of female patients diagnosed with AIDS is higher than the male patients.
