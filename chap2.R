#chapter 2
library(MASS)
# scatter plot
qplot(mtcars$wt,mtcars$mpg)
# 2 vectors in same data frame ie. wt & mpg
qplot(wt,mpg,data=mtcars)
# equivalent to ...
ggplot(mtcars,aes(x=wt,y=mpg)) + geom_point()
# Line Graph  - type l (L)
plot(pressure$temperature, pressure$pressure,type='l')
# additional points and lines
points(pressure$temperature,pressure$pressure)
lines(pressure$temperature,pressure$pressure/2,col='red')
points(pressure$temperature,pressure$pressure/2,col='red')
# Use ggplot to draw similar graph
qplot(pressure$temperature,pressure$pressure,geom="line")
# two vectors on the same data frame... notice axis labels
qplot(temperature,pressure,data=pressure,geom="line")
# equivalent to... in ggplot2
ggplot(pressure,aes(x=temperature,y=pressure)) + geom_line()
# lines and points put together
qplot(temperature,pressure,data=pressure,geom=c("line",'point'))
# which is equivalent to ...
ggplot(pressure,aes(x=temperature,y=pressure)) + geom_line() + geom_point()

#Bar Graph similar to a histogram, but with a discrete instead of continuous x-axis
BOD
barplot(BOD$demand, names.arg=BOD$Time)
str(mtcars)
table(mtcars$cyl)
barplot(table(mtcars$cyl))
# ggplot2 package, you can get a similar result using qplot()
# continuous values
qplot(mtcars$cyl)
# discreet Values
qplot(factor(mtcars$cyl))
# warning stat is depreciated
qplot(Time, demand, data=BOD, geom="bar", stat="identity")
# same with ggplot
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity")
# Bar graph of counts
qplot(factor(cyl), data=mtcars)
# This is equivalent to:
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar()

#histogram
hist(mtcars$mpg)
# Specify approximate number of bins with breaks
hist(mtcars$mpg, breaks=10)
qplot(mtcars$mpg)
qplot(mpg, data=mtcars, binwidth=4)
# This is equivalent to:
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=4)


#boxplot
plot(ToothGrowth$supp, ToothGrowth$len)

# Formula syntax
boxplot(len ~ supp, data = ToothGrowth)
# Put interaction of two variables on x-axis
boxplot(len ~ supp + dose, data = ToothGrowth)
qplot(ToothGrowth$supp, ToothGrowth$len, geom="boxplot")
qplot(ToothGrowth$supp, ToothGrowth$len, geom="boxplot")
qplot(supp, len, data=ToothGrowth, geom="boxplot")
ggplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot()
qplot(interaction(ToothGrowth$supp, ToothGrowth$dose), ToothGrowth$len, geom="boxplot")
qplot(interaction(supp, dose), len, data=ToothGrowth, geom="boxplot")
ggplot(ToothGrowth, aes(x=interaction(supp, dose), y=len)) + geom_boxplot()


# Curve
curve(x^3 - 5*x, from=-4, to=4)
myfun <- function(xvar) {
1/(1 + exp(-xvar + 10))
}
curve(myfun(x), from=0, to=20)
curve(1-myfun(x), add = TRUE, col = "red")
qplot(c(0,20), fun=myfun, stat="function", geom="line")
ggplot(data.frame(x=c(0, 20)), aes(x=x)) + stat_function(fun=myfun, geom="line")

