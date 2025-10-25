#paste("5 + 3 = ", 5 + 3)

# 
# x <- 8 + 2
# print(x)

# paste0('Hello', 'World', 'Again','and Again', 'andAgain')
# 
# words <- c("hayneedlestack", "haystack", "needle and thread")
# print(words)



# NA + 3 + 5 * 2
# 
# sum(3, 6, 8, NA)
# 
# sum(3, 6, 8, NA, na.rm=T)

# numbers <- 1:6
# print(numbers)
# 
# 
# index <- c(FALSE, TRUE, FALSE, TRUE, FALSE, TRUE)
# print(index)
# evens <- numbers[index]
# print(evens)

# library(datasets)
# data(iris) 
# mean(iris$Sepal.Length)   # average sepal length
# summary(iris$Sepal.Length) # min, max, median, quartiles
# hist(iris$Sepal.Length)    # histogram

# name <- c('Micheál', 'Leo', 'Eamonn', 'Mary Lou')
# age <- c(60, 41, 51, 47)
# party <- c('Fianna Fáil', 'Fine Gael', 'Greens', 'Sinn Féin')
# inGovernment <- c(T, T, T, F)
# print(name)
# class(name)
# typeof(name)
# print(age)
# class(age)
# typeof(age)

setwd("E:/GG/Msc/DATA9910 (23115C)_working_with_data_lucas_rizzo_10ects_Thurs/github/wwd_9910_thurs/labs and exercises/w3/working")
getwd()

iris1 <-read.table('iris.csv', sep = ",", header = TRUE)

install.packages("readr")
library(readr)
library(tidyverse)

iris2 <- read_csv('iris.csv')
print(iris2)

