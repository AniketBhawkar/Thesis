setwd("F:/Masters/Semester 3/thesis/x17170885/Cleaning")
library(dplyr)
library(plyr)
library(tidyverse)
df = read.csv("../Dataset/category.csv")
df1 = read.csv("../Dataset/images.csv",header = FALSE)

names(df1) <- c('id','Name','UserID')

#df = df %>%
#  left_join(df1, by=c("Name"))

df = merge(x=df, y=df1, by="Name")


write.csv(df, "../Dataset/dataset1.csv",row.names = FALSE)
