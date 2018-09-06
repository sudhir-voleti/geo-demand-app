## Resolve dependecies

if (!require(shiny)){install.packages("shiny")}
if (!require(RgoogleMaps)){install.packages("RgoogleMaps")}
if (!require(leaflet)){install.packages("leaflet")}
if (!require(dplyr)){install.packages("dplyr")}

library(dplyr)
library(shiny)
library(leaflet)
library(RgoogleMaps)
