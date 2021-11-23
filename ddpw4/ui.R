#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Two Number Calculator"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            helpText("Enter your equation"),  
            selectInput("Operators","Select the operator", c("+","-","*","/")),
            numericInput("num1", label = h6("Enter the first number"),min = 1, value = NULL),
            numericInput("num2", label = h6("Enter the second number"),min = 1, value = NULL),
            actionButton("action_Calc", label = "CALCULATE")        
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Calculator",
                         p(h5("")), textOutput("num1"),
                         textOutput("num2"),  p(h5("Calculator")),
                         textOutput("Answer")
                ),
                tabPanel("Operators",
                         p(h4("Simple Interest Calculator:")),
                         helpText("Only Simple Operators"),
                         HTML("
  
                      <b> + </b> = Adds the two numbers <br>
                      <br> </br>
                      <b> - </b> = Subtracts the two numbers <br>
                      <br> </br>
                      <b> * </b> = Multiplies the two numbers <br>
                      <br> </br>
                      <b> / </b> = Divides the two numbers <br>
                      <br> </br>
                      ")                
                )
            )
        )
    )
))