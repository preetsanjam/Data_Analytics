# Decision Tree Regressor vs Decision Tree Classifier

Decision trees can be used for both regression and classification tasks. They work by splitting the data into smaller and smaller subsets based on the features of the data. Each split is made to minimize the impurity of the subsets.

**Decision tree regressors** are used to predict continuous target variables, such as the price of a house or the number of customers who will visit a store on a given day. To make a prediction, the decision tree regressor traverses the tree from the root node to the leaf node that matches the features of the new data point. The predicted value is then the mean value of the target variable for all the data points in the leaf node.

**Decision tree classifiers** are used to predict categorical target variables, such as whether an email is spam or not or whether a customer will churn or not. To make a prediction, the decision tree classifier traverses the tree from the root node to the leaf node that matches the features of the new data point. The predicted class is then the class with the majority of data points in the leaf node.

Another major difference between decision tree regressors and classifiers is the impurity metric that they use to split the data. Decision tree regressors typically use the **mean squared error (MSE)** as their impurity metric, while decision tree classifiers typically use **entropy** or the **Gini index**.

### What is MSE and Entropy(Gini Index)?
**MSE** is a measure of how far apart the predicted values are from the actual values. It is calculated by taking the average of the squared differences between the predicted and actual values.

**Entropy** is a measure of the uncertainty in a dataset. In the most layman terms, entropy is nothing but the measure of disorder. It can be thought of as a measure of purity as well.

Entropy of 0.88 means a high level of disorder or low level of purity. A higher entropy value indicates a more heterogeneous dataset with diverse classes. A lower entropy signifies a more pure and homogeneous subset of data. 

Entropy is a measure of randomness in the information being processed. The higher the entropy, the harder it is to draw any conclusions from that information.

**Gini index** is another measure of the uncertainty in a dataset. It is calculated by taking the sum of the squares of the probabilities of each class. Its value ranges from 0 and 1. 

Gini index = 0 means completely pure dataset (all elements are identical)

Gini index = 1 means wholly impure dataset (all elements are distinct)

In decision trees, the Gini index plays a pivotal role as a criterion for assessing the quality of binary splits. An attribute with a lower Gini index should be preferred, i.e., the lower the Gini impurity, the better the feature is for splitting the dataset. The Gini impurity value of 0.45 represents that there is a 45% chance of misclassifying a sample if we were to randomly assign a label from the dataset to that sample.


