
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
data(iris)


shinyUI(fluidPage(

  # Hide Errors...
  tags$style(type="text/css",".shiny-output-error { visibility: hidden; }",".shiny-output-error:before { visibility: hidden; }"), 
    
  # Application title
  titlePanel("Iris Sepal and Petal Widths"),
  
  helpText("Filter the iris dataset using the widgets below to discover the width distributions of the sepals and petals."),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("Species",
                  "Choose Iris Species:",
                  selected = levels(iris$Species),
                  choice = levels(iris$Species),
                  multiple = TRUE,
                  selectize = FALSE),
      
      sliderInput("Sepal.Length",
                  "Choose Sepal Length Range:",
                  min = min(iris$Sepal.Length),
                  max = max(iris$Sepal.Length),
                  value = c(mean(iris$Sepal.Length)-1, mean(iris$Sepal.Length) + 1),
                  step = 0.1),
      
      sliderInput("Petal.Length",
                  "Choose Petal Length Range:",
                  min = min(iris$Petal.Length),
                  max = max(iris$Petal.Length),
                  value = c(mean(iris$Petal.Length)-1, mean(iris$Petal.Length) + 1),
                  step = 0.1),
      
      selectInput("color", 
                  label = "Choose histogram color:", 
                  choices = c("white","red","blue","green","yellow","purple","pink")
                  ),      
      
      
      htmlOutput("RecordCount"),
      
      helpText("Note: Graphs will not appear when the filters result in 0 records.")
      
      ),

    # Show a plot of the generated distribution
    mainPanel(

      plotOutput("SepalWidthPlot"),
      plotOutput("PetalWidthPlot")
    )
  )
))
