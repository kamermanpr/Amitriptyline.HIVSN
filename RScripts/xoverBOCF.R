setwd("/Users/kamermanpr/Dropbox/00 My Documents/Analyses & papers/Natalya - Amitriptyline 2013")
xpain0<-read.csv("Pain xover.BOCF.csv", header=T)
xpain0[c(6:8)]<-lapply(xpain0[c(6:8)], as.numeric)
xpain0[4]<-lapply(xpain0[4], as.factor)
str(xpain0)
# reshape as a long table
xpain1<-reshape(xpain0, varying=c("T1", "T2", "T3"), v.names="Pain.score", timevar="Time", times=c("Baseline", "Week.3", "Week.6"), direction="long")
str(xpain1)
xpain2<-xpain1[,-8]
str(xpain2)
xpain2[6]<-lapply(xpain2[6], as.factor)
str(xpain2)
xpain3<-xpain2[order(xpain2$ID, xpain2$Treatment),]
rownames(xpain3)=NULL
xpain3[(1:10),]
#
######################
# ANOVA FOR ARV USERS
######################
#
xpain.arv<-subset(xpain3, xpain3$ARV=="Yes")
rownames(xpain.arv)=NULL
options(contrasts=c("contr.sum","contr.poly")) # To adhere to the sum-to-zero convention for effect weights
summary(xpain.arv.aov1 <- aov(Pain.score ~ Order + Period + Time + Treatment + Error(ID), data = xpain.arv))
# Order: order of treatments (PA or AP); Period: before (1) or after crossover (2); Time: pain score from baseline through to week 6; Treatment: Placebo or amitriptyline; ARV: yes or no.
# Interaction plots
library(dae)
library(lattice)
interaction.ABC.plot(Pain.score, Time, Treatment,Period, xpain.arv, fun="mean", 
                     title="Interaction plots: ARV users", xlab="Time", 
                     ylab="Pain intensity", type="p")
dev.off()
#
######################
# ANOVA FOR ARV NAIVE
######################
#
xpain.n.arv<-subset(xpain3, xpain3$ARV=="No")
rownames(xpain.n.arv)=NULL
options(contrasts=c("contr.sum","contr.poly")) # To adhere to the sum-to-zero convention for effect weights
summary(xpain.aov1 <- aov(Pain.score ~ Order + Period + Time + Treatment + Error(ID), data = xpain.n.arv))
# Order: order of treatments (PA or AP); Period: before (1) or after crossover (2); Time: pain score from baseline through to week 6; Treatment: Placebo or amitriptyline; ARV: yes or no.
# Interaction plots
interaction.ABC.plot(Pain.score, Time, Treatment,Period, xpain.n.arv, fun="mean", 
                     title="Interaction plots: ARV-naive", xlab="Time", 
                     ylab="Pain intensity", type="p")
dev.off()
#
####################
# ANOVA FOR ALL DATA
####################
#
options(contrasts=c("contr.sum","contr.poly")) # To adhere to the sum-to-zero convention for effect weights
summary(xpain.aov1 <- aov(Pain.score ~ Order + Period + ARV + Time + Treatment + Error(ID), data = xpain3))
# Order: order of treatments (PA or AP); Period: before (1) or after crossover (2); Time: pain score from baseline through to week 6; Treatment: Placebo or amitriptyline; ARV: yes or no.
# Interaction plots
interaction.ABC.plot(Pain.score, Time, Treatment,Period, xpain3, fun="mean", 
                     title="Interaction plots: All participants", xlab="Time", 
                     ylab="Pain intensity", type="p")
dev.off()
