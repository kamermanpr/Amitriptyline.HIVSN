setwd("/Users/kamermanpr/Dropbox/00 My Documents/Analyses & papers/Natalya - Amitriptyline 2013")
data<-read.csv("Pain.dose.csv")
str(data)
data$PercentPainChange<-100*(data$PainChange/data$T1)
data.2<-subset(data, data$Treatment=="A") # subset amitriptyline data
str(data.2)
data.p1<-subset(data.2, data.2$Order=="AP") # subset those that received ami in the first period
data.p1$Dose<-factor(data.p1$Dose)
dim(data.p1)
data.p2<-subset(data.2, data.2$Order=="PA") # subset those that received ami in the second period
data.p2$Dose<-factor(data.p2$Dose)
dim(data.p2)

library("beeswarm")
### All
data.2$Dose<-factor(data.2$Dose)
## LM
all<-lm(PainChange~Dose, data=data.2)
summary(all)
## Plots
par(mfrow=c(2,1))
par(mar=c(4,7,7,2))
# Frequency hist
hist(as.numeric(as.character(data.2$Dose))/25, breaks=c(0,1,2,3,4),
     xaxt="n", xlab="Number of 25 mg tablets", 
     main="Frequency distribution of amitriptyline\ntablets per day at the maximum titration dose", las=2)
axis(1, at=c(0.5,1.5,2.5,3.5), labels=c(1,2,3,4))

par(bty="n")
par(mfrow=c(2,1))
# Absolute change
par(mar=c(4,7,7,2))
boxplot(PainChange~Dose, data=data.2, las=1, yaxt="n", ylim=c(-10,6), 
        main="Plots of maximum titration dose of\namitriptyline versus change in pain intensity\nover six weeks of treatment")
axis(2, at=c(-10,-8, -6,-4,-2,0,2,4,6), las=2)
mtext("Absolute change in pain intensity", 2, line = 4)
beeswarm(PainChange~Dose, data=data.2, method="swarm", pch=21, col="black", bg="red", cex=1.5, add=T)
# Percentage change
par(mar=c(10,7,1,2))
boxplot(PercentPainChange~Dose, data=data.2, las=1, yaxt="n", ylim=c(-100,60), 
        xlab="Dose (mg/day)")
axis(2, at=c(-100,-80, -60,-40,-20,0,20,40, 60), las=2)
mtext("Percentage change in pain intensity (%)", 2, line = 4)
beeswarm(PercentPainChange~Dose, data=data.2, method="swarm", pch=21, col="black", bg="red", cex=1.5, add=T)

### Period 1
## LM
p1<-lm(PainChange~Dose, data=data.p1)
summary(p1)
## Plots
par(mfrow=c(2,1))
par(mar=c(4,7,7,2))
# Frequency hist
hist(as.numeric(as.character(data.p1$Dose))/25, breaks=c(0,1,2,3,4),
     xaxt="n", xlab="Number of 25 mg tablets", 
     main="Period 1: Frequency distribution of amitriptyline\ntablets per day at the maximum titration dose", las=2)
axis(1, at=c(0.5,1.5,2.5,3.5), labels=c(1,2,3,4))

par(bty="n")
par(mfrow=c(2,1))
# Absolute change
par(mar=c(4,7,7,2))
boxplot(PainChange~Dose, data=data.p1, las=1, yaxt="n", ylim=c(-10,4), 
        xlab="Dose (mg/day)",
        main="Period 1: Plots of maximum titration dose of\namitriptyline versus change in pain intensity\nover six weeks of treatment")
axis(2, at=c(-10,-8, -6,-4,-2,0,2,4), las=2)
mtext("Absolute change in pain intensity", 2, line = 4)
beeswarm(PainChange~Dose, data=data.p1, method="swarm", pch=21, col="black", bg="red", cex=1.5, add=T)
# Percentage change
par(mar=c(10,7,1,2))
boxplot(PercentPainChange~Dose, data=data.p1, las=1, yaxt="n", ylim=c(-100,60), 
        xlab="Dose (mg/day)")
axis(2, at=c(-100,-80, -60,-40,-20,0,20,40, 60), las=2)
mtext("Percentage change in pain intensity (%)", 2, line = 4)
beeswarm(PercentPainChange~Dose, data=data.p1, method="swarm", pch=21, col="black", bg="red", cex=1.5, add=T)

### Period 2
## LM
p2<-lm(PainChange~Dose, data=data.p2)
summary(p2)
## Plots
par(mfrow=c(2,1))
par(mar=c(4,7,7,2))
# Frequency hist
hist(as.numeric(as.character(data.p2$Dose))/25, breaks=c(0,1,2,3,4),
     xaxt="n", xlab="Number of 25 mg tablets", 
     main="Period 2: Frequency distribution of amitriptyline\ntablets per day at the maximum titration dose", las=2)
axis(1, at=c(0.5,1.5,2.5,3.5), labels=c(1,2,3,4))

par(bty="n")
par(mfrow=c(2,1))
# Absolute change
par(mar=c(4,7,7,2))
boxplot(PainChange~Dose, data=data.p2, las=1, yaxt="n", ylim=c(-10,6), 
        xlab="Dose (mg/day)",
        main="Period 2: Plots of maximum titration dose of\namitriptyline versus change in pain intensity\nover six weeks of treatment")
axis(2, at=c(-10,-8, -6,-4,-2,0,2,4,6), las=2)
mtext("Absolute change in pain intensity", 2, line = 4)
beeswarm(PainChange~Dose, data=data.p2, method="swarm", pch=21, col="black", bg="red", cex=1.5, add=T)
# Percentage change
par(mar=c(10,7,1,2))
boxplot(PercentPainChange~Dose, data=data.p2, las=1, yaxt="n", ylim=c(-100,60), 
        xlab="Dose (mg/day)")
axis(2, at=c(-100,-80, -60,-40,-20,0,20,40, 60), las=2)
mtext("Percentage change in pain intensity (%)", 2, line = 4)
beeswarm(PercentPainChange~Dose, data=data.p2, method="swarm", pch=21, col="black", bg="red", cex=1.5, add=T)

