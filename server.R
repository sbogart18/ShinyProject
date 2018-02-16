library(shiny)

shinyServer(function(input, output) {
    
    output$area <- renderText({ifelse(input$showArea,
                                      paste0("About ", 
                                             round(100*(pnorm(input$limits[2]) - pnorm(input$limits[1])),2), 
                                        "% of random standard Normal values are between ", input$limits[1], 
                                        " and ", input$limits[2], "."),
                              "")})                      
    
    doc <- "App calculates the probability a random standard Normal value will be between two limits specified with 
    the slider, which is the shaded area under the standard Normal curve shown above.  
    The result is expressed as a percentage, the percent of the total area under the Normal curve that is shaded."
    
    output$doc <- renderText(ifelse(input$showDoc, doc, ""))
    
    output$graph <- renderPlot({
        lo <- input$limits[1]
        hi <- input$limits[2]
        zvals <- seq(-4.1, 4.1, length = 1000)
        plot(zvals, dnorm(zvals), 
             type = "l", lwd = 3, frame = FALSE, xlab = "Z", xaxt = "n", yaxt = "n", ylab = "")
        axis(1, at = seq(-4, 4, 1))
        lines(c(lo, lo), 
              c(0, dnorm(lo)), col = "royalblue", lwd = 5)
        lines(c(hi, hi), 
              c(0, dnorm(hi)), col = "royalblue", lwd = 5)
        polygon(
            c(lo, seq(lo, hi, 0.01), hi),
            c(0, dnorm(seq(lo, hi, 0.01)), 0),
            col = "orange")
        
        })
    
})
