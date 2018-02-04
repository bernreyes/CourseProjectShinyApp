#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Survival Rate of AIDS patients in Australia before July 1991"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        helpText("This application compares the survival rate of Male vs Female patients diagnosed with AIDS given the following information:"),
        sliderInput("sliderAge", "Select the range of age (years) at diagnosis:", min = 0, max = 82, value = c(40, 60)),
       selectInput("state", "State of Origin:", choices=list("NSW"="NSW", "QLD"="QLD", "VIC"="VIC","Other"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        h3("Survival Rate of Australian AIDS patients by Gender:"),
        
       plotOutput("Plot1")
    )
  )
))
