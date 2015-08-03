setwd("/Users/kamermanpr/Dropbox/00 My Documents/Analyses & papers/Natalya - Amitriptyline 2013")
rm<-data.frame(read.csv("Rescue meds.csv", header=T, sep=","))
str(rm)
dim(rm)
#########
#McNemars
#########
library(exactci)
library(exact2x2)
#
# Taken pain meds in the last week
#
taken<-mcnemar.exact(rm$P.taken, rm$Ami.taken, conf.level = 0.95)
taken
T_counts<-matrix(c(tapply(rm$P.taken, rm$P.taken=="0", length), tapply(rm$Ami.taken, rm$Ami.taken=="0", length)), nrow=2, ncol=2, byrow=T)
rownames(T_counts)=c("Placebo", "Amitriptyline")
colnames(T_counts)=c("Taken","None")
T_counts
x<-(13/122)*100
x


#
#Dry-mouth
#
dry_mouth<-mcnemar.exact(rm$P_Dry, rm$Ami_Dry, conf.level = 0.95)
dry_mouth
DM_counts<-matrix(c(tapply(rm$P_Dry, rm$P_Dry=="No", length), tapply(rm$Ami_Dry, rm$Ami_Dry=="No", length)), nrow=2, ncol=2, byrow=T)
rownames(DM_counts)=c("Placebo", "Amitriptyline")
colnames(DM_counts)=c("Dry mouth","None")
DM_counts
#
#Chest
#
str(rm)
rm["Ami_Chest"]<-factor(rm$Ami_Chest, levels=c("Chest", "No"))#Make Ami_chest have two levels
str(rm)
chest<-mcnemar.exact(rm$P_Chest, rm$Ami_Chest, conf.level = 0.95)
chest

