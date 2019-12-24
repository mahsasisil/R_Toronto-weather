#--------------chapter 1 vector------------------------
a=55
class(a)
is.integer(a)
is.double(a)
is.integer(as.integer(a))

as.numeric('mahsa')
as.logical(0)


x=5
y=as.integer(5)
x==y
class(x)==class(y)
is.integer(x)
mod=444%%2;mod
c(1,2,TRUE)
c("hi",TRUE)
c()
x=-2:2;x
seq(1,2,by=0.2)
seq(1,2,length.out =5)
rep(1,10)
rep(c(1,2),5)
rep(1:10,each=2)
x=c(0,1,2,3,4,5,6,7)
x[1]
x[c(1,2,3)]
x[c(-1)]
x[-c(-1,-2)]
x[c(2.3)]
x=c(4,3,5)
sort(x)
sort(x,decreasing = TRUE)
rev(x)
y=x[x>3&x<5];y
x[which.max(x)]
x[which.min(x)]
x[which(x>3)]
x[x>3]
x=c(1,2,3)
y=c(1,2,3)
match(x,y)
x[1]=5;x
x[1]=NA
is.na(x[1])
x=c(1,2,NULL);x

paste(12," hi mahsa")





#-------------------------------------chapter 2 array and matrix-----------------------------------
#-------------------------------matrix
matrix(c(1,2,3,4,5,6),nrow=3)
x=matrix(c(1,2,3,4,5,6),nrow=3,byrow=TRUE)
dimnames(x)=list(c("r1",'r2','r3'),c('c1','c2'));x
x['r1','c1']
class(x);
attributes(x)
dim(x)
x=matrix(1:9,nrow = 3,dimnames=list(c('r1','r2','r3'),c('c1','c2','c3')))
dim(x)
length(x)
is.vector(x[,2])
is.matrix(x[1:2,1:2])
colnames(x)
row.names(x)

a=matrix(1:9,nrow =3 );a
b=c(1,2,3);b
x=a+b;x

a=matrix(1:9,nrow =3 );a
b=matrix(rep(1,9),nrow =3 );b
#dot product
dot=a%*%b;dot



#-----------------------------------list
l=list(bob=c(1,2,3),john=c(4,5,6),s=7,d='mahsa')
l
class(l['bob'])
class(l[['bob']])

attach(l)
bob
detach(l)
bob


#-----------------------------------array
array(c(1,2,3,4,5,6),dim=c(2,3))
x=c(1,2,3)
y=c(4,5,6)
rbind(x,y)
cbind(x,y)
t=array(1:12,dim=c(2,3,2))
t
t[,,2]
t[2,,]

#----------------------------Factor
p=factor(c('a','a','a','a','b','b','b'));p
is.factor(factor(c(1,2)))
x=factor(c(0,1),levels = c(0,1));x
levels(x)
newlevel=c(0)
b=factor(x,newlevel)
levels(b)
levels(x)[-c(1)]

#-------------------------------------chapter 3 -----------------------------------



x=data.frame('SN'=1:2,
             'Age'=c(21,15),
             'Name'=c('John','Dora'))

str(x)
names(x)
ncol(x);lenght(x)
nrow(x)

#-------------------stringsAsFactors----------------------
x=data.frame('SN'=1:2,
             'Age'=c(21,15),
             'Name'=c('John','Dora'),
              stringsAsFactors = FALSE
             )

str(x)

#-----------------read.table -------------------------

employee=read.table(header = T , text='
           empid name age
           001   mahsa 38
           001 hamid NA
           ')

dim(employee)
names(employee)
sum(employee['age'],na.rm=TRUE)


#----------install packaging----------
install.packages('xlsx')
lib

#---------------add and remove col----------------
age=c(20,60,45)
name=c('mahsa','hamid','pegi')

df=data.frame(name,age)

df$gender=c('m','m','f');df#adding gender

df[c('odd','even')]=c(c(1,3,5),c(2,4,6));df#adding odd and even

df$age=NULL;df #remove the age col

df$age=df$age - 5 # less the age by 5

d=subset(df,select=-c(name,gender));d#removing name and gender

df[1:3]

df[,1]=NULL

#---------------get the names----------
row.names(df)
colnames(df)

#----------rename the col
v1=c(1,2,3,4,5)
v2=c(1,2,3,4,5)

d=data.frame(v1,v2);d

names(d)=c('age','height');d

names(d)[1]='ageB';d
#-------------------package RCpp package for rename

library(plyr)
rename(d,c('v1'='age','v2'='height'))

#---------------------------------------------------
head(iris)#getting the first 6 rows
tail(iris)#getting the last 6 rows
head(iris,10)

#----------query and subset----------------
student=c('john','marry','larry','lucy')
age=c(19,21,18,22)
gender=c('m','f','m','f')
mark=c(88,92,78,80)
mydata=data.frame(student,age,gender,mark)
mydata


sb1=subset(mydata,
           subset=mark>79&age<21,
           select=c('student','mark','age'));sb1


sb2=subset(mydata,
           subset=mark==88&age<21,
           select=-gender);sb2

c0=mydata[,1:2];c0

c1=mydata[,c('student','mark')];c1

# --------------cast data.fram to matrix------------
c3=as.matrix(c1)
names(c3)# it return just null for matrix
colnames(c3)

names(iris)
y=iris[,c("Sepal.Length","Sepal.Width","Petal.Length")]  
head(y)
#------------------
is.vector(mydata$student)#false

is.vector(as.vector(mydata$student))#true

class(mydata$student)

attach(mydata)
age
gender
detach(mydata)
#-------------------chapter4 if for while----------
ls()
rm(list=ls())
#-------------------------
x=3
if(x<2){
  
  print('hello world')
  
}else if (x>2){
  
  print('goodby world')
  
}
# ifelse with implecit loop for vector
a=c(5,7,2,9)
ifelse(a%%2==0,"even","odd")


x=c(2,5,3,9,8,11,6)
count=0
for(val in x){
  count=count+1
  
}
count

x=c(1:10)
for (i in x){
  print(i)
}

x=c(2,5,3,9,8,11,6)
count=0
for(i in x){
  if(i%%2==0) count=count+1
}
print(count)




x=c(2,5,3,9,8,11,6)
i=1
for(val in x){
  if(val%%2==0) {
    x[i]=val*2}
i=i+1
}
print(x)


i=1
while(i<6){
  print(i)
  i=i+1
}


x=1:5
for (val in x){
  if(val==3){
    #break
    next
  }
  print(val)
}

x=c(2,5,3,9,8,11,6);x
i=1
while(i<=length(x)){
  if (x[i]%%2==0) {x[i]=x[i]*2}
  i=i+1
  }
x


x=c(2,5,3,9,8,11,6);x
r=rep('odd',length(x));r
i=1
for (i in 1:length(x)){
  if(x[i]%%2==0) r[i]='even'
}


x=c(2,5,3,9,8,11,6);x
r=c()
i=1
for(val in x){
  if (x[i]%%2==0) r[i]='even' else r[i]='odd' 
  i=i+1
}  
x;r



x=c(2,5,3,9,8,11,6);x
r=c()
i=1
while(i<length(x)){
  if (x[i]%%2==0) r[i]='even' else r[i]='odd' 
  i=i+1
  }
x;r




x=1:10;x;
for (i in x){

  if (x[i]%%2==1) {next}
  print(x[i])

}


n=c('a','d','mahsa','d');n;check=FALSE
for (i in 1:length(n)){
  if (n[i]=='mahsa') 
  {
    print(paste('the index of name is',i)) 
    check=TRUE ;break()}
}
if (!check) print ('the name is not exist')




which(n=='mahsa')

x=1
repeat{
  print(x)
  x=x+1
  if(x==6){
    break
  }
}


# n operator %in%
x=c('what','is','truth')
if ('truth' %in% x){
  print('truth is found')
  
}

which(x=='what')

head(mtcars)
r=mtcars$cyl %in% 6
length(r[r==TRUE])

#-----------function
pow=function(x,y){
  result=x^y
  print(paste(x,"raised to the power ",y,'is',result ))
}

pow(2,3)
pow(y=3,x=2)
pow(x=2,3)


f=function(x){
  return (x^2+3)
}
f(3)


f=function(x){
  x^2+3
}
f(3)


fun.test=function(a,b,method='add'){
  res=0
  if(method=='add') res=a+b
  if(method=='subtract') res=a-b
  
  return(res)
}
fun.test(2,3,'subtract')
fun.test(2,3)


f1=function(x,y){
  return(x+y)
  print(x*y)# will not execute after return
}

z=f1(2,3)
z


a=1:10
sapply(a,sqrt)

#-------------------------error handling
inputs=list(1,2,4,-5,'oops',0,10)
for(input in inputs){
  print(paste('log of ',input,'=',log(input)))
}



for(input in inputs){
  try(
  print(paste('log of ',input,'=',log(input)))
  )
}



for(input in inputs){
  tryCatch(
    
    print(paste('log of ',input,'=',log(input))),
    
    warning=function(w){
      print(paste('warning for ',input))
    },
    
    error=function(w){
      print(paste('error for ',input))
    }
    
    
  )
}

a=readline('enter the number')

f=function(){
  
  repeat{
  num1=as.integer(readline('enter the 1th number'))
  num2=as.integer(readline('enter the 1th number'))
  if(num2==0){
    print('enter a valid number')
  }
  else{
    print(num1/num2)
    break
  }
  }
}
f()

#--------------------chapter 4
getwd()
setwd('C:\\Users\\mmovahed\\Desktop\\R_class')
getwd()

df=read.table('filename.csv',
           header = true,
           sep = ',',
           quote = '\"'
          )


month    = month.abb
avgHigh  = c(38, 41, 47, 56, 69, 81, 83, 82, 71, 55, 48, 43)
seasons  = c("Winter", "Spring", "Summer", "Fall")
season   = rep(seasons[c(1:4,1)], c(2,3,3,3,1))
schoolIn = rep(c("yes", "no", "yes"), c(5, 3, 4))
getwd()
d = data.frame(month, avgHigh, season, schoolIn)
write.table(d, "annual.txt", quote=FALSE,  sep="\t", row.names=FALSE)
rm(list=ls())
ls()
d <- read.delim("annual.txt", header=TRUE, sep="\t")




x = read.fwf(file=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"),
                 skip=4,  widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))

head(x)



cat("Data scientists combine statistics, mathematics, programming, problem-solving, capturing data in ingenious ways, the ability to
look at things differently to find patterns, along with the activities of cleansing, preparing, and aligning the data.",file = "test.txt",sep = "\n")
y<-readLines("test.txt");y
y[2]#get me the second paragraph




library(readxl)
getwd()
setwd('C:\\Users\\razer\\Desktop\\R_project')


class(read_xlsx('FraudDetection.xlsx'))


