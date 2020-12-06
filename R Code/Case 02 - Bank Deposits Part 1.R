### RICE University
### Created: Prof. J.C. Bonilla; jb132@rice.edu
#### Ref: Case 2: Bank Deposits (Part 1)

#loading train and test files
gitlink1="https://raw.githubusercontent.com/jcbonilla/MBA-RICE/master/Data/banktrain.csv"
gitlink2="https://raw.githubusercontent.com/jcbonilla/MBA-RICE/master/Data/bankscoring_submission.csv"
banktrain=read.csv(gitlink1, header = TRUE, stringsAsFactors = TRUE)
bankscoring=read.csv(gitlink2, header = TRUE, stringsAsFactors = TRUE)

str(banktrain)  # this file has 40777 rows and 22 columns
str(bankscoring)  # this file has 411 rows and 22 columns

names(banktrain)  # let's display the names we can use in this model

logit.model= glm(y~age+
                   job+
                   marital+
                   education+
                   default+
                   housing+
                   loan+
                   contact+
                   month+
                   day_of_week+
                   duration+
                   campaign+
                   pdays+
                   previous+
                   poutcome+
                   emp.var.rate+
                   cons.price.idx+
                   cons.conf.idx+
                   cons.conf.idx+
                   euribor3m+
                   nr.employed ,data=banktrain, family = binomial)
#Explore model
summary(logit.model)   # notice how glm() automatically expands (dummyfies) all categorical variables

#Let's generate a data frame (table) of coeffients that you can use in Excel for predictions
model.coeff=coef(logit.model)
model.coeff.df=as.data.frame(model.coeff)
View(model.coeff)
getwd()
write.csv(model.coeff.df, "~/Downloads/ModelCoeff.csv")

##Exploring the nature of the balance of target variable.  
table(banktrain$y)  # provides a total count of 1/0 in the column 'y'
prop.table(table(banktrain$y)) # provides % count of 1/0 in the column 'y'
barplot(prop.table(table(banktrain$y)), col="blue")

## Predicting
scores.raw=predict.glm(logit.model,bankscoring, type='response')
scores.final=ifelse(scores.raw>0.5,1,0)
table(scores.final)
