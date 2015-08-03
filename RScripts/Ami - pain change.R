# Delta.P and Delta.Ami are change in pain score between week 1(9) and week 6(15) for placebo and ami interventions, respectively
# Delta is (Delta.Ami - Delta.P) 
setwd("/Users/kamermanpr/Dropbox/00 My Documents/Analyses & papers/Natalya - Amitriptyline 2013")
dpain0<-read.csv("Pain change2.csv", header=T)
str(dpain0)
dpain0[c(3:5)]<-lapply(dpain0[c(3:5)], as.numeric)
str(dpain0)
#
######################
# ARV USERS
######################
#
dpain.arv<-subset(dpain0, dpain0$ARV=="Yes")
rownames(dpain.arv)=NULL
dpain.arv
MEAN<-c(mean(dpain.arv$Delta.P), mean(dpain.arv$Delta.Ami))
SD<-c(sd(dpain.arv$Delta.P), sd(dpain.arv$Delta.Ami)) 
MEAN # Placebo, Ami
SD # Placebo, Ami
options(contrasts=c("contr.sum","contr.poly")) # To adhere to the sum-to-zero convention for effect weights
t.test(dpain.arv$Delta.P, dpain.arv$Delta.Ami, paired=T, var.equal=T)
boxplot(dpain.arv[,c(3:4)])
dev.off()
#
######################
# ARV NAIVE
######################
#
dpain.n<-subset(dpain0, dpain0$ARV=="No")
rownames(dpain.n)=NULL
dpain.n
MEAN<-c(mean(dpain.n$Delta.P), mean(dpain.n$Delta.Ami))
SD<-c(sd(dpain.n$Delta.P), sd(dpain.n$Delta.Ami)) 
MEAN # Placebo, Ami
SD # Placebo, Ami
options(contrasts=c("contr.sum","contr.poly")) # To adhere to the sum-to-zero convention for effect weights
t.test(dpain.n$Delta.P, dpain.n$Delta.Ami, paired=T, var.equal=T)
boxplot(dpain.n[,c(3:4)])
dev.off()
#
####################
# ALL DATA
####################
#
MEAN<-c(mean(dpain0$Delta.P), mean(dpain0$Delta.Ami))
SD<-c(sd(dpain0$Delta.P), sd(dpain0$Delta.Ami)) 
MEAN # Placebo, Ami
SD # Placebo, Ami
options(contrasts=c("contr.sum","contr.poly")) # To adhere to the sum-to-zero convention for effect weights
t.test(dpain0$Delta.P, dpain0$Delta.Ami, paired=T, var.equal=T)
boxplot(dpain0[,c(3:4)])
dev.off()
#