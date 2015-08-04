# setwd()
library(curl)
res.1<-data.frame(read.csv(curl("https://raw.github.com/kamermanpr/Amitriptyline.HIVSN/blob/master/DataFiles/ResponderAnalysis.csv"), header=T))
str(res.1)
# Convert NAs in no-ARV to "No"
res.1$D4T.ever[is.na(res.1$D4T.ever)]<-"No"
res.1$D4T.ever<-factor(res.1$D4T.ever)
res.1$D4T.now[is.na(res.1$D4T.now)]<-"No"
res.1$D4T.now<-factor(res.1$D4T.now)
res.1$D4T.previously[is.na(res.1$D4T.previously)]<-"No"
res.1$D4T.previously<-factor(res.1$D4T.previously)
str(res.1)
# ARV data
res.arv<-subset(res.1, ARV=="Yes")
res.arv$ARV<-factor(res.arv$ARV); str(res.arv)
# non-ARV data
res.n.arv<-subset(res.1, ARV=="No")
res.n.arv$ARV<-factor(res.n.arv$ARV); str(res.n.arv)
#
###########
# ARV GROUP
###########
attach(res.arv)

sink("Responder.analysis.ARV.txt")
# Ami dose
tapply(Ami.dose, Responder, summary)
wilcox.exact(Ami.dose~Responder, paired=F)

# Order
xtabs(~Responder+Order)
fisher.test(Responder, Order)
# Age
tapply(Age, Responder, mean)
tapply(Age, Responder, sd)
t.test(Age~Responder, paired=F)
par(bty='n')
boxplot(CD4~Age, ylab="CD4 T-cell count")
# Female
xtabs(~Responder+Female)
fisher.test(Responder, Female)
# Employed
xtabs(~Responder+Employed)
fisher.test(Responder, Employed)
# Education
xtabs(~Responder+Education..9yrs)
fisher.test(Responder, Education..9yrs)
# D4T ever
xtabs(~Responder+D4T.ever)
fisher.test(Responder, D4T.ever)
# D4T now
xtabs(~Responder+D4T.now)
fisher.test(Responder, D4T.now)
# D4T previously
xtabs(~Responder+D4T.previously)
fisher.test(Responder, D4T.previously)
# CD4
with(res.arv, tapply(CD4, Responder, summary))
wilcox.test(CD4~Responder, paired=F, exact=F, correct=T)
par(bty='n')
boxplot(CD4~Responder, ylim=c(0,800), ylab="CD4 T-cell count")
# Burning
xtabs(~Responder+Burning)
fisher.test(Responder, Burning)
# Painful cold
xtabs(~Responder+Painful.cold)
fisher.test(Responder, Painful.cold)
# Electric shocks
xtabs(~Responder+Electric.shocks)
fisher.test(Responder, Electric.shocks)
# Tingling
xtabs(~Responder+Tingling)
fisher.test(Responder, Tingling)
# Pins-and-needles
xtabs(~Responder+Pins.n.needles)
fisher.test(Responder, Pins.n.needles)
# Numbness
xtabs(~Responder+Numbness)
fisher.test(Responder, Numbness)
# Itching
xtabs(~Responder+Itching)
fisher.test(Responder, Itching)
# Touch hypoesthesia
xtabs(~Responder+Touch.hypoesthesia)
fisher.test(Responder, Touch.hypoesthesia)
# Pin-prick hypoaesthesia
xtabs(~Responder+Pin.prick.hypoesthesia)
fisher.test(Responder, Pin.prick.hypoesthesia)
# Brush allodynia
xtabs(~Responder+Brush.allodynia)
fisher.test(Responder, Brush.allodynia)
sink()
detach(res.arv)
###############
# NON-ARV GROUP
###############
attach(res.n.arv)
sink("Responder.analysis.NO-ARV.txt")
# Ami dose
tapply(Ami.dose, Responder, summary)
wilcox.exact(Ami.dose~Responder, paired=F)
# Order
xtabs(~Responder+Order)
fisher.test(Responder, Order)
# Age
tapply(Age, Responder, mean)
tapply(Age, Responder, sd)
t.test(Age~Responder, paired=F)
par(bty='n')
boxplot(CD4~Age, ylab="CD4 T-cell count")
# Female
xtabs(~Responder+Female)
fisher.test(Responder, Female)
# Employed
xtabs(~Responder+Employed)
fisher.test(Responder, Employed)
# Education
xtabs(~Responder+Education..9yrs)
fisher.test(Responder, Education..9yrs)
# CD4
with(res.n.arv, tapply(CD4, Responder, summary))
wilcox.test(CD4~Responder, paired=F, exact=F, correct=T)
par(bty='n')
boxplot(CD4~Responder, ylim=c(0,1000), ylab="CD4 T-cell count")
# Burning
xtabs(~Responder+Burning)
fisher.test(Responder, Burning)
# Painful cold
xtabs(~Responder+Painful.cold)
fisher.test(Responder, Painful.cold)
# Electric shocks
xtabs(~Responder+Electric.shocks)
fisher.test(Responder, Electric.shocks)
# Tingling
xtabs(~Responder+Tingling)
fisher.test(Responder, Tingling)
# Pins-and-needles
xtabs(~Responder+Pins.n.needles)
fisher.test(Responder, Pins.n.needles)
# Numbness
xtabs(~Responder+Numbness)
fisher.test(Responder, Numbness)
# Itching
xtabs(~Responder+Itching)
fisher.test(Responder, Itching)
# Touch hypoesthesia
xtabs(~Responder+Touch.hypoesthesia)
fisher.test(Responder, Touch.hypoesthesia)
# Pin-prick hypoaesthesia
xtabs(~Responder+Pin.prick.hypoesthesia)
fisher.test(Responder, Pin.prick.hypoesthesia)
# Brush allodynia
xtabs(~Responder+Brush.allodynia)
fisher.test(Responder, Brush.allodynia)
sink()
detach(res.n.arv)
#####
# ALL
#####
attach(res.1)
sink("Responder.analysis.ALL.txt")
# Order
xtabs(~Responder+Order)
fisher.test(Responder, Order)
# Female
xtabs(~Responder+Female)
fisher.test(Responder, Female)
# Employed
xtabs(~Responder+Employed)
fisher.test(Responder, Employed)
# Education
xtabs(~Responder+Education..9yrs)
fisher.test(Responder, Education..9yrs)
# D4T ever
xtabs(~Responder+D4T.ever)
fisher.test(Responder, D4T.ever)
# D4T now
xtabs(~Responder+D4T.now)
fisher.test(Responder, D4T.now)
# D4T previously
xtabs(~Responder+D4T.previously)
fisher.test(Responder, D4T.previously)
# CD4
tapply(CD4, Responder, summary)
wilcox.test(CD4~Responder, paired=F, exact=F, correct=T)
par(bty='n')
boxplot(CD4~Responder, ylim=c(0,1000), ylab="CD4 T-cell count")
sink()
detach(res.1)


