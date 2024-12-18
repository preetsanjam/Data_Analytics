# How to find outliers?

## 1. Sorting Method
Sort quantitative variables from low to high and scan for extremely low or extremely high values. Flag any extreme values that you find. This is a simple way to check whether or not you need to investigate certain data points before using more sophisticated methods.

### Example:
Your dataset for a pilot experiment consists of eight values.

180	156	9 176 163 1827 166 171

You sort the values from low to high and scan for extreme values.

9 156 163 166 171 176 180 **1872**

## 2. Box-and-whisker plot
We can use a software to visualize the data with a box plot or a box-and-whisker plot. helping us see the data distribution at a glance. The box plot highlights minimum and maximum values (the range), the median and the interquartile range for the data.

The box plot highlights an outlier on a chart with an asterisk, and these will lie outside the bounds of the graph.

## 3. Z-scores
We can convert extreme data points into z-scores that tell us how many standard deviations away they are from the mean. If a value has a high enough or low enough z-score, it can be considered an outlier. As a rule of thumb, values with a z-score greater than 3 or less than –3 are often determined to be outliers.

## 4. Interquartile range (IQR)
The interquartile range (IQR) tells us the range of the middle half of our dataset. We can use the IQR to create “fences” around the data and then define outliers as any values that fall outside those fences.
