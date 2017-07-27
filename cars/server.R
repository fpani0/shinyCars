

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # generate bins based on input$bins from ui.R
  model <- lm(dist ~ speed, data = cars)

  modelpred <- reactive({
    speedInput <- input$speed
    predict(model, newdata = data.frame(speed = speedInput))
  })
   
  output$predictionPlot <- renderPlot({

    speedInput <- input$speed
    
    plot(cars$speed, cars$dist, xlab = "Speed of Car (mph)", 
         ylab = "Distanced Stopped (ft)", bty = "n", pch = 16)
    abline(model, col = "red", lwd = 2)
    
    points(speedInput, modelpred(), col = "green", pch = 16, cex =2)
  
  })
  
  output$predictionText <- renderText({
    modelpred()
  })
  
  
})
