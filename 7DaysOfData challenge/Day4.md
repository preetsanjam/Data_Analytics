# Random Forest

Random forest is a machine learning algorithm that combines the output of multiple decision trees to reach a single result. It handles both classification and regression problems. While decision trees are common supervised learning algorithms, they can be prone to problems such as bias and overfitting. However, when multiple decision trees form an ensemble in the random forest algorithm, they predict more accurate results, particularly when the **individual trees are uncorrelated with each other**.

Random forest is an ensemble technique wherein we construct multiple models and take the average output of all models to make the final decision/prediction. The fundamental idea behind a random forest is to combine many decision trees into a single model. Individually, predictions made by decision trees may not be accurate, but combined together, the predictions will be closer to the mark on average.

One of the most important features of the Random Forest algorithm is that it can handle the data set containing continuous variables, as in the case of regression, and categorical variables, as in the case of classification. 

**Why the name 'random forest'?** 

Much as people might rely on different sources to make a prediction, each decision tree in the forest considers a random subset of features when forming questions and only has access to a random set of the training data points. This increases diversity in the forest leading to more robust overall predictions and the name 'random forest'. When it comes time to make a prediction, the random forest takes an average of all the individual decision tree estimates. (This is the case for a regression task, such as our problem where we are predicting a continuous value of temperature. The other class of problems is known as classification, where the targets are a discrete class label such as cloudy or sunny. In that case, the random forest will take a majority vote for the predicted class).

**Desirable properties of each decision tree**
- The prediction strength of every tree must be high.
- The decision trees must not be correlated with each other.

**Use cases**
- Customer churn prediction
- Fraud detection
- Stock price prediction
- Image recognition

**Benefits**
- Reduced risk of overfitting
- Provides flexibility: Random forest can handle both regression and classification tasks
- Easy to determine feature importance

### TechBYTE
Qualcomm wins a legal battle over Arm chip licensing. A federal jury in Delaware determined on Friday (Dec 20, 2024) that Qualcomm didn’t breach its agreement with Arm through its 2021 acquisition of Nuvia, a startup founded by three former Apple engineers. The decision stems from a two-year-long legal battle that accused Qualcomm of misusing the chip designs Arm licensed to Nuvia before its acquisition.

In 2022, Arm ignited a legal battle after Qualcomm continued to pay its existing royalty fees to Arm, which were allegedly much lower than what Nuvia was paying. After the two failed to come to an agreement, Arm argued the designs licensed to Nuvia were no longer valid, and that Qualcomm should destroy the technology created with them.

