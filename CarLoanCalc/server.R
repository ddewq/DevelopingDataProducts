#Auto Loan Calculator for Developing Data Products
#Jan 30, 2017

library(shiny)

shinyServer(function(input, output) { 
  
  output$Text <- renderText({
  Total_Fin <- (input$num - input$num2-input$num3)
  Tax <- Total_Fin*(input$decimal/100)
  Payment <- if(input$decimal2 != 0 && input$Months != 0) {
      ((Total_Fin+Tax)*((input$decimal2/100)/12))/(1-(1+((input$decimal2/100)/12))^(-input$Months)) } 
                else if ((input$decimal2 != 0 && input$Months == 0) || (input$decimal2 == 0 && input$Months == 0))  {
                  (Total_Fin+Tax)
                } else if (input$decimal2 == 0 && input$Months != 0)   {
                  (Total_Fin+Tax)/input$Months
                }
  paste("Monthly Payment for",input$Months, "months", "with rate of", input$decimal2, "%:",sprintf("$ %3.2f", Payment) )
  })
  
  output$Text2 <- renderText({
    Total_Fin <- (input$num - input$num2-input$num3)
    Tax <- Total_Fin*(input$decimal/100)
    Payment_12Less <- if(input$decimal2 != 0 && input$Months != 0) {
      ((Total_Fin+Tax)*((input$decimal2/100)/12))/(1-(1+((input$decimal2/100)/12))^(-(input$Months-12))) } 
    else if ((input$decimal2 != 0 && input$Months == 0) || (input$decimal2 == 0 && input$Months == 0))  {
      (Total_Fin+Tax)
    } else if (input$decimal2 == 0 && input$Months != 0)   {
      (Total_Fin+Tax)/(input$Months-12)
    }
    paste("Monthly Payment if term is only", input$Months-12, "months:", sprintf("$ %3.2f", Payment_12Less) )
  })
  
  output$Text3 <- renderText({
    Total_Fin <- (input$num - input$num2-input$num3)
    Tax <- Total_Fin*(input$decimal/100)
    Payment_12Less <- if(input$decimal2 >=1 && input$Months != 0) {
      ((Total_Fin+Tax)*(((input$decimal2-1)/100)/12))/(1-(1+(((input$decimal2-1)/100)/12))^(-(input$Months))) } 
    else if ((input$decimal2 != 0 && input$Months == 0) || (input$decimal2 == 0 && input$Months == 0))  {
      (Total_Fin+Tax)
    } else if (input$decimal2 >= 0 && input$decimal2 <= 1 && input$Months != 0)   {
      (Total_Fin+Tax)/(input$Months)
    } 
    if( input$decimal2 <= 1) {
      paste("Monthly Payment if Interest Rate with 0% interest is", sprintf("$ %3.2f", Payment_12Less) )
    } else {
      paste("Monthly Payment if Interest Rate is", input$decimal2-1, "%:", sprintf("$ %3.2f", Payment_12Less) )
    }
  })
  


})

