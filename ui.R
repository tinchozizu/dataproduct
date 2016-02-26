
library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Financial Calculator"),
    
  sidebarPanel(
    dateInput('dateInc', 'Inception Date: ',),
    numericInput('id1', 'Initial Investment', 0, min = 0, step = 1),
    dateInput('dateRem', 'Redemption Date: ',),
    numericInput('id2', 'Redemption Value', 0, min = 0, step = 1)
    ),

    mainPanel(
    h3('Investment Result'),
    p('Days of investment'),
    verbatimTextOutput("days"),
    p('Direct Return'),
    verbatimTextOutput("drate"),
    p('Nominal Rate'),
    verbatimTextOutput("nrate"),
    p('Effective Rate'),
    verbatimTextOutput("erate"),
    
    h4('Documentation'),
    p('This is app is very simple and does not require complex documentation. Given a direct rate of return (final value divided initial value minus one) it calculates Effective Rate and Nominal Rate of return in annual terms. Nominal Rate assumes twelve monthly payments. ')
    
    
        
  )
))

