#initialize
library(shiny)
library(ggplot2)


#housing data
setwd("C://Users//Greg")
housing = read.csv("housing.csv")
head(housing)
summary(housing)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("1990 California Housing Price Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
      # Sidebar with 2 select inputs and a numeric input
      sidebarPanel(
        selectInput('xCol', 'X', names(housing)),
        selectInput('yCol', 'Y', names(housing))),
      
      # Shows the plot
      mainPanel(plotOutput('plot'))
    ))
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )


# server side setup
server <- function(input, output, session) {
  # Get the data from the variables declared on the ui.R file
  df <- reactive({housing[, c(input$xCol, input$yCol)]})
  
  # Create the plot
  output$plot <- renderPlot({plot(df(), pch = 20, cex = 3, col = "blue",
                                  main = "1990 California Housing Price dataset")})
}

# Run the application 
shinyApp(ui = ui, server = server)


