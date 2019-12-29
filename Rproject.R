#install.packages("usethis")
#library(usethis)

#use_git_config(
#  scope = "project",
#  user.name = "mahsa",
#  user.email = "mahsa.movahedi@gmail.com"
#)



library(readxl)
setwd('C:/Users/razer/Desktop/R_project/Code')
getwd()

df=read.csv('Toronto_temp.csv')
str(df)
names(df)=c()
ncol(df)
head(df)
nrow(df)
NCOL(df)
dim(df)
sum(df$Total.Rain..mm.,na.rm=TRUE)


sb1=subset(df,
           subset=mark>79&age<21,
           select=c('student','mark','age'));sb1

library(plyr)
rename(df ,c('Date.Time'='Date',
             'Mean.Temp..C.'='Temp',
             'Max.Temp..C.'='Max_Temp',
             'Min.Temp..C.'='Min_Temp',
             'Total.Rain..mm.'='Rain',
             'Total.Snow..cm.'='Snow',
             'Total.Precip..mm.'='Precip'
             ))




