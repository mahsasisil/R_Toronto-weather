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

df=read_xlsx('Toronto_temp.xlsx')
str(df)
names(df)
ncol(df)
head(df)
nrow(df)
NCOL(df)
dim(df)

attach(Toronto.data)


library(plyr)
Toronto.data=rename(df ,c('Date/Time'='Toronto.Time',
                          'Year'='Toronto.Year',
                          'Month'='Toronto.Month',
                          'Day'='Toronto.Day',
                          "Mean Temp (C)" ='Toronto.Temp.Mean',
                          "Max Temp (C)" ='Toronto.Temp.Max',
                          "Min Temp (C)"='Toronto.Temp.Min',
                          "Total Rain (mm)"='Toronto.Rain',
                          "Total Snow (cm)"='Toronto.Snow',
                          "Total Precip (mm)"='Toronto.Precip',
                          'season'='Toronto.Season'
                          
))

write.csv(Toronto.data,file='annual1.csv',quote=T,row.names = T)
names(Toronto.data)
attach(Toronto.data)
str(Toronto.data)
head(Toronto.data)
ncol(Toronto.data)
head(Toronto.data)
nrow(Toronto.data)
NCOL(Toronto.data)
dim(Toronto.data)


str(Toronto.data)
table(Toronto.data$Toronto.Season,Toronto.data$Toronto.Year)


#------------handle the date-------







z=as.Date(Toronto.Time,'%m/%d/%Y');z


list=Toronto.data[order(as.Date(Toronto.Time, format='%m/%d/%Y')),]

range(Toronto.Time)

#------------summer data

tapply(Toronto.Rain,list(Toronto.Year),mean,na.rm=T)
snow=aggregate(Toronto.data['Toronto.Snow'],by=list(as.Date(Toronto.Time)),FUN = mean,na.rm=T)
plot(snow,type = "p",main = "average Snow 2013-2016", 
     sub = "", xlab = "Year", ylab = "Snow CM",
     col=6, pch=16, cex=3)







tapply(Toronto.Rain,list(Toronto.Year,Toronto.Season),mean,na.rm=T)
tapply(Toronto.Snow,list(Toronto.Year,Toronto.Season),mean,na.rm=T)
tapply(Toronto.Temp.Mean,list(Toronto.Year,Toronto.Season),mean,na.rm=T)
tapply(Toronto.Temp.Max,list(Toronto.Year,Toronto.Season),mean,na.rm=T)
tapply(Toronto.Temp.Min,list(Toronto.Year,Toronto.Season),mean,na.rm=T)

p=tapply(Toronto.Rain, list(Toronto.Year,Toronto.Season), function(x) c(min(x), median(x), max(x)))
dim(p)
p[1,1]

# rain based on months
aggregate(Toronto.Rain~Toronto.Month,data=Toronto.data,FUN = mean)
aggregate(Toronto.Rain~Toronto.Year+Toronto.Month,data=Toronto.data,FUN = mean)
aggregate(.~Toronto.Year+Toronto.Month,data=Toronto.data[c('Toronto.Rain','Toronto.Snow')],mean)

df=data.frame(rain=Toronto.Rain,snow=Toronto.Snow)
aggregate(df,by=list(Toronto.Season,Toronto.Month),na.rm=T,FUN = mean)



Summer2013$Toronto.Rain[!complete.cases(Summer2013$Toronto.Rain)]=0


Summer2013=subset(Toronto.data,subset=Toronto.Year==2013&Toronto.Season=='Summer');nrow(Summer2013)
summary(Summer2013[-c(2)])

Summer2014=subset(Toronto.data,subset=Toronto.Year==2014&Toronto.Season=='Summer');nrow(Summer2014)
summary(Summer2014[-c(2)])

Summer2015=subset(Toronto.data,subset=Toronto.Year==2015&Toronto.Season=='Summer');nrow(Summer2015)
summary(Summer2015[-c(2)])

Summer2016=subset(Toronto.data,subset=Toronto.Year==2016&Toronto.Season=='Summer');nrow(Summer2016)
summary(Summer2016[-c(2)])

Summer2017=subset(Toronto.data,subset=Toronto.Year==2017&Toronto.Season=='Summer');nrow(Summer2017)
summary(Summer2017[-c(2)])

Summer2018=subset(Toronto.data,subset=Toronto.Year==2018&Toronto.Season=='Summer');nrow(Summer2018)
summary(Summer2018[-c(2)])

#graph

rm(list = ls())     # clear objects
graphics.off() 


date=as.Date(Toronto.Time,'%m/%d/%Y');date
#jpeg("rplot.jpg", width = 350, height = 350)
plot(x = date, y = Toronto.Precip,
     pch = 16, frame = FALSE,
     xlab = "wt", ylab = "mpg", col = "#2E9FDF")
#dev.off()








