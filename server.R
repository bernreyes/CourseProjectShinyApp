#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(COUNT)
library(ggplot2)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   

  output$Plot1 <- renderPlot({
      #get the range of age
      minAge <- input$sliderAge[1]
      maxAge <- input$sliderAge[2]
      #filter the data based on the selected information
      aidsdata <- filter(Aids2, state==input$state, age >= minAge & age <= maxAge)
      #tag survived = 1  if status is Alive
      aidsdata$survived <- ifelse(aidsdata$status=="A",1,0)
      #aggregate data by gender to get % of survivors
      aggdata <- aggregate(aidsdata[,c("survived")], list(aidsdata$sex),mean)
      #formatting values and variable
      aggdata$survival.rate <- paste(round(100*aggdata$x, 2), "%", sep="")
      aggdata$Sex <-ifelse(aggdata$Group.1=="F","Female","Male")
      #plot
      gr <- ggplot(data=aggdata, aes(x=Sex, y=x)) +
          geom_bar(stat="identity", fill="steelblue")+
          labs(x="Sex", y="Survival Rate")+
          theme(axis.title.x = element_text(size=15))+
          theme(axis.title.y = element_text(size=15))+
          theme(axis.text= element_text(size=15))+
          geom_text(aes(label=survival.rate), vjust=-0.3, size=5)
          
    gr
  })
  
})
