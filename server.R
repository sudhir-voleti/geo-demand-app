#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  api="https://maps.googleapis.com/maps/api/js?key=AIzaSyBk1iNGBRPz1DQuKwtKzSwRFHckK996YPw"
  
  output$distPlot <- renderLeaflet({
      addResourcePath("mytiles", "C:/Users/31153/Documents/mapTiles/Google")
      
      my.locations_df <-  read.csv(input$data$datapath)

      leaflet() %>%
      addTiles() %>%
      addMarkers(data = my.locations_df , popup = my.locations_df$type,clusterOptions = markerClusterOptions())
  })
  
})
