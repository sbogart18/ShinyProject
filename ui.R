library(shiny)
shinyUI(fluidPage(

  titlePanel("Standard Normal Probabilities"),
  
  sidebarLayout(
    sidebarPanel(
       sliderInput("limits",
                   "Select lower and upper limits of an interval of standard Normal values.",
                   min = -4.1,
                   max = 4.1,
                   value = c(-2,2),
                   step = 0.1),
       checkboxInput("showArea", "Show Percent Shaded", value = TRUE),
       checkboxInput("showDoc", "Show Documentation", value = TRUE)
    ),
    
    mainPanel(
        
        plotOutput("graph"),
        h3(textOutput("area")),
        h3(textOutput("doc"))
        
    )
  )
))
