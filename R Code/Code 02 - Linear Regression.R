### Data Analytics - MBA@RICE
### Author: JC Bonilla
### jb132@rice.edu
### 


# Loading file as .csv
getwd()   # check where you computer is using as default folder
setwd("/Users/jbonilla/Documents") # to change current folder to ~/Documents
link<-"https://raw.githubusercontent.com/jcbonilla/MBA-RICE/master/Data/Soups.csv"
data.file <-read.csv("Soups.csv")
data<-read.csv(link,header=TRUE)
str(data)

#Let's do a prediction of progresso soup price as function of month, region, and income
names(data)
progresso.model<-lm(Price.Progresso~Month+Region+Low_Income+High_Income, data=data)
summary(progresso.model)  #to invoke a summary of the model
plot(progresso.model)  #visual inspection of error term in the model

#Now, let us introduce dummy variables.  We will need a package called `mlr`
library(mlr3)   #Go to "Install" or run install.packages("mlr") if Error in library(mlr) 

#use createDummyFeatures to generate dummies for Factors or categorical variables
data.dummy<-createDummyFeatures(data, cols = "Region")
str(data.dummy) #notice how Region has been replaced by 4 dummy variables

#Let update fields a factor so we can convert into dummy variables
data$Month<-as.factor(data$Month)
data$Low_Income<-as.factor(data$Low_Income)
data$High_Income<-as.factor(data$High_Income)
str(data)

data.dummy<-createDummyFeatures(data, cols = c("Region","Month", "Low_Income","High_Income"))  # fucntion c() to include multiple variables
str(data.dummy)  # now data is expanded to 24 variables


# Let's update progresso.model with data.dummy.  
names(data.dummy)
progresso.model.2<-lm(Price.Progresso~Month.2+
                        Month.3+
                        Month.4+
                        Month.5+
                        Month.6+
                        Month.7+
                        Month.8+
                        Month.9+
                        Month.10+
                        Month.11+
                        Month.12+
                        Region.MidWest+
                        Region.South+
                        Region.West+Low_Income.1+
                        High_Income.1,data=data.dummy)  #ommitting "Month.1", `Region.East`, `Income=0`
summary(progresso.model.2)   #Observe improvements in R^2
