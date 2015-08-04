# setwd()
library(curl)
nnt0<-data.frame(read.csv(curl("https://raw.github.com/kamermanpr/Amitriptyline.HIVSN/blob/master/DataFiles/NNT.csv"), header=T))
str(nnt0)
nnt0[c(5:7)]<-lapply(nnt0[c(5:7)], as.numeric)
nnt0[3]<-lapply(nnt0[3], as.factor)
str(nnt0)
length(nnt0$Delta)
# Ami
ami.nnt<-subset(nnt0, Treatment=="A")
ami.nnt.1<-tapply(ami.nnt$Delta, ami.nnt$Delta>=50, length)
length(ami.nnt$Delta)
ami.nnt.1 # TRUE: >=50% reduction in pain intensity
# Plac
plac.nnt<-subset(nnt0, Treatment=="P")
plac.nnt.1<-tapply(plac.nnt$Delta, plac.nnt$Delta>=50, length)
length(plac.nnt$Delta)
plac.nnt.1 # TRUE: >=50% reduction in pain intensity
