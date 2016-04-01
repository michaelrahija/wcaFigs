#master
library(maptools)
library(ggplot2)
library(ggmap)

wd = "C:/Users/rahija/Dropbox/ad_hoc_R/wcaFigs"
setwd(wd)


source("R/getPoints.R")
coords <- getPoints()
coords$lat <- as.numeric(as.character(coords$lat))
coords$lon <- as.numeric(as.character(coords$lon))

poly <- read.csv("3403150002003B.csv")

colnames(poly) <- c("lon","lat")


test2 <- get_map(location = c(lon = mean(poly$lon), lat = mean(poly$lat)), zoom = 16)
test3 <- ggmap(test2)


m <- test3 

m <- m + geom_polygon(aes(x=lon, y=lat), size=.5,color='red', data=poly, fill = NA )
m <- m + geom_point(data = coords, aes(x = lon, y = lat, fill = "red", alpha = 0.8), size = 2, shape = 21, color = "red")
m <- m + guides(fill=FALSE, alpha=FALSE, size=FALSE)
m <- m + labs(x = "longitude", y = "latitude", main = "Map of Interviews")

m <- m + ggtitle("EA = Semin: 003B")
#plots[[i]] <- m
print(m)
}