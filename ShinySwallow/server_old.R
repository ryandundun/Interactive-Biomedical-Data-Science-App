#server.R for internship project

shinyServer(function(input, output) {
  
  
  output$text1 <- renderText({ 
    paste("Data from Subj ID:", input$SubjID)
})
  output$text2 <- renderText({ 
    paste(input$Time1, "-", input$Time2)
  })
  
   output$plot <- renderPlot({
        tmp<-subset(newdata,SubjID==input$SubjID)

        #   tmp$el=paste(timed[23],sep=",")
        #   swallow_V027$el=paste(swallow_V027$BolusType, swallow_V027$BolusSize,sep=",")

        ggplot(tmp, aes(x=(tmp[input$Time_2]-tmp[input$Time_1])/30, y=0,color=BolusSizeType))+
          #  geom_dotplot() + x('')  +
          geom_point(cex=5,position=position_jitter(height=0.1,width=0)) +
          #xlim=c(0,6) +
          facet_grid(Period~., drop=FALSE) +
          scale_y_continuous(NULL,breaks=NULL,limits=c(-1,1)) +
          #      scale_x_continuous(paste(input$Time_2,"-",input$Time_1,"(s)"),limits=range(newtimed2[input$Time_2]-newtimed2[input$Time_1],na.rm=TRUE)/30) +
          scale_x_continuous(paste(input$Time_2,"-",input$Time_1,"(s)"),limits=c(max(-1.5,min(newdata[input$Time_2]-newdata[input$Time_1],na.rm=TRUE)/30),1.5)) +
          scale_color_discrete(breaks=levels(newdata$BolusSizeType),drop=FALSE)
})
        
output$swallowtable <- renderTable(tmp)
})