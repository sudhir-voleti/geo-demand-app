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
  
  output$distPlot <- renderLeaflet({
      addResourcePath("mytiles", "/mapTiles/Google")
      
      my.locations_df <-  read.csv(input$data$datapath)

      leaflet() %>%
      addTiles(urlTemplate = "/mytiles/{z}_{x}_{y}.png") %>%
      addMarkers(data = my.locations_df , popup = my.locations_df$type,clusterOptions = markerClusterOptions())
  })
  
})
