# Decision Tree Regressor vs Decision Tree Classifier

Decision trees can be used for both regression and classification tasks. They work by splitting the data into smaller and smaller subsets based on the features of the data. Each split is made to minimize the impurity of the subsets.

**Decision tree regressors** are used to predict continuous target variables, such as the price of a house or the number of customers who will visit a store on a given day. To make a prediction, the decision tree regressor traverses the tree from the root node to the leaf node that matches the features of the new data point. The predicted value is then the mean value of the target variable for all the data points in the leaf node.

**Decision tree classifiers** are used to predict categorical target variables, such as whether an email is spam or not or whether a customer will churn or not. To make a prediction, the decision tree classifier traverses the tree from the root node to the leaf node that matches the features of the new data point. The predicted class is then the class with the majority of data points in the leaf node.

Another major difference between decision tree regressors and classifiers is the impurity metric that they use to split the data. Decision tree regressors typically use the **mean squared error (MSE)** as their impurity metric, while decision tree classifiers typically use **entropy** or the **Gini index**.

### What is MSE and Entropy(Gini Index)?
**MSE** is a measure of how far apart the predicted values are from the actual values. It is calculated by taking the average of the squared differences between the predicted and actual values.

**Entropy** is a measure of the uncertainty in a dataset. 

**Gini index** is another measure of the uncertainty in a dataset. It is calculated by taking the sum of the squares of the probabilities of each class.



