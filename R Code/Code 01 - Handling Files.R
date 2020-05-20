### Data Analytics - MBA@RICE
### Author: JC Bonilla
### jb132@rice.edu
### 


# Loading file as .csv
getwd()   # check where you computer is using as default folder
setwd("/Users/jbonilla/Documents") # to change current folder to ~/Documents
data <-read.csv("Soups.csv")
str(data)

#Loading file as .xls
getwd()
library(readxl)
citibike <- read_excel("CitiBike Data.xlsx")
str(citibike)


# Writing file
setwd("/Users/jbonilla/Downloads")  #I want to write this file in my Downloads folder
write.csv("data","soupfile.csv") #write.csv("data object", "filename.csv")
