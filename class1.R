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
d = read.delim("annual.txt", header=TRUE, sep="\t")




x = read.fwf(file=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"),
                 skip=4,  widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))

head(x)



cat("Data scientists combine statistics, mathematics, programming, problem-solving, capturing data in ingenious ways, the ability to
look at things differently to find patterns, along with the activities of cleansing, preparing, and aligning the data.",file = "test.txt",sep = "\n")
y=readLines("test.txt");y
y[2]#get me the second paragraph




library(readxl)
getwd()
setwd('C:\\Users\\razer\\Desktop\\R_project')


class(read_xlsx('FraudDetection.xlsx'))



#-------------------day 5 missing data
y=c(1,2,3,NA)
is.na(y)
# 
class(mtcars) # dataframe
class(is.na(mtcars))# matrix

y[y==3]=NA;y# it is not working , == is not woks for na , we have to use is.na

y[is.na(y)]=100;y

complete.cases()


y=c(1,2,3,NA)
mean(y)# we should remove missing value for calculation
mean(y,na.rm =T)
complete.cases(y)

y[complete.cases(y)]

dim(mtcars)
mtcars[complete.cases(mtcars),]
mtcars[!complete.cases(mtcars),]
dim(mtcars[complete.cases(mtcars),])

y=c(1,2,3,NA)
x=c(1,2,3,4)
out=data.frame(x,y)

out[complete.cases(out),]
na.omit(out)


w=c(1,2,NA)
sort(w)
sort(w,decreasing =T )
sort(w,na.last =T )
sort(w,na.last=F)


y=c(1,2,3,NA)
x=c(NA,2,3,4)
out=data.frame(x,y)
out[order(out$y),]

mtcars[order(mtcars$cyl,-mtcars$mpg),]

out$newcol=c(1,2,3,4)

x='name'
paste('myname',x,'is mahsa')


#merge string
paste('the life of',pi)
paste('i','love','R')
paste('i','love','R',sep='_')
paste('X',c(1,2,3),sep='.')
paste(1:3,c('!','?','+'),sep="",collapse = '')
paste(1:3,c('!','?','+'),sep="")

paste("the value is 'e' ",exp(1),NA)

paste0('aaa','bbbb')#paste with no space


y=c(1,2,3,NA)
x=c('1','2','3','4')
cbind(x,y)
class(cbind(x,y))
rbind(x,y)# adding new record

cbind(2,c(1,2))
cbind(c(1,2),c(1,2,3))#error 
cbind(c(1,2),c(1,2,3,4))#no error , repeat the first vector

x=matrix(1:6,2)
dim(x)=c(3,2)
x

dim(x)=c(1,6);x

mat1=matrix(1:6,2);mat1
mat2=matrix(7:12,3);mat2
cbind(mat1,mat2)#error


library('plyr')
rbind.fill()

install.packages('rowr')
library('rowr')
cbind.fill()

df1=data.frame(1:5,3:7);df1
df2=data.frame(12,15);df2
cbind.fill(df1,df2)#repeat
cbind.fill(df1,df2,fill = NA)#no repeat, i will fill with NA



library(rowr)
df=data.frame(a=c(1,2,3),b=c(1,2,3))
cbind.fill(c(1,2,3),list(1,2,3),cbind(c('a','b')),'a',df)
cbind.fill(a=c(1,2,3),list(1,2,3),cbind(c('a','b')),'a',df,fill=NA)

mydata1 = data.frame(index=c("A","B","C"), var1=5:7)
mydata2 = data.frame(var1=8:10, species=c("one","two","three"))
# smartbind the dataframes together
library(plyr)
rbind.fill(mydata1, mydata2)


empid=c(001,002,003)
name=c('john','marry','ali')
age=c(37,39,40)
employees=data.frame(empid,name,age);employees

empid=c(002,003,007)
department=c('marketing','sales','eng')
tenure=c(3,7,5)
manager=data.frame(empid,department,tenure);manager

r=merge(x=employees,y=manager,by='empid');r
r=merge(x=employees,y=manager,by='empid',all.x = T);r
r=merge(x=employees,y=manager,by='empid',all.y = T);r
r=merge(x=employees,y=manager,by='empid',all = T);r





empid=c(001,002,003)
name=c('john','marry','ali')
age=c(37,39,40)
employees=data.frame(empid,name,age);employees

managerid=c(002,003,007)
name=c('john','marry','mahsa')
department=c('marketing','sales','eng')
tenure=c(3,7,5)
manager=data.frame(managerid,department,tenure,name);manager

r=merge(x=employees,y=manager,by.x ='empid',by.y = 'managerid');r

#page11


data.frame(studentid=c(1,2,3,4,5),
            class=c(1,1,1,1,1),
            name=c('a','b','c','d','c')
            )


#

A=data.frame(a=letters[1:10],x=1:10)
class(A)
sapply(A,class)
typeof(A)
names(A)
dim(A)
head(A)
tail(A,1)
head(A,1)
dim(A)

A.sample=A[sample(nrow(A),4),];A.sample
str(A)


sample(4)
sample(20,4)
a=rnorm(50)#standard normal sample form -50 to 50
summary(a)
sample(0:20,5)





##day 6 page 17
set.seed(400)
set.seed(400);A=data.frame(a=c(1:10),b=rnorm(10));A
set.seed(400);A=data.frame(a=c(1:10),b=rnorm(10));A
A=data.frame(a=c(1:10),b=rnorm(10));A



#table page18

file = "http://www.sr.bham.ac.uk/~ajrs/papers/sanderson09/sanderson09_table2.txt"
a = read.table(file, header=TRUE, sep="|")
a
attach(a)
head(a)
table(a$cctype) #cross table function, count of categorical 
table(a$cctype,a$det)

xtabs(~cctype+det,data = a)
addmargins(xtabs(~cctype+det,data = a))
addmargins(xtabs(~cctype+det,data = a),FUN = mean)
prop.table(xtabs(~cctype+det,data = a))


# give mean(kt) groupby(cctype)
aggregate(kT~cctype,data=a,FUN = mean)

# give mean(kt) groupby(cctype,det)
aggregate(kT~cctype+det,data=a,FUN = mean)

#give mean(all) groupby(cctype+det)
aggregate(.~cctype+det,data=a[c('z','kT')],mean)


# page 21-----------------------------------group by for mydata 
  age=c(23,34,45)
  gender=c('M','M','F')
  smoker=c('Y','N','Y')
  tenure=c(12,8,6)
  mydata=data.frame(age,gender,smoker,tenure)

#give mean(age) groupby(gender)
aggregate(mydata['age'],by=list(gender),FUN = mean,na.rm=T)


#give mean(age) groupby(gender,smoker)
aggregate(mydata['age'],by=list(gender,smoker),FUN = mean,na.rm=T)


l=list(age=mydata$age,tenure=mydata$tenure)
aggregate(l,by=list(gender,smoker),na.rm=T,FUN = mean)


v1=seq(1:8)
v2=3:10
v3=c(3,5,6,8,7,3,9,11)
union(v1,v2)
intersect(v1,v2)
setdiff(v2,v1)
setdiff(v1,v2)
is.element(4:5,v2)
# ---------------------------------string manupulation and time formating
paste('time',date(),sep = ':')
substr('123456',3,5)
substr(c('12345','6789'),2,4)

toupper('mahsa')
tolower('Mahsa')


strsplit('123_456_789','_')
match(5,c(1,3,5,7))
match(c(1,5),c(1,3,5,7))

grep('(389)',c('(389)12324','(123)132434','(234)34353'))#search for pattern, return index



namelist=c('mahsa movahedi','hassan adib', 'ali rezayee')
z=strsplit(namelist,split=' ');z

one=z[[1]];one
two=z[[2]];two
three=z[[3]];three
data.frame(first=c(one[1],two[1],three[1]),second=c(one[2],two[2],three[2]))


#time series analysis

z=as.Date('Feb/11/2001','%B/%d/%Y');z # page 29
format(z,format='%B-%d-%y')

now=date();today; 
format(now,format='%B-%d-%y')

#----------------------------------------------------------------------------day 7
factorial=function(n){
  
  if (n==0) {return (n+1)}
  else {return (n*factorial(n-1))}
  
  
} 

factorial(3)

x=matrix(rnorm(30),nrow=5,ncol=6)
apply(x,1,sum)#sum for row
apply(x,2,sum)# sum for col
apply(x,1:2,sum)# nothing will be happen s you add each value with nothings


apply(x,1:2,function(y)y/2)# devide each value of matrix by 2

head(Titanic)
Titanic
str(Titanic)
class(Titanic)
apply(Titanic,1,sum)#based on class
apply(Titanic,3:4,sum)#based on age and survived

#If you are trying to decide which of these three functions to use, because it is the simplest, 
#I would suggest to use sapply if possible. If you do not want your results to be simplified to a vector, 
#lapply should be used. If you want to specify the type of result you are expecting, use vapply




l=list(a=1:10,b=11:20)
lapply(l,mean)


student=c('john','marry','larry','lucy')
age=c(19,21,18,22)
gender=c('m','f','m','f')
mark=c(88,92,78,80)
mydata=data.frame(student,age,gender,mark)
mydata
result=lapply(mydata[c('age','mark')],mean,na.rm=T);result



a=matrix(1:9,3,3)
b=matrix(4:15,4,3)
c=matrix(8:10,3,2)
mylist=list(a,b,c)
lapply(mylist,function(mylist)mylist/2)
lapply(mylist,mean)
 
student=c('john','marry','larry','lucy')
age=c(19,21,18,22)
gender=c('m','f','m','f')
mark=c(88,92,78,80)
mydata=data.frame(student,age,gender,mark)
mydata
result=lapply(mydata[c('age','mark')],mean,na.rm=T);result

newlist=mydata[c('age','mark')];newlist
a=sapply(newlist,simplify = T, sum) #return vector
class(a)#return numeric

sapply(newlist,mean)

a=sapply(newlist,simplify = F, function(mylist)mylist/2) #return list
class(a)#return list


v=mydata[c('age','mark')];v
sapply(v,function(x) x/mean(x))

random=c('this','is','random','vector')
sapply(random,nchar)

mapply(sum, 1:4,1:4,1:4)
mapply(rep,1:4,1:4)

head(iris)
tapply(iris$Sepal.Length,iris$Species,mean) ## mean=sepal groupby=species


age=c(23,34,45)
gender=c('M','M','F')
smoker=c('Y','N','Y')
tenure=c(12,8,6)
d=data.frame(age,gender,smoker,tenure);d
d$tenure/d$age
tapply()
tapply(d$tenure/d$age,d$smoker,range)# give me max and min with groupby=smoker
tapply(d$age,list(d$smoker,d$gender),mean,na.rm=T)# give me max and min with groupby=smoker&gender

x=list(1,2,3,4)
rapply(x,function(x)x^2,class=c('numeric'))

x=list(3,list(4,5),6,list(7,list(8,9)))
rapply(x,function(x)x^2,class=c('numeric')) #solve the problem of nested data structure



x=list(1,2,3,4,'ff')
rapply(x,function(x)x^2,class=c('numeric'))# it ignore the char
rapply(x,nchar,class=c('character'))# it ignore the numeric

vapply(1:5,sqrt,2)

x=cbind(x1=3,x2=c(4:1,2:5))
x
x[3,]=NA
x[4,2]=NA
x
colMeans(x,na.rm=T)
rowSums(x,na.rm=T)
rowMeans(x,na.rm=T)

area = c('America' , 'Asia' , 'Europe' , 'America' , 'America')
city = c('Toronto' , 'Beijing' , 'Iondon' , 'Newyork' , 'Mexico')
spring=c(20,25,17,20,25)
summer=c(37,39,29,30,35)
fall=c(19,16,13,11,18)
winter=c(-12,0,1,-9,8)
temperature=data.frame(area, city, spring, summer, fall, winter)
temperature
v=stack(temperature);v
names(v)=c('temperature','season')
arealist=rep(area,4)
citylist=rep(city,4)
temp=cbind(arealist,citylist,v);temp
formula(temp)


h=unstack(temp,temperature~season);h
temp=cbind(area,city,h);temp

#melting and casting
install.packages('MASS')
library(MAss)
library(reshape2)
library(reshape)

d=head(ships,n=10);d

s=melt(d,id=c('type','year'));s
formula(s)
c=cast(s,type+year~variable,sum);c
cast(s,type + year ~ variable,sum)


# --------------------------------day8
df=data.frame(a=1:5,b=2:6)
with(df,{c=a+b});df
df$c=with(df,{c=a+b});df
within(df,{c=a+b});df
#----------------------------------groupby summary
sname=c('John','Marry','larry','Lucy','')
age=c(23,34,45,34,38)
gender=c('M','M','F','M','F')
smoker=c('Y','N','Y','M','Y')
tenure=c(12,8,6,20,10)
income=c(50000,70000,39000,NA,52000)
emp=data.frame(tenure,age,gender,smoker,sname);emp
z=by(emp[,1:2],emp[,3:4],summary);z# data=tenure&age(continues) groupby=gender&smoker(categorical)


avgvec=function(x){apply(x,2,mean)}
z1=by(emp[,1:2],emp[,3:4],avgvec);z1
class(z1)#BY
is.list(z1)#true


avglist=function(x){sapply(x,mean,simplify = T,na.rm=T)}
z2=by(emp[,1:2],emp[,3:4],avglist);z2
class(z2)
is.list(z2)#true
is.vector(z2[1])#true

library(doBy)
data(dietox)
str(dietox12)
#fun(Weight+Feed) groupby(Evit+Cu)
summaryBy(Weight+Feed~Evit+Cu, data=dietox,
          FUN=c(mean,var,length))

#fun(Weight+Feed) groupby(Evit+Cu)
summaryBy(list(c("Weight","Feed"), c("Evit","Cu")), data=dietox,
          FUN=c(mean,var,length))

summaryBy(Weight+Feed~Evit+Cu+Time, data=subset(dietox,Time>1),
          FUN=c(mean,var,length))




#----------------------sql------------------------
install.packages('sqldf')
library(sqldf)
sname=c('John','Marry','larry','Lucy','')
age=c(23,34,45,34,38)
gender=c('M','M','F','M','F')
smoker=c('Y','N','Y','M','Y')
tenure=c(12,8,6,20,10)
income=c(50000,70000,39000,NA,52000)
emp=data.frame(tenure,age,gender,smoker,sname);emp


#page 11
a1=sqldf('select sname, age tenure from emp where age>40');a1
a2=sqldf('select smocker,count(*) as number from emp group by smoker')
a3=sqldf('select sname as name ,tenure/age as ratio,gender from emp')



# generate random number
set.seed(52);
df2=data.frame(id=1:3,cov=round(runif(3)*10,1));df2
df1=data.frame(id=1:10,class=rep(c('case','ctrl'),5));df1



sqldf('select * from df1 join df2 on df1.id=df2.id')
sqldf("select * from df1 join df2 on df1.id=df2.id where class='case'")
sqldf('select df1.id, df2.cov as covariance  from df1 join df2 on df1.id=df2.id')


#-----------------------connect to sql server

#connect to database server
library(odbc)
library(DBI)
con=DBI::dbConnect(odbc::odbc(),
                   driver='SQL server',
                   server='MAHSA-LAPTOP-RA',
                   Database='sample4',
           trusted_connection='True')


dbListTables(con)# get the list of the tables in sapmple4
dbListTables(con,table_name='p%')# get the list of the tables in sapmple4
dbListFields(con,'price')# return the list of col names
data=dbReadTable(con,'tblDepartment')

dbWriteTable(con,'iris_sql',iris)# save iris in sql
dbGetQuery(con,'select * from price')

result=dbSendQuery(con,'select * from price')#load data for pagination
page1=dbFetch(result,n=10)#fetch the first page


#--------------instaling packages
install.packages('faraway',dep=TRUE)
install.packages('name', repos=c('repo1','repo2'),dep=TRUE)
remove.packages()
library(h='askpass')# give the full information about packages
data(packages='askpass')
install.packages("STAT")
installed.packages()
data(package='dplyr')
library(dplyr)
library()# give you the list of all available packages
search()


.libPaths()
getOption('defaultPackages')
w=require('dd')#return false if the bibrary can not load

#------------------------make a package

library(roxygen2)
library(MahsaR)   
trigo(0.5)  
  

# day 10---------------------------R Graphics

par()# defualt enviroment for any graph

setwd('C:\\Users\\razer\\Desktop\\R_Graph');getwd()


dd=mtcars
getwd()

# Open a pdf file
my_data=mtcars
pdf("rplot.pdf")
plot(x = my_data$wt, y = my_data$mpg,
     pch = 16, frame = TRUE,
     xlab = "wt", ylab = "mpg", col = "#2E9FDF")
dev.off()



jpeg("rplot.jpg", width = 350, height = 350)
plot(x = my_data$wt, y = my_data$mpg,
     pch = 16, frame = FALSE,
     xlab = "wt", ylab = "mpg", col = "#2E9FDF")
dev.off()
#------------------------
rm(list = ls())     # clear objects
graphics.off()      # close graphics windows


hist(mtcars$mpg,br=2, col.lab="blue")




par()              # view current settings
opar = par()      # make a copy of current settings
par(col.lab="red") # red x and y labels
hist(mtcars$mpg)   # create a plot with these new settings
par(opar)          # restore original settings
#--------------------------------------------------------------

par(mar=c(5,5,1,1))# define the margin below_left-top-right
plot(1:10,1:10,type="n")# type n means empty box 
windowsFonts(
  A=windowsFont("Arial Black"),
  B=windowsFont("Bookman Old Style"),
  C=windowsFont("Comic Sans MS"),
  D=windowsFont("Symbol")
)
text(3,3,"Hello World Default")
text(4,4,family="A","Hello World from Arial Black")
text(5,5,family="B","Hello World from Bookman Old Style")
text(6,6,family="C","Hello World from Comic Sans MS")
text(7,7,family="D", "Hello World from Symbol")
#--------------------------------------------------------------------



x=c(3,10,3,6,7,8,3,6,1,2,2,6,10,2,3,3,4,5,9,10)
y=c(1,1,2,2,7,2,2,8,3,9,3,3,3,10,4,4,7,5,5,5)


plot(x, y)
plot(x, y , type = "p",  xlim=c(0, 11), ylim=c(0, 11),
     main = "test1", sub = "test2", xlab = "Age", ylab = "level",
     col=10, pch=16, cex=3)


u=c(1:5)
plot(x, y , type = "p",  xlim=c(0, 11), ylim=c(0, 11),     main = "test1", sub = "test2", xlab = "Age", ylab = "level", col=u,
     pch=u, cex=u) # col=color , pch=shape , cex=size

#------------------------------------------
# EX4

# Generate some data
x=1:10; y1=x*x; y2=2*y1
plot(x, y1, type="b", pch=19, col="red", xlab="x", ylab="y")
# Add a line
lines(x, y2, pch=18, col="blue", type="b", lty=2)
# Add a legend
legend(1, 95, legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8)


#To avoid repeating the above R code, we can create a custom plot function as follow :

makePlot=function(){
  x=1:10; y1=x*x; y2=2*y1
  plot(x, y1, type="b", pch=19, col="red", xlab="x", ylab="y")
  lines(x, y2, pch=18, col="blue", type="b", lty=2)
}
#Title, text font and background color of the legend box

makePlot()
# Add a legend to the plot
legend(1, 95, legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8,
       title="Line types", text.font=4, bg='lightblue')

# Remove legend border using box.lty = 0
makePlot()
legend(1, 95, legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8,
       box.lty=0)
# Change the border
makePlot()
legend(1, 95, legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8,
       box.lty=2, box.lwd=2, box.col="green")


makePlot()
legend("topleft", legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8)
#R legend : tutorial on how add legends to plots using R software

#----------------------------
attach(mtcars)
boxplot(mpg~cyl,
        xlab="Cylinders", ylab="Miles/(US) gallon",
        col=topo.colors(3))

legend("bottomleft", inset=.02, title="Number of Cylinders",
       c("4","6","8"), fill=topo.colors(3), horiz=TRUE, cex=0.8)



#-----------------------------
# Generate data
x = 0:10;
y = 0:10;

# Plot the data

# - Specify the layout parameters before any plotting
#   If you don't specify them before any plotting, the
#   results will be inconsistent and misaligned.
#
# - oma stands for 'Outer Margin Area', or the total margin space that is outside
#   of the standard plotting region (see graph)
#
# - The vector is ordered, the first value corresponding to the bottom. The entire
#   array is c(bottom, left, top, right)
#
# - All of the alternatives are:
#   - oma: Specify width of margins in number of lines
#   - omi: Specify width of margins in inches
#   - omd: Specify width of margins in 'device coordinates'
#       - Device coordinates place (0,0) in the upper left and (1,1) in the
#         lower right corner

par(oma=c(3,3,3,3))  # all sides have 3 lines of space
#par(omi=c(1,1,1,1)) # alternative, uncomment this and comment the previous line to try

# - The mar command represents the figure margins. The vector is in the same ordering of
#   the oma commands.
#
# - The default size is c(5,4,4,2) + 0.1, (equivalent to c(5.1,4.1,4.1,2.1)).
#
# - The axes tick marks will go in the first line of the left and bottom with the axis
#   label going in the second line.
#
# - The title will fit in the third line on the top of the graph.
#
# - All of the alternatives are:
#   - mar: Specify the margins of the figure in number of lines
#   - mai: Specify the margins of the figure in number of inches

par(mar=c(5,4,4,2) + 0.1)
#par(mai=c(2,1.5,1.5,.5)) # alternative, uncomment this and comment the previous line

# Plot
plot(x, y, type="n", xlab="X", ylab="Y")    # type="n" hides the points

# Place text in the plot and color everything plot-related red
text(5,5, "Plot", col="red", cex=2)
text(5,4, "text(5,5, \"Plot\", col=\"red\", cex=2)", col="red", cex=1)
box("plot", col="red")

# Place text in the margins and label the margins, all in green
mtext("Margins", side=3, line=2, cex=2, col="green")
mtext("par(mar=c(5,4,4,2) + 0.1)", side=3, line=1, cex=1, col="green")
mtext("Line 0", side=3, line=0, adj=1.0, cex=1, col="green")
mtext("Line 1", side=3, line=1, adj=1.0, cex=1, col="green")
mtext("Line 2", side=3, line=2, adj=1.0, cex=1, col="green")
mtext("Line 3", side=3, line=3, adj=1.0, cex=1, col="green")
mtext("Line 0", side=2, line=0, adj=1.0, cex=1, col="green")
mtext("Line 1", side=2, line=1, adj=1.0, cex=1, col="green")
mtext("Line 2", side=2, line=2, adj=1.0, cex=1, col="green")
mtext("Line 3", side=2, line=3, adj=1.0, cex=1, col="green")
box("figure", col="green")

# Label the outer margin area and color it blue
# Note the 'outer=TRUE' command moves us from the figure margins to the outer
# margins.
mtext("Outer Margin Area", side=1, line=1, cex=2, col="blue", outer=TRUE)
mtext("par(oma=c(3,3,3,3))", side=1, line=2, cex=1, col="blue", outer=TRUE)
mtext("Line 0", side=1, line=0, adj=0.0, cex=1, col="blue", outer=TRUE)
mtext("Line 1", side=1, line=1, adj=0.0, cex=1, col="blue", outer=TRUE)
mtext("Line 2", side=1, line=2, adj=0.0, cex=1, col="blue", outer=TRUE)
box("outer", col="blue")

#----------------------------------------------


x = c(1.2,3.4,1.3,-2.1,5.6,2.3,3.2,2.4,2.1,1.8,1.7,2.2)
y = c(2.4,5.7,2.0,-3,13,5,6.2,4.8,4.2,3.5,3.7,5.2)
plot(x,y)

x = c(-2,-0.3,1.4,2.4,4.5)
y = c(5,-0.5,8,2,11)
par(mar = c(5, 1, 1, 1))
plot(x,y,type="b",col="blue",xlab="Advertise Change",
     ylab="Revenue Change", main="Financial Analysis")

#Add more data to the plot:
abline(v=0,col="red") #add a vertical line at y=0
points(c(1,4),c(9,2),pch=3,col="tan2") #add two points
x2 = c(-1.5,1,4)
y2 = c(3,2,8)
lines(x2,y2,col="darkolivegreen3")  #add aother group of data
legend(x=-2.2,y=11,c("advertise","sale"),cex=.8,
       col=c("blue","darkolivegreen3"),lty=c(1,1)) #add legend


# move the legend out of the main plot area, we need some more work.
x = c(-2,-0.3,1.4,2.4,4.5)
y = c(5,-0.5,8,2,11)
layout(matrix(c(1,2), nrow = 1), widths = c(0.6, 0.4))
par(mar = c(5, 4, 2, 1))
plot(x,y,type="b",col="blue",xlab="Advertise Change",
     ylab="Revenue Change", main="Financial Analysis")
abline(v=0,col="red") #add a vertical line at x=0
points(c(1,4),c(9,2),pch=3,col="tan2") #add two points
x2 = c(-1.5,1,4)
y2 = c(3,2,8)
lines(x2,y2,col="darkolivegreen3")
par(mar = c(5, 0, 2, 1))
plot(x,y,col="white",axes=FALSE,ann=FALSE)
legend(x=-2.2,y=11,c("advertise","sale"),cex=.8,
       col=c("blue","darkolivegreen3"),lty=c(1,1))

require(stats)
# for lowess, rpois, rnorm

plot(cars)

lines(lowess(cars))


plot(sin, -pi, 2*pi)
# Discrete Distribution Plot:

plot(table(rpois(100, 5)), type = "h", col = "red", lwd = 10,
     main = "rpois(100, lambda = 5)")


plot(x = sort(rnorm(47)), type = "s", main = "plot(x, type = \"s\")")

points(x, cex = .5, col = "dark red")

#------------------------------------------------------
Hist()
rannorm = rnorm(500)
hist(rannorm)

hist(rannorm,br=14,col="blue",xlab="Expression",ylab="Frequency",
     freq=TRUE,main="Histogram of Expression")

hist(rannorm,br=14,col="blue",xlab="Expression",ylab="Density",freq=FALSE,
     main="Histogram of Expression")
lines(density(rannorm),col="red")


op = par(mfrow = c(2, 2))
hist(islands)
(hist(islands, col = "gray", labels = TRUE))

hist(sqrt(islands), breaks = 12, col = "lightblue", border = "pink")
##-- For non-equidistant breaks, counts should NOT be graphed unscaled:
r = hist(sqrt(islands), breaks = c(4*0:5, 10*3:5, 70, 100, 140),
          col = "blue1")
text(r$mids, r$density, r$counts, adj = c(.5, -.5), col = "blue3")
sapply(r[2:3], sum)
sum(r$density * diff(r$breaks)) # == 1
lines(r, lty = 3, border = "purple") # -> lines.histogram(*)
par(op)

require(utils) # for str
str(hist(islands, breaks = 12, plot =  FALSE)) #-> 10 (~= 12) breaks
str(hist(islands, breaks = c(12,20,36,80,200,1000,17000), plot = FALSE))

hist(islands, breaks = c(12,20,36,80,200,1000,17000), freq = TRUE,
     main = "WRONG histogram") # and warning

require(stats)
set.seed(14)
x = rchisq(100, df = 4)

hist(x, freq = FALSE, ylim = c(0, 0.2))
curve(dchisq(x, df = 4), col = 2, lty = 2, lwd = 2, add = TRUE)
#----------------------------

# Kernel Density Plot
d = density(mtcars$mpg) # returns the density data
plot(d) # plots the results

# Filled Density Plot
d = density(mtcars$mpg)
plot(d, main="Kernel Density of Miles Per Gallon")
polygon(d, col="red", border="blue")
#--------------------------
curve()
# Plot a 5th order polynomial
curve(3*x^5-5*x^3+2*x, from=-1.25, to=1.25, lwd=2, col="blue")
# Plot the gamma density
curve(dgamma(x, shape=2, scale=1), from=0, to=7, lwd=2, col="red")
# Plot multiple curves, notice that the first curve determines the x-axis
curve(dnorm, from=-3, to=5, lwd=2, col="red")
curve(dnorm(x, mean=2), lwd=2, col="blue", add=TRUE)
# Add vertical lines at the means
lines(c(0, 0), c(0, dnorm(0)), lty=2, col="red")
lines(c(2, 2), c(0, dnorm(2, mean=2)), lty=2, col="blue")
plot(qnorm) # default range c(0, 1) is appropriate here,
# but end values are -/+Inf and so are omitted.
plot(qlogis, main = "The Inverse Logit : qlogis()")
abline(h = 0, v = 0:2/2, lty = 3, col = "gray")
curve(sin, add = TRUE)
curve(sin, -2*pi, 2*pi, xname = "t")
curve(tan, xname = "t", add = NA,
      main = "curve(tan)  --> same x-scale as previous plot")

op = par(mfrow = c(2, 2))
curve(x^3 - 3*x, 0, 1)
curve(x^2 - 2, add = TRUE, col = "violet")

## simple and advanced versions, quite similar:
plot(cos, -pi,  3*pi)
curve(cos, xlim = c(-pi, 3*pi), n = 1001, col = "blue", add = TRUE)

chippy = function(x) sin(cos(x)*exp(-x/2))
curve(chippy, -8, 7, n = 2001)
plot (chippy, -8, -5)

for(ll in c("", "x", "y", "xy"))
  curve(log(1+x), 1, 100, log = ll, sub = paste0("log = '", ll, "'"))
par(op)
#-----------------------------------------------------------------------------------

# Simple Pie Chart
slices = c(10, 12,4, 16, 8)
lbls = c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")

# Pie Chart with Percentages
slices = c(10, 12, 4, 16, 8)
lbls = c("US", "UK", "Australia", "Germany", "France")
pct = round(slices/sum(slices)*100)
lbls = paste(lbls, pct) # add percents to labels
lbls = paste(lbls,"%",sep="") # ad % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries")


# 3D Exploded Pie Chart
par(mar=c(1,1,1,1))

library(plotrix)
slices = c(10, 12, 4, 16, 8)
lbls = c("US", "UK", "Australia", "Germany", "France")
pie3D(slices,labels=lbls,explode=0.1,
      main="Pie Chart of Countries ")
#-------------------------------------------------------
# Simple Bar Plot
counts = table(mtcars$gear)
barplot(counts, main="Car Distribution",
        xlab="Number of Gears")

# Simple Horizontal Bar Plot with Added Labels
counts = table(mtcars$gear)
barplot(counts, main="Car Distribution", horiz=TRUE,
        names.arg=c("3 Gears", "4 Gears", "5 Gears"))


# Stacked Bar Plot with Colors and Legend
counts = table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts))

# Grouped Bar Plot
counts = table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)
#-----------------------------------
# Boxplot of MPG by Car Cylinders
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data",
        xlab="Number of Cylinders", ylab="Miles Per Gallon")


# Notched Boxplot of Tooth Growth Against 2 Crossed Factors
# boxes colored for ease of interpretation
boxplot(len~supp*dose, data=ToothGrowth, notch=TRUE,
        col=(c("gold","darkgreen")),
        main="Tooth Growth", xlab="Suppliment and Dose")



# Violin Plots
library(vioplot)
x1 = mtcars$mpg[mtcars$cyl==4]
x2 = mtcars$mpg[mtcars$cyl==6]
x3 = mtcars$mpg[mtcars$cyl==8]
vioplot(x1, x2, x3, names=c("4 cyl", "6 cyl", "8 cyl"), col="gold")
title("Violin Plots of Miles Per Gallon")


# Example of a Bagplot
library(aplpack)
attach(mtcars)
bagplot(wt,mpg, xlab="Car Weight", ylab="Miles Per Gallon",
        main="Bagplot Example")
#---------------------------------------------

x = c(1.2,3.4,1.3,-2.1,5.6,2.3,3.2,2.4,2.1,1.8,1.7,2.2)
y = c(2.4,5.7,2.0,-3,13,5,6.2,4.8,4.2,3.5,3.7,5.2)
plot(x,y,cex=.8,pch=1,xlab="x",ylab="y",col="black")

#Add some points to the plot:
x2 = c(4.1,1.1,-2.3,-0.2,-1.2,2.3)
y2 = c(2.3,4.2,1.2,2.1,-2,4.3)
points(x2,y2,cex=.8,pch=3,col="blue")

# points of filled diamond shape, large size, and red color
x3 = c(0,4)
y3 = c(10,-0.5)
points(x3,y3,cex=4,pch=18,col="red")
#-------------------------------------------------
#First let's make a plot:
x = c(1.2,3.4,1.3,-2.1,5.6,2.3,3.2,2.4,2.1,1.8,1.7,2.2)
y = c(2.4,5.7,2.0,-3,13,5,6.2,4.8,4.2,3.5,3.7,5.2)
plot(x,y,cex=.8,pch=1,xlab="x",ylab="y",col="black")
x2 = c(4.1,1.1,-2.3,-0.2,-1.2,2.3)
y2 = c(2.3,4.2,1.2,2.1,-2,4.3)
points(x2,y2,cex=.8,pch=3,col="blue")

#add a red horizontal line at y=4 to the plot:
abline(h=4,col="red")

# add a green vertical line at x=0 to the plot:
abline(v=0,col="green")

#add a blue line with intercept 2 and slope 2 to the plot:
abline(a=2,b=2,col="blue")
-------------------------------------------------
  # Example of labeling points
  attach(mtcars)
plot(wt, mpg, main="Milage vs. Car Weight", xlab="Weight", ylab="Mileage", pch=18, col="blue")
text(wt, mpg, row.names(mtcars), cex=0.6, pos=4, col="red")


# specify the data
x = c(1:10); y = x; z = 10/x

# create extra margin room on the right for an axis
par(mar=c(5, 4, 4, 8) + 0.1)

# plot x vs. y
plot(x, y,type="b", pch=21, col="red",
     yaxt="n", lty=3, xlab="", ylab="")

# add x vs. 1/x
lines(x, z, type="b", pch=22, col="blue", lty=2)

# draw an axis on the left
axis(2, at=x,labels=x, col.axis="red", las=0)

# draw an axis on the right, with smaller text and ticks
axis(4, at=z,labels=round(z,digits=2),
     col.axis="blue", las=2, cex.axis=0.7, tck=-.05)

# add a title for the right axis
mtext("y=1/x", side=4, line=3, cex.lab=1,las=2, col="blue")

# add a main title and bottom and left axis labels
title("An Example of Creative Axes", xlab="X values",
      ylab="Y=X")
#---------------------------------------------------------------------------------

# 4 figures arranged in 2 rows and 2 columns
attach(mtcars)
par(mfrow=c(2,2))
plot(wt,mpg, main="Scatterplot of wt vs. mpg")
plot(wt,disp, main="Scatterplot of wt vs disp")
hist(wt, main="Histogram of wt")
boxplot(wt, main="Boxplot of wt")

# 3 figures arranged in 3 rows and 1 column
attach(mtcars)
par(mfrow=c(3,1))
hist(wt)
hist(mpg)
hist(disp)

# One figure in row 1 and two figures in row 2
attach(mtcars)
layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
hist(wt)
hist(mpg)
hist(disp)

par("mar")
par(mar=c(3,3,3,3))
# One figure in row 1 and two figures in row 2
# row 1 is 1/3 the height of row 2
# column 2 is 1/4 the width of the column 1
attach(mtcars)
layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE),
       widths=c(3,1), heights=c(1,2))
hist(wt)
hist(mpg)
hist(disp)
#-----------------------------------------------------------------
pairs(iris[,1:4], pch = 19)


#Show only upper panel:
pairs(iris[,1:4], pch = 19, lower.panel = NULL)

#Color points by groups (species)
my_cols = c("#00AFBB", "#E7B800", "#FC4E07")
pairs(iris[,1:4], pch = 19,  cex = 0.5,
      col = my_cols[iris$Species],
      lower.panel=NULL)



# Correlation panel
panel.cor = function(x, y){
  usr = par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r = round(cor(x, y), digits=2)
  txt = paste0("R = ", r)
  cex.cor = 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * r)
}

# Customize upper panel
upper.panel=function(x, y){
  points(x,y, pch = 19, col = my_cols[iris$Species])
}
# Create the plots
pairs(iris[,1:4], lower.panel = panel.cor, upper.panel = upper.panel)


#Add correlations on the scatter plots:
# Customize upper panel
upper.panel=function(x, y){
  points(x,y, pch=19, col=c("red", "green3", "blue")[iris$Species])
  r = round(cor(x, y), digits=2)
  txt = paste0("R = ", r)
  usr = par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  text(0.5, 0.9, txt)
}
pairs(iris[,1:4], lower.panel = NULL,
      upper.panel = upper.panel)
#--------------------------------------------------








