##By Sanket Bhat.
#First number
a <- 151
#second number
b <- 200
#third number
c <- 7
#fourth number = difference of first and second number divided by third number.
d <- (b-a)/c
#display
d

##On the quiz question
##if you compare the summary for x and y, yes the data maybe the same from view perspective
#but if we check the data type it changes...hence i don't think the content can be considered same.
url3 <-"https://raw.githubusercontent.com/jrwolf/IT497/master/apps_count.csv"
x <- repmis::source_data(url3)
y <- read.csv(url3)
str(x)


str(y)
summary(x)
summary(y)
