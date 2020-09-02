### RICE University
### Created: Prof. J.C. Bonilla; jb132@rice.edu
#### Ref: Case 2: Bank Deposits (Part 1)

#loading train and test files
gitlink1="https://raw.githubusercontent.com/jcbonilla/MBA-RICE/master/Data/banktrain.csv"
gitlink2="https://raw.githubusercontent.com/jcbonilla/MBA-RICE/master/Data/banktest.csv"
banktrain=read.csv(gitlink1, header = TRUE, stringsAsFactors = TRUE)
banktest=read.csv(gitlink2, header = TRUE, stringsAsFactors = TRUE)

str(banktrain)  # this file has 40777 rows and 22 columns
str(banktest)  # this file has 411 rows and 22 columns

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
write.csv(model.coeff.df, "~/Downloads/ModelCoeff.csv")
