

#import data

#Method 1
#Select the file manually

stats <- read.csv(file.choose())
stats

#Method 2
#Set WD and Read Data
getwd()
setwd("E:\\Programs\\R\\Udemy R programming A to Z\\Assignment DataSet\\Section 5 dataframes")
getwd()
rm(stats)
stats <- read.csv("DemographicData.csv")
stats




#--------------Exploration----------
nrow(stats)
ncol(stats)
head(stats)
head(stats , n=10)
tail(stats)
tail(stats, n=5)
str(stats)         #str  runif
summary(stats)


#Using the $ sign---------

stats
head(stats)
stats[3,3]
stats[3,"Birth.rate"]
stats$Internet.users
stats$Internet.users[2]
stats[,"Internet.users"]
levels(stats$Income.Group)


#--------Basic Operations of Data Frames------------

#subsetting
stats[1:10,]
stats[c(4,100),]

#Remember how the [] works:
stats[1,]
is.data.frame(stats[1,])
stats[,1]
is.data.frame(stats[,1])
stats[,1,drop=F]
is.data.frame(stats[,1,drop=F])

#multiply columns

head(stats)
stats$Birth.rate * stats$Internet.users

#Add Column
stats$Mycalc <- stats$Birth.rate * stats$Internet.users
head(stats)


stats$xyz <- 1:5
head(stats ,n=10)
#New column data has to be a multiple of total number of rows present.Here total number of rows are 195


#Remove a column
head(stats)
stats$Mycalc <- NULL
stats$xyz <- NULL




#---------Filter---------

head(stats)
filter <- stats$Birth.rate <20
filter
stats[filter, ]
stats


stats[stats$Birth.rate >40 & stats$Internet.users <2,]
stats[stats$Income.Group =="High income",]
levels(stats$Income.Group)
stats[stats$Country.Name =="Malta",]


#-----ggplot2----
install.packages("ggplot2")
library(ggplot2)
?qplot
qplot(data=stats,x=Internet.users)
qplot(data=stats,x=Income.Group,y=Birth.rate)
qplot(data=stats,x=Income.Group,y=Birth.rate,size=I(3))
qplot(data=stats,x=Income.Group,y=Birth.rate,size=I(3),colour=I("blue"))
qplot(data=stats,x=Income.Group,y=Birth.rate,geom="boxplot")

#1st task

qplot(data=stats,x=Internet.users,y=Birth.rate,colour=Income.Group)

#-----Creating DataFrames

mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("Country","Codes","Region")
head(mydf)
rm(mydf)

mydf <- data.frame(Countries=Countries_2012_Dataset,Codes=Codes_2012_Dataset,Regions=Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)


#---------------Merging DataFrames--------
stats
mydf

merged <- merge(stats,mydf,by.x="Country.Code",by.y="Codes")
head(merged)
# Remove duplicates
merged$Countries <- NULL
head(merged)
tail(merged)
str(merged)
summary(merged)

#task 2
#Visualising with new Split

qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Regions)

#sHAPES
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Regions,shape=I(13))

#Transparency
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Regions,alpha=I(.6))

#Title
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Regions,alpha=I(.6),main="Birth Rate vs Internet User")
