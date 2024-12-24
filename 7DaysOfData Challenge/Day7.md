# Probability vs Likelihood
In non-technical parlance, "likelihood" is usually a synonym for "probability," but in statistical usage there is a clear distinction in perspective. 

Probability corresponds to finding the chance of something given a sample distribution of the data, while likelihood refers to finding the best distribution of the data given a particular value of some feature or some situation in the data.

## Example of Probability
Consider a dataset containing the heights of the people of a particular country. Let’s say the mean of the data is 170 and  the standard deviation is 3.5.

When probability has to be calculated of any situation using this dataset, then the dataset features will be constant, i.e., mean and standard deviation of the dataset will be constant, they will not be altered. Let’s say the probability of height > 170 cm has to be calculated for a random record in the dataset, then that will be calculated using the information shown below:

> P(height > 170 | mu = 170, sigma = 3.5)

**While calculating probability, feature value can be varied, but the characteristics(mean & Standard Deviation) of the data distribution cannot be altered.**

If in the same dataset, the probability of height > 190 cm has to be calculated, then in the above equation, only the height part would have changed.

## Example of Likelihood
Likelihood calculation involves calculating the best distribution or best characteristics of data given a particular feature value or situation.

Consider the exactly same dataset example as provided above for probability, if their likelihood of height > 170 cm has to be calculated then it will be done using the information shown below:

>Likelihood(mu = 170, sigma = 3.5 | height > 170)

In the calculation of the Likelihood, the equation of the conditional probability flips as compared to the equation in the probability calculation.

Here, the dataset features will be varied, i.e. Mean & Standard Deviation of the dataset will be varied in order to get the maximum likelihood for height > 170 cm.

**The likelihood in very simple terms means to increase the chances of a particular situation to happen/occur by varying the characteristics of the dataset distribution.**

## Conclusion
Probability is used to find the chance of occurrence of a particular situation, whereas Likelihood is used to generally maximize the chances of a particular situation to occur. 

Probability is the measure of a specific event or an outcome occurring. It is about possible results.

Likelihood is applied when we want to increase the outcome of a specific event or an outcome occurring. It is about hypotheses. 

### TechBYTE
**Honda and Nissan plan to merge:** Honda and Nissan have announced plans to merge as the Japanese automakers struggle with competition from rival brands in the electric vehicle market. The two companies confirmed on Monday (Dec 23, 2024) that they had signed a memorandum of understanding that would create the third largest car maker by sales, behind Toyota and Volkswagen.

Nissan alliance member Mitsubishi Motors is also in talks with Honda and Nissan to join the integration, with a decision expected by the end of January. Based on the market capital of all three companies, a finalized merger could result in an entity worth more than 50 billion dollars. Honda will initially lead the management of the merged company according to Honda president, Toshihiro Mibe, with the aim to complete a formal merger agreement by June and finalize the deal by August 2026.
