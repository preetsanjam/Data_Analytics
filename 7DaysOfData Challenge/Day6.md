# Boosting Algorithms
Boosting is one of the techniques that use the concept of ensemble learning. A boosting algorithm combines multiple simple models (also known as weak learners or base estimators) to generate the final output. The three boosting algorithms that I am focussing on are:

- AdaBoost (Adaptive Boosting)
- Gradient Boosting Machine (GBM)
- Extreme Gradient Boosting Machine (XGBM) 

## AdaBoost (Adaptive Boosting)
 The main idea behind the AdaBoost algorithm is that it iteratively trains a sequence of weak classifiers on different subsets of the training data. During each iteration, the algorithm assigns higher weights to the misclassified samples from the previous iteration, thereby focusing on the more challenging examples. This process allows the subsequent weak classifiers to pay more attention to the previously misclassified samples and improve their performance.

In a nutshell, we can say that adaptive boosting is a way to reduce the error of any machine-learning algorithm, which work by aligning many weak machine-learning models into one strong machine-learning model.

## Gradient Boosting Machine (GBM)
Gradient Boosting is a powerful boosting algorithm that combines several weak learners into strong learners, in which each new model is trained to minimize the loss function such as mean squared error or cross-entropy of the previous model using gradient descent. In each iteration, the algorithm computes the gradient of the loss function with respect to the predictions of the current ensemble and then trains a new weak model to minimize this gradient. The predictions of the new model are then added to the ensemble, and the process is repeated until a stopping criterion is met.

In contrast to AdaBoost, the weights of the training instances are not tweaked, instead, each predictor is trained using the residual errors of the predecessor as labels.

Gradient Boosting relies on the intuition that the next model, when combined with the previous model, minimises the overall prediction error. In Gradient Boosting, we don't predict actual labels of the data at each iteration. Instead, we try to predict the **residual** errors made by the previous predictor. 

## Extreme Gradient Boost Machine (XGBM)
Extreme Gradient Boosting or XGBoost is simply an improvised version of the GBM algorithm. The working procedure of XGBoost is the same as the GBM. The trees in XGBoost are built sequentially, trying to correct the errors of the previous trees. The main concentration in XGBoost is **speed enhancement** and **model performance**.


