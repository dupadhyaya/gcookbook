#chapter1
mydata= data.frame(First=character(0),Last=character(0),sex=character(0),number=numeric(0))
mydata= edit(mydata)
mydata
mydata$sex = factor(mydata$sex)
str(mydata)
