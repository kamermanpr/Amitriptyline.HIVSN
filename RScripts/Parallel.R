# setwd()
library(curl)
ppain0<-data.frame(read.csv(curl("https://raw.github.com/kamermanpr/Amitriptyline.HIVSN/blob/master/DataFiles/Parallel.csv"), header=T))
ppain0[c(6:8)]<-lapply(xpain0[c(6:8)], as.numeric)
ppain0[4]<-lapply(xpain0[4], as.factor)
str(ppain0)

# Descriptive
df<-ppain0
df$Period<-factor(df$Period)
dim(df)
df.1<-subset(df, df$Period=="1")
dim(df.1)
library(plyr)
summary<-ddply(df.1, "Treatment", summarise,
               Week0.mean=mean(T1),
               Week0.SD=sd(T1),
               Week6.mean=mean(T3),
               Week6.SD=sd(T3),
               delta.mean=mean(T1-T3),
               delta.SD=sd(T1-T3),
               sample.size=length(T1))
summary


# reshape as a long table
ppain1<-reshape(ppain0, varying=c("T1", "T2", "T3"), v.names="Pain.score", timevar="Time", times=c("Baseline", "Week.3", "Week.6"), direction="long")
str(ppain1)
ppain2<-ppain1[,-8]
str(ppain2)
ppain2[6]<-lapply(ppain2[6], as.factor)
str(ppain2)
ppain3<-ppain2[order(ppain2$ID, ppain2$Treatment),]
rownames(ppain3)=NULL
ppain3[(1:10),]
#
######################
# ANOVA ALL - PERIOD 1
######################
#
ppain4<-subset(ppain3, ppain3$Period=="1")
ppain4<-ppain4[,-c(2:4)]
rownames(ppain4)=NULL
ppain4
options(contrasts=c("contr.sum","contr.poly")) # To adhere to the sum-to-zero convention for effect weights
summary(ppain4.aov1 <- aov(Pain.score ~ Treatment+Time + Error(ID), data = ppain4))
