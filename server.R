
library(shiny)

effectiveRate <- function(fvalue, ivalue, fdate, idate) { 
                          d <- as.numeric(fdate)-as.numeric(idate)
                          result <- (fvalue/ivalue)^(365/d)-1
                          return(result)
                                }

NominalRate <- function(fvalue, ivalue, fdate, idate) { 
  d <- as.numeric(fdate)-as.numeric(idate)
  r <- (fvalue/ivalue)^(365/d)
  result <- (r^(1/12)-1)*12
  return(result)
}

shinyServer(
  function(input, output) {
        
    output$days = renderPrint(as.numeric({input$dateRem})-as.numeric({input$dateInc}))
    output$drate = renderPrint(as.numeric({input$id2})/as.numeric({input$id1})-1)   
    output$erate = renderPrint({effectiveRate(input$id2,input$id1,input$dateRem, input$dateInc)})
    output$nrate = renderPrint({NominalRate(input$id2,input$id1,input$dateRem, input$dateInc)})
    
  }
)