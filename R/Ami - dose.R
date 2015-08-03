setwd("/Users/kamermanpr/Dropbox/00 My Documents/Analyses & papers/Natalya - Amitriptyline 2013")
dose<-data.frame(read.csv("dose.csv", header=T, sep=","))
str(dose)
dose[,"Period"]<-factor(dose$Period, levels=c(1,2))
str(dose)
library(exactRankTests)
#
#########################
# Dose - ARV 
########################
#
#Ami P1 vs P2
Ami_arv_p1<-subset(dose, dose$Treatment=="A" & dose$ARV=="Yes" & dose$Period=="1", select=c(ID, Dose, ARV, Treatment, Period))
Ami_arv_p2<-subset(dose, dose$Treatment=="A" & dose$ARV=="Yes" & dose$Period=="2", select=c(ID, Dose, ARV, Treatment, Period))
summary(Ami_arv_p1$Dose)
summary(Ami_arv_p2$Dose)
wilcox.exact(Ami_arv_p1$Dose, Ami_arv_p2$Dose, paired=F, exact=T)
# The dose of amitriptyline taken by patients in the ARV-user group was greater in period 2 than in period 1
#
#Placebo P1 vs P2
P_arv_p1<-subset(dose, dose$Treatment=="P" & dose$ARV=="Yes" & dose$Period=="1", select=c(ID, Dose, ARV, Treatment, Period))
P_arv_p2<-subset(dose, dose$Treatment=="P" & dose$ARV=="Yes" & dose$Period=="2", select=c(ID, Dose, ARV, Treatment, Period))
summary(P_arv_p1$Dose)
summary(P_arv_p2$Dose)
wilcox.exact(P_arv_p1$Dose, P_arv_p2$Dose, paired=F, exact=T)
# The dose of placebo taken by patients in the ARV-user group did not differ significantly across the two treatment periods
#
# P1 Ami vs Plac
wilcox.exact(Ami_arv_p1$Dose, P_arv_p1$Dose, paired=F,exact=T)
# The dose of Ami and Placebo did not differ in the ARV-user group in period 1
#
# P2 Ami vs Plac
wilcox.exact(Ami_arv_p2$Dose, P_arv_p2$Dose, paired=F,exact=T)
# The dose of Ami and Placebo did not differ in the ARV-user group in period 2
#
#All - Plac vs Ami
P_arv<-subset(dose, dose$Treatment=="P" & dose$ARV=="Yes", select=c(ID, Dose, ARV, Treatment))
Ami_arv<-subset(dose, dose$Treatment=="A" & dose$ARV=="Yes", select=c(ID, Dose, ARV, Treatment))
arv<-merge(P_arv, Ami_arv, by="ID")
str(arv)
summary(arv[,c(2,5)])
wilcox.exact(arv[,2], arv[,5], paired=T, exact=T)
# The dose of Ami and Placebo did not differ in the ARV-user group across both treatment periods
#
#########################
# Dose - ARV-naive 
########################
#
#Ami P1 vs P2
Ami_arv.n_p1<-subset(dose, dose$Treatment=="A" & dose$ARV=="No" & dose$Period=="1", select=c(ID, Dose, ARV, Treatment, Period))
Ami_arv.n_p2<-subset(dose, dose$Treatment=="A" & dose$ARV=="No" & dose$Period=="2", select=c(ID, Dose, ARV, Treatment, Period))
summary(Ami_arv.n_p1$Dose)
summary(Ami_arv.n_p2$Dose)
wilcox.exact(Ami_arv.n_p1$Dose, Ami_arv.n_p2$Dose, paired=F, exact=T)
# The dose of amitriptyline taken by patients in the ARV-naive group was greater in period 2 than in period 1
#
#Placebo P1 vs P2
P_arv.n_p1<-subset(dose, dose$Treatment=="P" & dose$ARV=="No" & dose$Period=="1", select=c(ID, Dose, ARV, Treatment, Period))
P_arv.n_p2<-subset(dose, dose$Treatment=="P" & dose$ARV=="No" & dose$Period=="2", select=c(ID, Dose, ARV, Treatment, Period))
summary(P_arv.n_p1$Dose)
summary(P_arv.n_p2$Dose)
wilcox.exact(P_arv.n_p1$Dose, P_arv.n_p2$Dose, paired=F, exact=T)
# The dose of placebo taken by patients in the ARV-naive group was greater in period 2 than in period 1
#
# P1 Ami vs Plac
wilcox.exact(Ami_arv.n_p1$Dose, P_arv.n_p1$Dose, paired=F,exact=T)
# The dose of Ami and Placebo did not differ in the ARV-naive group in period 1
#
# P2 Ami vs Plac
wilcox.exact(Ami_arv.n_p2$Dose, P_arv.n_p2$Dose, paired=F,exact=T)
# The dose of Ami and Placebo did not differ in the ARV-naive group in period 2
#
#All - Plac vs Ami
P_arv.n<-subset(dose, dose$Treatment=="P" & dose$ARV=="No", select=c(ID, Dose, ARV, Treatment))
Ami_arv.n<-subset(dose, dose$Treatment=="A" & dose$ARV=="No", select=c(ID, Dose, ARV, Treatment))
arv.n<-merge(P_arv.n, Ami_arv.n, by="ID")
str(arv.n)
summary(arv.n[,c(2,5)])
wilcox.exact(arv.n[,2], arv.n[,5], paired=T, exact=T)
# The dose of Ami and Placebo did not differ in the ARV-naive group across both treatment periods
#
########################
# ARV-user vs ARV-naive
########################
#
# Period 1
# ARV user 
arv.all.p1<-subset(dose, dose$Period=="1" & dose$ARV=="Yes", select=c(ID, Dose, Treatment))
# ARV naive
arv.n.all.p1<-subset(dose, dose$Period=="1" & dose$ARV=="No", select=c(ID, Dose, Treatment))
summary(arv.all.p1$Dose) # ARV-user
summary(arv.n.all.p1$Dose) # ARV-naive
wilcox.exact(arv.all.p1$Dose, arv.n.all.p1$Dose, paired=F, exact=T)
# Number of tablets taken did not differ between ARV-user and ARV-naive during period 1
#
# Period 2
# ARV user 
arv.all.p2<-subset(dose, dose$Period=="2" & dose$ARV=="Yes", select=c(ID, Dose, Treatment))
# ARV naive
arv.n.all.p2<-subset(dose, dose$Period=="2" & dose$ARV=="No", select=c(ID, Dose, Treatment))
summary(arv.all.p2$Dose) # ARV-user
summary(arv.n.all.p2$Dose) # ARV-naive
wilcox.exact(arv.all.p2$Dose, arv.n.all.p2$Dose, paired=F, exact=T)
#
#Dose - All
#Placebo 
P_all<-subset(dose, dose$Treatment=="P", select=c(ID, Dose, Treatment))
P_all
#Ami
Ami_all<-(subset(dose, dose$Treatment=="A", select=c(ID, Dose, Treatment)))
Ami_all
#Merge 
all<-merge(P_all,Ami_all, by="ID")
all
colnames(all)<-c("ID", "Dose.P", "Treatment.P", "Dose.A", "Treatment.A")
all1<-data.frame(all)
summary(all1[,c(2,4)])
wilcox.exact(all1$Dose.P, all1$Dose.A, paired=TRUE, exact=TRUE)
# No significant difference in dose titration between placebo and ami interventions (ignoring ART group and period)
#

