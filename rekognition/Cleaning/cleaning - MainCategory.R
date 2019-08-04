setwd("F:/Masters/Semester 3/thesis/rekognition")
library(dplyr)
library(plyr)
library(tidyverse)
df = read.csv("./category.csv")
df1 = read.csv("./images.csv",header = FALSE)

names(df1) <- c('id','Name','UserID')

#df = df %>%
#  left_join(df1, by=c("Name"))

df = merge(x=df, y=df1, by="Name")


write.csv(df, "./dataset1.csv",row.names = FALSE)
