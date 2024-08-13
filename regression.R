setwd("/Users/macbookair/Desktop/STQS4444 Time Series and Forecasting")

salary_ori <- read.csv("SalaryMulti.csv")
head(salary_ori)
str(salary_ori)

##### check relationship of variables #######
pairs(salary_ori)


##### split data #####
set.seed(123)
train_size <- floor(0.7 * nrow(salary_ori))

train_indices <- sample(seq_len(nrow(salary_ori)), size = train_size, replace = FALSE)

salary <- salary_ori[train_indices, ]
salary2 <- salary_ori[-train_indices, ]

str(salary)
str(salary2)


###### create models and check adjusted r-squared value #####
lm1 <- lm(Salary ~ Total.Experience + Team.Lead.Experience + Project.Manager.Experience + Certifications, data = salary)
summary(lm1)
# 0.9303

lm2 <- lm(Salary ~ Total.Experience + Certifications, salary)
summary(lm2)
# 0.8895

lm3 <- lm(Salary ~ Team.Lead.Experience + Project.Manager.Experience + Certifications, salary)
summary(lm3)
# 0.7982

lm4 <- lm(Salary ~ Team.Lead.Experience + Project.Manager.Experience + Total.Experience, salary)
summary(lm4)
# 0.9289

lm5 <- lm(Salary ~ Project.Manager.Experience + Total.Experience + Certifications, salary)
summary(lm5)
# 0.8918

lm6 <- lm(Salary ~ Team.Lead.Experience + Total.Experience + Certifications, salary)
summary(lm6)
# 0.9242

lm7 <- lm(Salary ~ Team.Lead.Experience + Project.Manager.Experience, salary)
summary(lm7)
# 0.7976

lm8 <- lm(Salary ~ Team.Lead.Experience + Certifications, salary)
summary(lm8)
# 0.559

lm9 <- lm(Salary ~ Team.Lead.Experience + Total.Experience, salary)
summary(lm9)
# 0.9227

lm10 <- lm(Salary ~ Project.Manager.Experience + Certifications, salary)
summary(lm10)
# 0.1783
# model shows multicollinearity

lm11 <- lm(Salary ~ Project.Manager.Experience + Total.Experience, salary)
summary(lm11)
# 0.8906

lm12 <- lm(Salary ~ Certifications + Total.Experience, salary)
summary(lm12)
# 0.8895

lm13 <- lm(Salary ~ Total.Experience, salary)
summary(lm13)
# 0.8883



###### choose best model #####

# the best model is the model that has Total.Experience as the IV
# lm1 also has a good adjusted r-squared value but it is redundant as the information provided by
# the Team.Lead.Experience, Project.Manager.Experience, and Certifications
# is already included in the total experience
lm4 <- lm(Salary ~ Team.Lead.Experience + Project.Manager.Experience + Total.Experience, salary)
summary(lm4)
# 0.9289


##### test model ####
testing <- predict.lm(lm4, newdata = salary2, interval = "predict")
pred_real <- data.frame(testing, salary2$Salary) 
pred_real[1:5,]

# carry out diagnostic test
# refer business analytics
#plot(salary_ori$Team.Lead.Experience, salary_ori$Salary, xlab = "Salary", ylab = "Team Lead Experience", main = "Salary by Team Lead Experience"); abline(lm4)
#plot(salary_ori$Project.Manager.Experience, salary_ori$Salary, xlab = "Salary", ylab = "Project Manager Experience", main = "Salary by Project Manager Experience"); abline(lm4)
#plot(salary_ori$Total.Experience, salary_ori$Salary, xlab = "Salary", ylab = "Total Experience", main = "Salary by Total Experience"); abline(lm4)

plot(lm4)
hist(lm4$residuals)
plot(lm4$fitted.values, lm4$residuals); abline(h = 0)
max(salary_ori$Total.Experience)

# independence, the other variables, Team.Lead.Experience, Project.Manager.Experience, and Certifications
# impact the Total.Experience value
# this makes it best to choose either or and not include all of the variables in the model
# as this will go against the independence assumption of a linear regression model

# explain about transforming data and how this data does not need to be transformed
# as it already agrees with all of the assumptions and passes the diagnostic test


# explain multicollinearity
lm10 <- lm(Salary ~ Project.Manager.Experience + Certifications, salary)
summary(lm10)
# 0.1783
# model shows multicollinearity




