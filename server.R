
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
data(iris)

FilterIris <- function(inSpecies, inSepalLength, inPetalLength)
{
  # subset data based on input
  data <- subset(iris, Species %in% inSpecies)
  data <- subset(data, Sepal.Length >= inSepalLength[1])
  data <- subset(data, Sepal.Length <= inSepalLength[2])
  data <- subset(data, Petal.Length >= inPetalLength[1])
  data <- subset(data, Petal.Length <= inPetalLength[2])
  
  return(data)
  
}

shinyServer(function(input, output) 
{

  output$SepalWidthPlot <- renderPlot({

    # subset data based on input
    data <- FilterIris(input$Species, input$Sepal.Length, input$Petal.Length)
    
    # draw the histogram 
    hist(data$Sepal.Width, main="Sepal Width", xlab='', n = 10, col=input$color)

  })
  
  output$PetalWidthPlot <- renderPlot({
    
    # subset data based on input
    data <- FilterIris(input$Species, input$Sepal.Length, input$Petal.Length)
    
    # draw the histogram 
    hist(data$Petal.Width, main="Petal Width", xlab='', n = 10, col=input$color)
    
  })  

  output$RecordCount <- renderUI({
    HTML(paste("Number of records (based on filters above):", nrow(FilterIris(input$Species, input$Sepal.Length, input$Petal.Length))))
  })
  

})
