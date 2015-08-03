setwd("/Users/kamermanpr/Dropbox/00 My Documents/Analyses/Natalya - Amitriptyline 2013")
demo<-data.frame(read.csv("demographics.csv", header=T, sep=","))
str(demo)
dim(demo)
demo
demo<-demo[-c(26,100),] # remove dropouts (E026 and E100)
rownames(demo)=NULL
str(demo)
demo
#############
#All Data
#############
#subset data into ARV ARV-naive groups
demo.arv<-subset(demo,demo$ART=="Yes", c(1:10))#ARV group
str(demo.arv)
demo.no<-subset(demo,demo$ART=="No",c(1:10))#ARV naive group
str(demo.no)
##############
#Data analysis
##############
#
####
#Age
####
#Descriptive data
age<-matrix(c(mean(demo$Age),sd(demo$Age),
             mean(demo.arv$Age),sd(demo.arv$Age),
             mean(demo.no$Age),sd(demo.no$Age)),nrow=3,ncol=2, byrow=T)
colnames(age)<-c("Mean", "SD")
rownames(age)<-c("All","ARV","Naive")
age<-as.table(age)
age
#Stats
t.test(demo.arv$Age,demo.no$Age, paired = F, var.equal = T)
####
#Sex
####
#Descriptive data
sex<-matrix(c((tapply(demo$Female, demo$Female=="Yes", length)),(((tapply(demo$Female, demo$Female=="Yes", length))/length(demo$Female))*100),
               (tapply(demo.arv$Female, demo.arv$Female=="Yes", length)),(((tapply(demo.arv$Female, demo.arv$Female=="Yes", length))/length(demo.arv$Female))*100),
                (tapply(demo.no$Female, demo.no$Female=="Yes", length)),(((tapply(demo.no$Female, demo.no$Female=="Yes", length))/length(demo.no$Female))*100)),
            nrow=3, ncol=4, byrow=T)
colnames(sex)<-c("Males", "Females", "% male","% female")
rownames(sex)<-c("All","ARV","Naive")
sex<-as.table(sex)
sex
#Stats
sex.stats<-matrix(c((tapply(demo.arv$Female, demo.arv$Female=="Yes", length)),
                    (tapply(demo.no$Female, demo.no$Female=="Yes", length))),
                  nrow=2, ncol=2, byrow=T)
colnames(sex.stats)<-c("Male", "Female")
rownames(sex.stats)<-c("ARV","Naive")
sex.stats<-as.table(sex.stats)
sex.stats
fisher.test(sex.stats)
######################
#>9 years of education
######################
#Descriptive data
#Include complete cases only
demo1<-demo[complete.cases(demo[,9]),]
str(demo1)
demo1.arv<-demo.arv[complete.cases(demo.arv[,9]),]
str(demo1.arv)
demo1.no<-demo.no[complete.cases(demo.no[,9]),]
str(demo1.no)
edu<-matrix(c((tapply(demo1$Education_.9yrs, demo1$Education_.9yrs=="Yes", length)),(((tapply(demo1$Education_.9yrs, demo1$Education_.9yrs=="Yes", length))/length(demo1$Education_.9yrs))*100),
              (tapply(demo1.arv$Education_.9yrs, demo1.arv$Education_.9yrs=="Yes", length)),(((tapply(demo1.arv$Education_.9yrs, demo1.arv$Education_.9yrs=="Yes", length))/length(demo1.arv$Education_.9yrs))*100),
              (tapply(demo1.no$Education_.9yrs, demo1.no$Education_.9yrs=="Yes", length)),(((tapply(demo1.no$Education_.9yrs, demo1.no$Education_.9yrs=="Yes", length))/length(demo1.no$Education_.9yrs))*100)),
            nrow=3, ncol=4, byrow=T)
colnames(edu)<-c("<9yrs", ">9yrs", "% <9yrs","% >9yrs")
rownames(edu)<-c("All","ARV","Naive")
edu<-as.table(edu)
edu
#stats
edu.stats<-matrix(c((tapply(demo1.arv$Education_.9yrs, demo1.arv$Education_.9yrs=="Yes", length)),
              (tapply(demo1.no$Education_.9yrs, demo1.no$Education_.9yrs=="Yes", length))),
            nrow=2, ncol=2, byrow=T)
colnames(edu.stats)<-c("<9yrs", ">9yrs")
rownames(edu.stats)<-c("ARV","Naive")
edu.stats<-as.table(edu.stats)
edu.stats
fisher.test(edu.stats)
#########
#Employed
#########
#Descriptive data
str(demo)
demo2<-demo[complete.cases(demo[,10]),]
str(demo2)
demo2.arv<-demo.arv[complete.cases(demo.arv[,10]),]
str(demo2.arv)
demo2.no<-demo.no[complete.cases(demo.no[,10]),]
str(demo2.no)
Employ<-matrix(c((tapply(demo2$Employed, demo2$Employed=="Yes", length)),(((tapply(demo2$Employed, demo2$Employed=="Yes", length))/length(demo2$Employed))*100),
              (tapply(demo2.arv$Employed, demo2.arv$Employed=="Yes", length)),(((tapply(demo2.arv$Employed, demo2.arv$Employed=="Yes", length))/length(demo2.arv$Employed))*100),
              (tapply(demo2.no$Employed, demo2.no$Employed=="Yes", length)),(((tapply(demo2.no$Employed, demo2.no$Employed=="Yes", length))/length(demo2.no$Employed))*100)),
            nrow=3, ncol=4, byrow=T)
colnames(Employ)<-c("Unemployed", "Employed", "% Unemployed","% Employed")
rownames(Employ)<-c("All","ARV","Naive")
Employ<-as.table(Employ)
Employ
#Stats
Employ.stats<-matrix(c((tapply(demo2.arv$Employed, demo2.arv$Employed=="Yes", length)),
                    (tapply(demo2.no$Employed, demo2.no$Employed=="Yes", length))),
                  nrow=2, ncol=2, byrow=T)
colnames(Employ.stats)<-c("Unemployed", "Employed")
rownames(Employ.stats)<-c("ARV","Naive")
Employ.stats<-as.table(Employ.stats)
Employ.stats
fisher.test(Employ.stats)
#Alternative way to extract the data from the original table for the stats
# em<-as.vector(Employ)
# em
# em1<-as.table(matrix(c(em[c(2,5,3,6)]),nrow=2, ncol=2, byrow=T))
# em1
# fisher.test(em1)
##########
#CD4 count
##########
#Descriptive data
str(demo)
demo3<-demo[complete.cases(demo[,4]),]
str(demo3)
demo3.arv<-demo.arv[complete.cases(demo.arv[,4]),]
str(demo3.arv)
demo3.no<-demo.no[complete.cases(demo.no[,4]),]
str(demo3.no)
summary(demo3$CD4)
summary(demo3.arv$CD4)
summary(demo3.no$CD4)
#Stats
wilcox.test(demo3.arv$CD4,demo3.no$CD4, paired=FALSE)
########
#D4T use
########
#Descriptive data
str(demo)
demo4<-demo[complete.cases(demo[,6:7]),]
str(demo4)
demo4.arv<-demo.arv[complete.cases(demo.arv[,6:7]),]
str(demo4.arv)
D4T<-matrix(c((tapply(demo.arv$D4T_now, demo.arv$D4T_now=="Yes", length)),(((tapply(demo.arv$D4T_now, demo.arv$D4T_now=="Yes", length))/length(demo.arv$D4T_now))*100),
              (tapply(demo.arv$D4T_ever, demo.arv$D4T_ever=="Yes", length)),(((tapply(demo.arv$D4T_ever, demo.arv$D4T_ever=="Yes", length))/length(demo.arv$D4T_ever))*100)),   
              nrow=2, ncol=4, byrow=T)
colnames(D4T)<-c("No D4T", "D4T", "% No D4T","% D4t")
rownames(D4T)<-c("D4T now","D4T ever")
D4T<-as.table(D4T)
D4T