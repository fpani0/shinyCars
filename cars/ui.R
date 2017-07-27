#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# This interface shows the prediction of a car stopped (in ft) travelling that is stopping at certain speeds (in mpg).
# The data set is already part R by default and is used in a demonstration of shiny.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a a plot and renders text
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Stopping distances predicted by speed of car"),
  
  # Sidebar with a slider input for speed of car
  sidebarLayout(
    sidebarPanel(
      
      tabsetPanel(type="tabs",
        tabPanel("About", br(), "This application shows the prediction of how far it will take a car to stop (in ft) after applying its brakes at a certain speed (mpg).", p(), "The data set is already part R by default and is used in a demonstration of shiny.  Please click on the tab above Graph to run the application.", p(), "More information can be found here http://"),
        tabPanel("Graph", br(), 
          sliderInput("speed",
                      "Select the speed the car will stop at:",
                       min = 4,
                       max = 25,
                       value = 15)
          )
      
      )
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("predictionPlot"),
       h3("The predicted distance in feet the car will stop is:"),
       textOutput("predictionText")
    )
  )
))
