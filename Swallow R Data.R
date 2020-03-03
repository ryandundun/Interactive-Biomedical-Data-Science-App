library(tidyverse)

Swallowing_Durations <- read_csv("~/BDS Internship/Swallowing Durations.csv")
Swallowing_Durations <- read_csv("~/BDS Internship/Swallowing Durations.csv", na=c("NA","NV","NR","n"))

swl=Swallowing_Durations
swl=NULL
swl[4]= NULL
swl[27:33]=NULL
swl[2:4]=NULL
swl[1,1]
colnames(swl)[22]="CPclosed"
swl[4]
swl[6]
swl[7]
swl[8]
swl2=swl
swl[9]
swl[22]=swl2[23]-swl2[7]
swl[23]
swl[18]
#swl is the Timed Movements (column titles have no space)
#swl2 is the Original Data set minus Columns 2-4 and 27-33
#Swallowing_Durations is the Original Data set

library(tidyverse)
write.tidyverse(swl, "c:/swl.xlsx")

#install.packages("xlsx")
library(xlsx)



TimingMiss=swl
TimingMiss
MissingTimedData=filter(TimingMiss, is.na(TimingMiss$FirstBolusMove) | is.na(TimingMiss$BeginPosteriorMove) | is.na(TimingMiss$HeadEnterPharynx) | is.na(TimingMiss$EnterTailPharynx) | is.na(TimingMiss$BeginLVC) | is.na(TimingMiss$EndLVC) | is.na(TimingMiss$BeginMaxElevation) | is.na(TimingMiss$FirstMaxElevation) | is.na(TimingMiss$LastMaxElevation) | is.na(TimingMiss$FirstMaxAnterior) | is.na(TimingMiss$LastMaxAnterior) | is.na(TimingMiss$ReturnToRest) | is.na(TimingMiss$CPopen) | is.na(TimingMiss$HeadIntoCP) | is.na(TimingMiss$TailIntoCP) | is.na(TimingMiss$CPclosed))
filter(TimingMiss, is.na(FirstBolusMove)==TRUE)
filter(TimingMiss, is.na(TimingMiss)==TRUE)
filter(TimingMiss, is.na(TimingMiss$FirstBolusMove))
try=MissingTimedData

#TimingMiss is a copy of swl
#MissingTimedData is a data set of rows in swl with atleast one NA in any column 
#try is duplicate of MissingTimedData
write.csv(try, file="try.csv",row.names=FALSE)

negative=swl
NegativeTimes=filter(negative, TimingMiss$FirstBolusMove<=0 | TimingMiss$BeginPosteriorMove<=0 | TimingMiss$HeadEnterPharynx<=0 | TimingMiss$EnterTailPharynx<=0 | TimingMiss$BeginLVC<=0 | TimingMiss$EndLVC<=0 | TimingMiss$BeginMaxElevation<=0 | TimingMiss$FirstMaxElevation<=0 | TimingMiss$LastMaxElevation<=0 | TimingMiss$FirstMaxAnterior<=0 | TimingMiss$LastMaxAnterior<=0 | TimingMiss$ReturnToRest<=0 | TimingMiss$CPopen<=0 | TimingMiss$HeadIntoCP<=0 | TimingMiss$TailIntoCP<=0 | TimingMiss$CPclosed<=0)
filter(negative, TimingMiss$FirstBolusMove<=0)

#NegativeTimes has negative numbers for any column in the swl data set

write.csv(NegativeTimes, file="NegativeTimes.csv", row.names=FALSE)
