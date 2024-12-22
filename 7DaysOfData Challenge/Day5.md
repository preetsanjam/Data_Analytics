# Bagging vs Boosting in Machine Learning

Bagging and boosting are both ensemble learning techniques that aim to improve the performance of machine learning models by combining the predictions of multiple base learners. One of the primary motivations when we deal with ensemble methods is to have **lower variation**.

## Bagging (Bootstrap Aggregating)
Multiple base models are trained independently and in **parallel** on different subsets of the training data. Each subset is generated using **bootstrap sampling**, in which data points are picked at random with replacement. In the case of the bagging classifier, the final prediction is made by aggregating the predictions of the all-base model using majority voting. In the models of regression, the final prediction is made by averaging the predictions of the all-base model, and that is known as bagging regression. **Bagging helps to reduce the variance error.**

One of the primary goals of bagging is to reduce overfitting by exposing each base learner to slightly different variations of the training data. Since each subset is created by sampling with replacement, some instances may be duplicated while others may be omitted. This diversity helps the ensemble model generalize well to unseen data.

**The most well-known algorithm for bagging is the Random Forest.** 

One key **advantage** of bagging is its ability to handle noisy data and outliers effectively. Since the ensemble model aggregates predictions from multiple base learners, the impact of outliers on the overall performance is reduced.

**Out-of-bag (OOB) score**
While taking the samples, data points are chosen randomly and with replacement, and the data points which fail to be a part of that particular sample are known as **out-of-bag points**.

The out-of-bag (OOB) score is a way of validating the Random Forest model. It serves as a reliable validation score, offering an insight into the model’s prediction error without the need for a separate validation dataset.

As compared to the validation score, the OOB score is computed on data that is not necessarily used in the analysis of the model. Whereas for calculating the validation score, a part of the original training dataset is actually set aside before training the models. Additionally, the OOB score is calculated using only a subset of Decision Trees not containing the OOB sample in their bootstrap training dataset. The validation score, on the other hand, is calculated using all Decision Trees of the ensemble.

## Boosting
Boosting aims to improve the performance of weak learners by combining them in a **sequential manner**. The core idea behind boosting is to give more weight to misclassified instances during the training process, enabling subsequent learners to focus on the mistakes made by their predecessors.

Unlike bagging, boosting does not rely on bootstrapped subsets of the data. Instead, it assigns weights to each instance in the training set and adjusts these weights throughout the boosting iterations. In each iteration, a new weak learner is trained on the data, and the weights of misclassified instances are increased. This allows the subsequent learner to pay more attention to the previously misclassified examples.

**The sequential way:**
- In Boosting algorithms each classifier is trained on data, taking into account the previous classifiers’ success.
- After each training step, the weights are redistributed. Misclassified data increases its weights to emphasise the most difficult cases.
- In this way, subsequent learners will focus on them during their training.

One of the significant advantages of boosting is its ability to handle complex relationships in the data and improve the performance of weak learners significantly. Boosting often outperforms bagging when it comes to reducing both bias and variance, with a focus on reducing bias by sequentially correcting mistakes made by weak learners. However, boosting is more sensitive to noisy data and outliers compared to bagging.

### TechBYTE
A federal regulator sued JPMorgan Chase, Wells Fargo and Bank of America on Friday (December 20, 2024), claiming the banks failed to protect hundreds of thousands of consumers from rampant fraud on the popular payments network Zelle, in violation of consumer financial laws. In the federal civil complaint, the Consumer Financial Protection Bureau asserts that the banks rushed to get the peer-to-peer payments platform to market without effective safeguards against fraud and then, after consumers complained about being defrauded on the service, largely denied them relief.


