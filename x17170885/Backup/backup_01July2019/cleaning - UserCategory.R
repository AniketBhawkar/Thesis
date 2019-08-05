setwd("F:/Masters/Semester 3/rekognition")
library(dplyr)
library(plyr)
library(tidyverse)
library(reshape2)

df = read.csv("./userProfiles.csv")
df1 = read.csv("./dataset-userCategory.csv")
df2 = read.csv("./dataset1.csv")

names(df1) <- c('id','MainCategory')

class(df1$id)

df = df %>%
  left_join(df1, by=c("id"))

df3 = df2 %>%
  group_by(UserID) %>%
  top_n(n=5, wt=id)
df3 = df3[,c(-1,-3)]
df4 =  dcast(df3, UserID~Category, fill=0)
colnames(df4)[1] <- "id"


df = df %>%
  left_join(df4, by=c("id"))

write.csv(df, "./dataset2.csv",row.names = FALSE)
