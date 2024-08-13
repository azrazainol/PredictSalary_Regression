# Linear Regression

INTRODUCTION

Linear regression is a method that aims to find the relationship between a response variable or dependent variable (DV) with the predictor variables or independent variables (IV). The DV is the variable that we are interested in predicting in a linear regression model while the IV is the variable that is assumed to affect the values of the DV. Both the DV and IV should be numerical data but the DV must be continuous data while the IV can be continuous or categorical data. A linear regression model must have only one DV but it can have many IV. A linear regression with only one IV is a simple linear regression and a linear regression with many IV is a multiple linear regression. In this report, an empirical study will be done to create a linear regression model. The study will use a Salary data from Kaggle with information about salary and experience. The data is split into 70% training data and 30% testing data which is a commonly used ratio for testing and training data. The analysis is performed using R Studio.

EXPLORATORY DATA ANALYSIS

The Salary data is plotted in a pair plot to identify any relationship between the numerical variables. The plot is shown below. In the plot, an increasing relationship can be observed for the salary variable with the Total.Experience, Team.Lead.Experience and Project.Manager.Experience. Based on the information received from the plot, we can try modeling linear regression models with different combinations of the variables in the Salary data.

![D8AABD2A-B823-4DD1-BB45-EE6DA933EDE3](https://github.com/user-attachments/assets/28ba2129-8d22-4032-865f-9d8dd3e34f28)

LINEAR REGRESSION

To model the best linear regression model to predict the Salary, a few models were created with different numbers and combinations of IV. Each model will have an R-squared value and an adjusted R-squared value. The R-squared value in linear regression is an indicator of how much the model explains the DV. This means that a larger R-squared value is better because it explains the DV more than a model with a lower R-squared value.

The difference between an R-squared value and an adjusted R-squared value is that the adjusted R-squared value is the penalised R-squared value that comes from penalising a model for being complex. A more complex model will be penalised more because in modeling, it is always better to use a simple model for the sake of saving resources and making it easier to use the model. It is a given that a more complex model will be able to explain the DV better but it is costly and timely. If the R-squared value between a simple model and a complex model is compared, the complex model would most likely be chosen as the best model but it could be very expensive to use the model. This is why the adjusted R-squared value is important to make sure that comparison between models with different numbers of IV is fair. Hence, when doing comparison for this part of the analysis, the adjusted R-squared value will be used to compare the models.

The table below shows the combinations of the IV to create the linear regression models. The adjusted R-squared value is included for each model.

![ABF1DA4E-EB52-4E4E-B056-C14F5E34ED75](https://github.com/user-attachments/assets/7ebf2cfd-773a-4663-8629-1a13b7b9c912)

After comparing the adjusted R-squared values, the chosen model is lm4 because it has the second highest adjusted R-squared value and is not too different from the adjusted R-squared value of lm1 which is the most complex model. The next part of the analysis is to perform diagnostic tests on the model.

DIAGNOSTIC TEST

A good model should always provide valid, reliable and timely predictions with a reasonable cost or the lowest cost possible. It should also be as accurate as possible which means that the range of the prediction interval should have a small error only. The prediction interval is the range of values that the model allows to make up for any slight difference in the predictions as the model could not always have 100% accurate predictions. One way to make sure a model will perform well is by carrying out diagnostic tests.

In any type of modeling, diagnostic testing is crucial. It makes sure that the model would give valid and reliable predictions. Diagnostic tests could also help identify whether a model should be improvised or could be ready for use. In linear regression, it is important to make sure that the model meets all of the assumptions of a linear regression model. The assumptions of a linear regression model are:

linearity between the independent variables and dependent variable,
independence between the independent variables,
normality of residuals,
and independent variance and equal variance with a mean of zero.

The first diagnostic test which is the linearity test has been done in the Exploratory Data Analysis section earlier where the pair plot was checked to see the relationship between the variables. The relationship of the Salary variable with the Team.Lead.Experience,  Project.Manager.Experience, and Total.Experience variables were linear.

The second diagnostic test which is the independence test can only be done through knowledge about the data. Although there is some correlation between total experience and other experiences, the data source indicates that the three variables do not indicate the same thing. Due to that, we conclude that the variables are independent of one another.

The third diagnostic test is done by plotting the residuals of the model using a histogram plot. The fourth test is to check for equal variance of the residuals. The fourth test can be done by plotting a scatter plot for the residuals.

The histogram and scatter plot for lm4 residuals is shown side by side in the figure below. The histogram shows a normal distribution so lm4 passes the normality test. The scatter plot also shows equal and randomly scattered variance around the mean zero which also means that lm4 passes the independent variance and equal variance test.

![D3BD978E-2E03-4FA6-BEAE-C463D60C6F8E](https://github.com/user-attachments/assets/6e2c59d7-e035-4f7e-a60f-94ca84da549d)

LINEAR REGRESSION MODEL FORMULA

After the model has passed all the linear regression assumptions, the summary of the model is examined to see the model details. The summary contains the model formula, the coefficient values, the significance of each variable, and the adjusted R-squared value. The summary of the model is shown below. 

![288503F2-4753-4494-A2FC-AA432340E834_1_201_a](https://github.com/user-attachments/assets/99c13064-8b3e-4ff1-8cfb-150432cc6394)

The formula of the model can be retrieved from the ‘Estimate’ is:

Salary = 51635.20 + 1889.23(Team.Lead.Experience) + 961.44(Project.Manager.Experience) + 2990.38(Total.Experience)

In the Pr(>|t|) column, the p-value for the independent variables can be seen. All of the variables have a p-value lower than alpha 0.01 which means that the variables are all significant in explaining the DV. If the value is larger than the alpha value, it would indicate that the variable is not significant enough to explain or provide any effect towards the DV. A high p-value could also indicate multicollinearity.

Multicollinearity is when two variables used in a linear regression model are very correlated and explain the same thing. Multicollinearity occurs when two or more variables in a linear regression model are redundant and do not provide unique information. Multicollinearity would cause the model to not be able to decide the significance of the redundant variables causing the model to produce less reliable predictions due to non-stable residuals. This can be fixed by removing one by one the correlated variables from the model

TESTING MODEL

After checking the summary of the model, the model is tested using the testing data that was set aside earlier to see whether the predicted values match the actual values in the testing data. The first five predicted values from the testing data are shown below with the prediction intervals (with 95% confidence) and the actual value.

fit	= fitted values
lwr 	= lower boundary
upr 	= upper boundary
salary2.Salary = real value

![E1176FE6-E3F5-434C-ADE4-1E4CF5029DE1_4_5005_c](https://github.com/user-attachments/assets/949f07b9-738e-4632-87c1-9bbed00c4d35)

The actual values of the Salary do fall within the prediction interval range. Only 5% of predictions will fall out of the interval range. This means that the model is a good model and is not overfitted.

CONCLUSION

To conclude, the model lm4 has an adjusted R-squared value of 0.9289 which is very good as it means that the IV can explain a large proportion of the DV. The lm4 model also passes all of the linear model assumptions hence it can produce reliable and valid predictions. After checking the performance of the model using the testing data, the model is ready to be used for future predictions. 


