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
  titlePanel("Geospatial analysis"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("city","Choose the city",c("Hyderabad"="Hyderabad",
                                           "Delhi" = "Delhi",
                                           "Bangalore" = "Bangalore",
                                           "Chennai" = "Chennai",
                                           "Mumbai" = "Mumbai",
                                           "Kolkata" = "Kolkata"),selected = "Hyderabad"),
      
      checkboxGroupInput("entities","Select the entites for analysis",c("Mall"="Mall",
                                                                        "Restaurant"="Restaurant",
                                                                        "Hospital"="Hospital",
                                                                        "School"="School",
                                                                        "Bank"="Bank"),selected = "Mall")
      
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  
                  tabPanel("Overview",
                           h4("How to use this Shiny application"),
                           p("This application lets you visualize the clusters of entities selected in a city. You can select one or multiple entities from the checkbox for a given city in the dropdown."),
                           p("For best experience open this application in Google Chrome.")
                           ),
                  
                  tabPanel("Leaflet",
                           tags$style(type = "text/css", "#distPlot {height: calc(100vh - 150px) !important;}"),
                           leafletOutput("distPlot"))
                  
      )
    )
  )
))
