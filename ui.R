#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      fileInput("data","Choose the geospatial data",multiple = FALSE,accept = c("text/csv",
                                                                                "text/comma-separated-values,text/plain",
                                                                                ".csv"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  
                  tabPanel("Overview"),
                  
                  tabPanel("Leaflet",
                           leafletOutput("distPlot"))
                  
      )
    )
  )
))
