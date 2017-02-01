#Auto Loan Calculator for Developing Data Products
#Jan 30, 2017

library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Auto Loan Calculator"),
  
  # Sidebar with input for calculations 
  sidebarLayout(
    sidebarPanel(
      numericInput("num", 
                   label = "Price of Vehicle", 
                   value = 10000),
      numericInput("num2", 
                   label = ("Trade-in Value"), 
                   value = 0),
      numericInput("num3", 
                   label = ("Down Payment"), 
                   value = 0,
                   min = 0),
      sliderInput("decimal",
                  "Tax %:",
                  min = 0,
                  max = 20,
                  value = 6,
                  step = 0.01),
      sliderInput("decimal2",
                   "Interest Rate:",
                   min = 0,
                   max = 20,
                   value = 2.25,
                   step = 0.01),
       sliderInput("Months",
                   "Months:",
                   min = 0,
                   max = 84,
                   value = 36)

    ),
    
    
    mainPanel(
      h4(p("This app acts as a calculator to help determine the monthly payment for an Auto loan. To use this app,")),
      h4(tags$ol(
        tags$li("Enter the price of the vehicle"), 
        tags$li("If you are trading in a vehicle, enter in the value of your trade-in"), 
        tags$li("If you have a down payment, enter the amount"),
        tags$li("Adjust the slider to change the tax rate for your area"),
        tags$li("Adjust the slider to change the interest rate of the loan"),
        tags$li("Adjust the slider to change the number of months for the length of the loan")
      )),
      tags$br(),
      tags$br(),
      h3(strong(textOutput("Text"))),
      tags$br(),
      h3("Comparisons"),
      h3(textOutput("Text2"),
      h3(textOutput("Text3"))   )
    )
  )
))
