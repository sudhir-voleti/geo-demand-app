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
      my.locations_df <-  read.csv(input$data$datapath)
      
      data_city <- my.locations_df %>% filter(city == input$city)
      data_filtered <- data_city %>% filter(type %in% c(input$entities))
      
      leaflet() %>%
      addTiles() %>%
      #addMarkers(data = my.locations_df , popup = my.locations_df$type,clusterOptions = markerClusterOptions())
      addMarkers(data = data_filtered , popup = data_filtered$type,clusterOptions = markerClusterOptions())
  })
  
})
