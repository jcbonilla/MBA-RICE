### Data Analytics - MBA@RICE
### Author: JC Bonilla
### jb132@rice.edu
### 
### Logistic Regression
### 

#EXAMPLE 1: dataset without categorical variables
# Load file from Download folder
google<-read.csv("~/Downloads/google_adwords.csv", stringsAsFactors = TRUE)

#explore file
str(google)
# displaying column names
names(google)

# creating a model for SALES = Bo + B1*CLICKS + B2*IMPS + B3*Avg.POS
logit.model.GOOGLE<-glm(SALES~CLICKS+IMPS+Avg.POS, data=google, family = binomial)
# displaying model results
summary(logit.model.GOOGLE)   # Ans: SALES = -2.043 + 0.089*CLICKS - 0.00051IMPS - 0.142Avg.POS*X3

#EXAMPLE 2: dataset WITH categorical variables
# Load file from Download folder
birthdata<-read.csv("~/Downloads/birthweight.csv", stringsAsFactors = TRUE)

#explore file
str(birthdata)    #notice how RACE is not categorical
birthdata$RACE<-as.factor(birthdata$RACE)
str(birthdata)    # RACE is now categorical!

# displaying column names
names(birthdata)
# creating a model for LOW.  Notice how we do not have to create dummy variables with glm()
logit.model.LOW<-glm(LOW~AGE+LWT+RACE+SMOKE+HYPER+UI+VISITS,
                     data=birthdata,
                     family = binomial)


# displaying model results
summary(logit.model.LOW)

# to see only coefficients.  This could be useful to copy+paste onto Excel
logit.model.LOW$coefficients



