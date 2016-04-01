#get points
library(maptools)
library(XML)
library(plyr)

getPoints <- function(dir = "C:/Users/rahija/Dropbox/ad_hoc_R/wcaFigs"){
  
  
  #get data
  data.dir  = dir
  kml <- "points.kml"
  
  wd = "C:/Users/rahija/Dropbox/ad_hoc_R/wcaFigs"
  setwd(wd)
  
  #read kml file as text 
  kml.text <- readLines(kml)
  
  test <- grep("coordinates", kml.text)
  
  coords <- kml.text[test]
  
  coords <- gsub(" + <coordinates>","",coords)
  coords <- gsub("</coordinates>","",coords)
  coords <- gsub(",0.0","",coords)
  
  coords <- strsplit(coords, ",")
  
  coords.t <- unlist(coords)
  
  index <- seq(length(coords.t))
  
  lon <- coords.t[index %% 2 == 1]
  lat <- coords.t[index %% 2 == 0]

  master <- as.data.frame(cbind(lon, lat))    
  
master


}