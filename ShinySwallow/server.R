#server.R for internship project

library(tidyverse)
library(RColorBrewer)

Swallowing_Durations <- readRDS("data/Swallowing_Durations.rds")

cols<-brewer.pal(12,"Paired")[seq(2,12,by=2)]
levels(Swallowing_Durations$Period)= c("Baseline","Four-Week","Eight-Week")
Swallowing_Durations$BolusSize <- factor(Swallowing_Durations$BolusSize)
Swallowing_Durations$BolusType <- factor(Swallowing_Durations$BolusType)
levels(Swallowing_Durations$BolusSize) <- c("1/2 Tsp","Tsp","Sip","Chug","Bite","Pill")
levels(Swallowing_Durations$BolusType) <- c("Thin","Nectar","Honey","Puree","Solid","Pill")
levels(Swallowing_Durations$BolusSizeType)[8]<-NA

shinyServer(function(input, output) {
  
   output$plot <- renderPlot({
     Swallowing_Durations$Duration <- (Swallowing_Durations[[input$Time_2]]-Swallowing_Durations[[input$Time_1]])/30
     m<-median(Swallowing_Durations$Duration,na.rm=TRUE)
     r<-IQR(Swallowing_Durations$Duration,na.rm=TRUE)
     
     tmp<-Swallowing_Durations%>%filter(SubjID==input$SubjID)
     
     ggplot(tmp,aes(x=pmax(m-input$mult*r,pmin(m+input$mult*r,Duration)),y=-BolusNo,color=BolusSizeType,size=BolusSizeType,shape=BolusSizeType))+
       geom_point()+
       scale_x_continuous("Duration (s) \n \n Axis Limits=Median +/- Multiplier*IQR",limits=m+c(-1,1)*input$mult*r)+facet_grid(Period~.,drop=FALSE)+
       scale_y_continuous("",breaks=NULL,limits=range(-Swallowing_Durations$BolusNo))+
       scale_color_manual("",values=c("1.1"=cols[1],"2.1"=cols[1],"3.1"=cols[1],"4.1"=cols[1],
                                      "2.2"=cols[2],"3.2"=cols[2],"4.2"=cols[2],
                                      "1.3"=cols[3],"2.3"=cols[3],"3.3"=cols[3],"4.3"=cols[3],
                                      "1.4"=cols[4],"2.4"=cols[4],
                                      "5.5"=cols[5],
                                      "6.6"=cols[6]),
                          labels=c("1/2 Tsp Thin","Tsp Thin","Sip Thin","Chug Thin",
                                   "Tsp Nectar","Sip Nectar","Chug Nectar", 
                                   "1/2 Tsp Honey","Tsp Honey","Sip Honey", "Chug Honey",
                                   "1/2 Tsp Puree", "Tsp Puree","Solid","Pill"),
                          drop=FALSE,guide=guide_legend(ncol=1,label.position="right"))+
       scale_size_manual("",values=c("1.1"=2,"2.1"=3,"3.1"=4,"4.1"=5,
                                     "2.2"=3,"3.2"=4,"4.2"=5,
                                     "1.3"=2,"2.3"=3,"3.3"=4,"4.3"=5,
                                     "1.4"=2,"2.4"=3,
                                     "5.5"=3,
                                     "6.6"=3),
                         labels=c("1/2 Tsp Thin","Tsp Thin","Sip Thin","Chug Thin",
                                  "Tsp Nectar","Sip Nectar","Chug Nectar", 
                                  "1/2 Tsp Honey","Tsp Honey","Sip Honey", "Chug Honey",
                                  "1/2 Tsp Puree", "Tsp Puree","Solid","Pill"),drop=FALSE)+
       scale_shape_manual("",values=c("1.1"=16,"2.1"=16,"3.1"=16,"4.1"=16,
                                      "2.2"=16,"3.2"=16,"4.2"=16,
                                      "1.3"=16,"2.3"=16,"3.3"=16,"4.3"=16,
                                      "1.4"=16,"2.4"=16,
                                      "5.5"=15,
                                      "6.6"=17),
                          labels=c("1/2 Tsp Thin","Tsp Thin","Sip Thin","Chug Thin",
                                   "Tsp Nectar","Sip Nectar","Chug Nectar", 
                                   "1/2 Tsp Honey","Tsp Honey","Sip Honey", "Chug Honey",
                                   "1/2 Tsp Puree", "Tsp Puree","Solid","Pill"),drop=FALSE)+
       theme_bw()+theme(legend.position="right",legend.direction="vertical")
   })
        
output$swallowtable1 <- renderTable({
  Swallowing_Durations$Duration <- (Swallowing_Durations[[input$Time_2]]-Swallowing_Durations[[input$Time_1]])/30

  tmp<-Swallowing_Durations%>%filter(SubjID==input$SubjID,Period=="Baseline")
  
  tmp[c("BolusSize","BolusType","Duration")]
  })
output$swallowtable2 <- renderTable({
  Swallowing_Durations$Duration <- (Swallowing_Durations[[input$Time_2]]-Swallowing_Durations[[input$Time_1]])/30
  
  tmp<-Swallowing_Durations%>%filter(SubjID==input$SubjID,Period=="Four-Week")
  
  tmp[c("BolusSize","BolusType","Duration")]
})
output$swallowtable3 <- renderTable({
  Swallowing_Durations$Duration <- (Swallowing_Durations[[input$Time_2]]-Swallowing_Durations[[input$Time_1]])/30
  
  tmp<-Swallowing_Durations%>%filter(SubjID==input$SubjID,Period=="Eight-Week")
  
  tmp[c("BolusSize","BolusType","Duration")]
})

})