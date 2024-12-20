# Decision Tree Regressor vs Decision Tree Classifier

Decision trees can be used for both regression and classification tasks. They work by splitting the data into smaller and smaller subsets based on the features of the data. Each split is made to minimize the impurity of the subsets.

**Decision tree regressors** are used to predict continuous target variables, such as the price of a house or the number of customers who will visit a store on a given day. To make a prediction, the decision tree regressor traverses the tree from the root node to the leaf node that matches the features of the new data point. The predicted value is then the mean value of the target variable for all the data points in the leaf node.

**Decision tree classifiers** are used to predict categorical target variables, such as whether an email is spam or not or whether a customer will churn or not. To make a prediction, the decision tree classifier traverses the tree from the root node to the leaf node that matches the features of the new data point. The predicted class is then the class with the majority of data points in the leaf node.

Another major difference between decision tree regressors and classifiers is the impurity metric that they use to split the data. Decision tree regressors typically use the **mean squared error (MSE)** as their impurity metric, while decision tree classifiers typically use **entropy** or the **Gini index**.

### What is MSE and Entropy(Gini Index)?
**MSE** is a measure of how far apart the predicted values are from the actual values. It is calculated by taking the average of the squared differences between the predicted and actual values.

**Entropy** is a measure of the uncertainty in a dataset. 

**Gini index** is another measure of the uncertainty in a dataset. It is calculated by taking the sum of the squares of the probabilities of each class.

### TechBYTE
Amazon drivers went on strike in four states across the US on Thursday (Dec 19, 2024) with less than a week to go before Christmas – but the company is saying it’s not going to affect the holiday deliveries. Members of the Teamsters union are striking at seven facilities across four states, and even though the Teamsters claim to represent 7,000 Amazon workers nationwide, that accounts for less than 1% of the company’s US workforce. The International Brotherhood of Teamsters said unionized workers at facilities in New York City; Skokie, Illinois; Atlanta, San Francisco and southern California will join the picket line to seek contracts guaranteeing better wages and work conditions.



