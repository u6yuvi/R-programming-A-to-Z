#Visualization through ggplot2
#Factor
getwd()
setwd("E://Programs//R//Udemy R programming A to Z//Assignment DataSet//Section 6 Advanced Visualization through ggplot")
getwd()
movies <- read.csv("Movie-Ratings.csv")
movies
head(movies)
colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Years")
movies
head(movies)
tail(movies)
summary(movies)
str(movies)
factor(movies$Years)
movies$Years <-factor(movies$Years)
summary(movies)
str(movies)


#-----Aesthetics---
library(ggplot2)

ggplot(data =movies,aes(x=CriticRating,y=AudienceRating))


#Add geometry

ggplot(data =movies,aes(x=CriticRating,y=AudienceRating))+
  geom_point()


#---Add color

ggplot(data =movies,aes(x=CriticRating,y=AudienceRating,
                        color=Genre))+
  geom_point()

#---Add size---

ggplot(data =movies,aes(x=CriticRating,y=AudienceRating,
                        color=Genre,size=Genre))+
  geom_point()
#----Chek the warning---



#Add size --better way

ggplot(data =movies,aes(x=CriticRating,y=AudienceRating,
                        color=Genre,size=BudgetMillions))+
  geom_point()

#This was #1 in plotting ggplot.FURTHER WE WILL ENRICH IT WITH DETAILS


#----Plotting with layers--
#Geometry

p<- ggplot(data =movies,aes(x=CriticRating,y=AudienceRating,
                            colour=Genre,size=BudgetMillions))
p
#point
p+geom_point()

#lines
p+geom_line()

#multiple layers

#Line over points
p+geom_point() +geom_line()

#Points over lines
p+geom_line()+geom_point()

#---------Overriding Aesthethics

q <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,
                            color=Genre,size=BudgetMillions))
q

#geometry
q+geom_point()


#Overriding aesthetics
#ex1
q+geom_point(aes(size=CriticRating))

#ex2
q+geom_point(aes(color=BudgetMillions))

#q remains same
q+geom_point()

#ex 3
q+geom_point(aes(x=BudgetMillions))
#Naming the xaxis
q+geom_point(aes(x=BudgetMillions))+ xlab("Budget Millions $$$")
#chart1

#ex4
#reduce line size
q+geom_line(size=1) +geom_point()   #Setting 


#Mapping vs Setting

r <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating))
r

r+geom_point()


#Add colour
#1.Mapping(which we have done so far)
r+geom_point(aes(color=Genre))

#2.Setting
r+geom_point(color="Dark Green")

#Error
r+geom_point(aes(color="Dark Green"))
#You think you setting the color but
#in actual you mapping it to variable which R think you are creating 


#Examples
#1.Mapping

r+geom_point(aes(size=BudgetMillions))

#2.Setting

r+geom_point(size=10)

#Error
r+geom_point(aes(size=10))
#Taking 10 as a category and plotting it
?geom_point


#-----Histogram and Density Plot

s<- ggplot(data=movies,aes(x=BudgetMillions))
s
s+geom_histogram(binwidth = 10)


#Add color

s+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")


#Density Chart

s+geom_density(aes(fill=Genre))

s+geom_density(aes(fill=Genre),position = "stack")
#chart3

#----Starting  Layer Tips

t<- ggplot(data=movies,aes(x=AudienceRating))
t
t+geom_histogram(binwidth = 10,fill="White",color="blue")



#anotherway

t <-ggplot(data=movies)
t+geom_histogram(binwidth = 10,aes(x=AudienceRating),fill="White",color="Blue")
#chart 4

t+geom_histogram(binwidth = 10,aes(x=CriticRating),fill="White",color="Blue")
#chart5

#Skeleton Plot

t<-ggplot()

#------------Statisical transformation

u<- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,color=Genre))
u
u+geom_point()
u+geom_point()+geom_smooth(fill=NA)

#BOXPLOT

u<- ggplot(data=movies,aes(x=Genre,y=AudienceRating,color=Genre))
u+geom_boxplot()
u+geom_boxplot(size=1.2)
u+geom_boxplot(size=1.2)+geom_point()
  
#tip

u+geom_boxplot(size=1.2)+geom_jitter()

#anotherway

u+geom_jitter()+geom_boxplot(size=1.2,alpha=.5)
chart6


#handsonn
u<- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,color=Genre))
u+geom_jitter()+geom_boxplot(size=1.2,alpha=.5)



#-------Facets

v<- ggplot(data=movies,aes(x=BudgetMillions))
v
v+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")

#facets
v+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black") +
  facet_grid(Genre~.,scales="free")


#scatterplot

w<- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,color=Genre))
w
w+geom_point(size=3)+
  facet_grid(Genre~.)

w + geom_point(size=3) +
  facet_grid(.~Years)

w + geom_point(size=3)+
  facet_grid(Genre~Years)


w + geom_point(size=3)+
  geom_smooth()+
  facet_grid(Genre~Years)



w + geom_point(aes(size=BudgetMillions))+
  geom_smooth() +
  facet_grid(Genre~Years)
#1:needs to be improved

#improving scale which is -50 to 150

#-----Cordinates

m=ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,size=BudgetMillions,color=Genre))
m
m+geom_point()+
  xlim(50,100)+
  ylim(50,100)


#Dont work well always

n<-ggplot(data=movies,aes(x=BudgetMillions))
n+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")

n+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")+
  xlim(0,50)

n+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")+
  ylim(0,50)

n+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")+
  xlim(0,50)+ylim(0,50)

#instead to zoom
n+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")+
  coord_cartesian(ylim = c(0,50))

#improve
w + geom_point(aes(size=BudgetMillions))+
  geom_smooth() +
  facet_grid(Genre~Years)+
  coord_cartesian(ylim = c(0,100))


#-------Theme


