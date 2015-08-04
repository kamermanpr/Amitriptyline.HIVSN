# setwd()
library(curl)
se<-data.frame(read.csv(curl("https://raw.github.com/kamermanpr/Amitriptyline.HIVSN/blob/master/DataFiles/SideEffects.csv"), header=T))
str(se)
dim(se)
#########
#McNemars
#########
library(exactci)
library(exact2x2)
#
#Drowsy
#
drowsy<-mcnemar.exact(se$P_Drowsy, se$Ami_Drowsy, conf.level = 0.95)
drowsy
D_counts<-matrix(c(tapply(se$P_Drowsy, se$P_Drowsy=="No", length), tapply(se$Ami_Drowsy, se$Ami_Drowsy=="No", length)), nrow=2, ncol=2, byrow=T)
rownames(D_counts)=c("Placebo", "Amitriptyline")
colnames(D_counts)=c("Drowsy","None")
D_counts
#
#Dry-mouth
#
dry_mouth<-mcnemar.exact(se$P_Dry, se$Ami_Dry, conf.level = 0.95)
dry_mouth
DM_counts<-matrix(c(tapply(se$P_Dry, se$P_Dry=="No", length), tapply(se$Ami_Dry, se$Ami_Dry=="No", length)), nrow=2, ncol=2, byrow=T)
rownames(DM_counts)=c("Placebo", "Amitriptyline")
colnames(DM_counts)=c("Dry mouth","None")
DM_counts
#
#Chest
#
str(se)
se["Ami_Chest"]<-factor(se$Ami_Chest, levels=c("Chest", "No"))#Make Ami_chest have two levels
str(se)
chest<-mcnemar.exact(se$P_Chest, se$Ami_Chest, conf.level = 0.95)
chest

