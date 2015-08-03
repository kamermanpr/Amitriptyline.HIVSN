setwd("/Users/kamermanpr/Dropbox/00 My Documents/Analyses & papers/Natalya - Amitriptyline 2013")
base<-data.frame(read.csv("Pain baselines.csv", header=T, sep=","))
str(base)
base[,"Period"]<-factor(base$Period, levels=c(1,2))
str(base)
#
#########################
# Pain - ARV 
########################
#
#Ami P1 vs P2
Ami_arv_p1<-subset(base, base$Treatment=="A" & base$ARV=="Yes" & base$Period=="1", select=c(ID, Pain, ARV, Treatment, Period))
Ami_arv_p2<-subset(base, base$Treatment=="A" & base$ARV=="Yes" & base$Period=="2", select=c(ID, Pain, ARV, Treatment, Period))
summary(Ami_arv_p1$Pain)
sd(Ami_arv_p1$Pain)
summary(Ami_arv_p2$Pain)
sd(Ami_arv_p2$Pain)
t.test(Ami_arv_p1$Pain, Ami_arv_p2$Pain, paired=F, var.qual=T)
boxplot(Ami_arv_p1$Pain, Ami_arv_p2$Pain)
# The baseline pain of patients in the ARV-user group taking amitriptyline was greater in period 1 than in period 2
#
#Placebo P1 vs P2
P_arv_p1<-subset(base, base$Treatment=="P" & base$ARV=="Yes" & base$Period=="1", select=c(ID, Pain, ARV, Treatment, Period))
P_arv_p2<-subset(base, base$Treatment=="P" & base$ARV=="Yes" & base$Period=="2", select=c(ID, Pain, ARV, Treatment, Period))
summary(P_arv_p1$Pain)
sd(P_arv_p1$Pain)
summary(P_arv_p2$Pain)
sd(P_arv_p2$Pain)
t.test(P_arv_p1$Pain, P_arv_p2$Pain, paired=F, var.equal=T)
# The baseline pain of patients in the ARV-user group taking placebo was greater in period 1 than in period 2
#
# P1 Ami vs Plac
t.test(Ami_arv_p1$Pain, P_arv_p1$Pain, paired=F,var.equal=T)
# The baseline pain did not differ between the two interventions in Period 1
#
# P2 Ami vs Plac
t.test(Ami_arv_p2$Pain, P_arv_p2$Pain, paired=F,var.equal=T)
# The baseline pain did not differ between the two interventions in Period 2
#
# Ami+Plac P1 vs P2
arv_p1<-subset(base, base$ARV=="Yes" & base$Period=="1", select=c(ID, Pain, ARV, Treatment, Period))
arv_p2<-subset(base, base$ARV=="Yes" & base$Period=="2", select=c(ID, Pain, ARV, Treatment, Period))
summary(arv_p1$Pain)
sd(arv_p1$Pain)
summary(arv_p2$Pain)
sd(arv_p2$Pain)
t.test(arv_p1$Pain, arv_p2$Pain, paired=T, var.qual=T)
boxplot(arv_p1$Pain, arv_p2$Pain)
#
#########################
# Pain - ARV-naive 
########################
#
#Ami P1 vs P2
Ami_arv.n_p1<-subset(base, base$Treatment=="A" & base$ARV=="No" & base$Period=="1", select=c(ID, Pain, ARV, Treatment, Period))
Ami_arv.n_p2<-subset(base, base$Treatment=="A" & base$ARV=="No" & base$Period=="2", select=c(ID, Pain, ARV, Treatment, Period))
summary(Ami_arv.n_p1$Pain)
sd(Ami_arv.n_p1$Pain)
summary(Ami_arv.n_p2$Pain)
sd(Ami_arv.n_p2$Pain)
t.test(Ami_arv.n_p1$Pain, Ami_arv.n_p2$Pain, paired=F, var.equal=T)
# The baseline pain between the two periods differed significantly.
#
#Placebo P1 vs P2
P_arv.n_p1<-subset(base, base$Treatment=="P" & base$ARV=="No" & base$Period=="1", select=c(ID, Pain, ARV, Treatment, Period))
P_arv.n_p2<-subset(base, base$Treatment=="P" & base$ARV=="No" & base$Period=="2", select=c(ID, Pain, ARV, Treatment, Period))
summary(P_arv.n_p1$Pain)
sd(P_arv.n_p1$Pain)
summary(P_arv.n_p2$Pain)
sd(P_arv.n_p2$Pain)
t.test(P_arv.n_p1$Pain, P_arv.n_p2$Pain, paired=F, var.equal=T)
# The baseline pain between the two periods differed significantly.
#
# P1 Ami vs Plac
t.test(Ami_arv.n_p1$Pain, P_arv.n_p1$Pain, paired=F,var.equal=T)
# The baseline pain did not differ between the two interventions in Period 1
#
# P2 Ami vs Plac
t.test(Ami_arv.n_p2$Pain, P_arv.n_p2$Pain, paired=F,var.equal=T)
# The baseline pain did not differ between the two interventions in Period 1
#
# Ami+Plac P1 vs P2
arv.n_p1<-subset(base, base$ARV=="No" & base$Period=="1", select=c(ID, Pain, ARV, Treatment, Period))
arv.n_p2<-subset(base, base$ARV=="No" & base$Period=="2", select=c(ID, Pain, ARV, Treatment, Period))
summary(arv.n_p1$Pain)
sd(arv.n_p1$Pain)
summary(arv.n_p2$Pain)
sd(arv.n_p2$Pain)
t.test(arv.n_p1$Pain, arv.n_p2$Pain, paired=T, var.qual=T)
boxplot(arv.n_p1$Pain, arv.n_p2$Pain)
#
########################
# ARV-user vs ARV-naive
########################
#
# Period 1
# ARV user 
arv.all.p1<-subset(base, base$Period=="1" & base$ARV=="Yes", select=c(ID, Pain, Treatment))
# ARV naive
arv.n.all.p1<-subset(base, base$Period=="1" & base$ARV=="No", select=c(ID, Pain, Treatment))
summary(arv.all.p1$Pain) # ARV-user
sd(arv.all.p1$Pain)
summary(arv.n.all.p1$Pain) # ARV-naive
sd(arv.n.all.p1$Pain)
t.test(arv.all.p1$Pain, arv.n.all.p1$Pain, paired=F, var.equal=T)
# No difference in baseline pain between ARV-user and ARV-naive during period 1
#
# Period 2
# ARV user 
arv.all.p2<-subset(base, base$Period=="2" & base$ARV=="Yes", select=c(ID, Pain, Treatment))
# ARV naive
arv.n.all.p2<-subset(base, base$Period=="2" & base$ARV=="No", select=c(ID, Pain, Treatment))
summary(arv.all.p2$Pain) # ARV-user
sd(arv.all.p2$Pain)
summary(arv.n.all.p2$Pain) # ARV-naive
sd(arv.n.all.p2$Pain)
t.test(arv.all.p2$Pain, arv.n.all.p2$Pain, paired=F, var.equal=T)
# No difference in baseline pain between ARV-user and ARV-naive during period 2
#