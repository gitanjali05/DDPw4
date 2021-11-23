#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

library(htmlwidgets)
shinyServer(function(input, output) {
    values <- reactiveValues()
    # Calculating    
    observe({
        input$action_Calc
        if(input$Operators=='+')
        {
            values$calculator <- isolate({
                input$num1+input$num2
            })
        }
        else if(input$Operators=='-')
        {
            values$calculator <- isolate({
                input$num1-input$num2
            })
        }
        else if(input$Operators=='*')
        {
            values$calculator <- isolate({
                input$num1*input$num2
            })
        }
        else 
        {
            values$calculator <- isolate({
                input$num1/input$num2
            })
        }
        
    })
    
    # Display values entered
    output$num1 <- renderText({
        input$action_Calc
        paste("Number 1: ", isolate(input$num1))
    })
    
    output$num2 <- renderText({
        input$action_Calc
        paste("Number 2: ", isolate(input$num2))
    })
    
    
    output$Answer <- renderText({
        paste("The Answer Is:", values$calculator)
    })
    
})