library(BIEN)
library(leaflet)
library(dplyr)
library(tmap)
library(raster)
library(sf)
library(sp)
library(ggplot2)
library(maps)
library(mapview)
library(mapproj)
library(rgeos)
library(car)

#####
vignette("BIEN")
vignette("tmap-getstarted")
vignette("Raster")
vignette("leaflet")


#######

##### Selecting species lists for California for later joining-----------------------------------------------------

usList <- BIEN_list_country(country = "United States")



###### Downloading all flowering species data, begin date and duration, for species in California ---------------------------------------------

trait_obs <-BIEN_trait_traits_per_species() 
flower_counts <-trait_obs %>% filter(trait_name == c("plant flowering duration", "plant flowering begin"))


#filtering for the most prominent species, top 5 species with the most bloom beginning data and bloom duration data)[done manually, despicable I know]
#calCounts <- merge(flower_counts, caList, by = intersect("scrubbed_species_binomial","scrubbed_species_binomial"))
mostPopularSpeciesBeginning <- c("Acer saccharinum", "Prunus americana", "Taraxacum officinale", "Shepherdia argentea")
#mostPopularSpeciesDuration <- c("Diospyros lycioides", "Dodonaea viscosa", "Prunus armeniaca")
)

#Filtering by flowering start and duration data
FloraBloomStart <- BIEN_trait_traitbyspecies(mostPopularSpeciesBeginning,  "plant flowering begin") 
#FloraBloomDuration <- BIEN_trait_traitbyspecies(mostPopularSpeciesDuration, "plant flowering duration" ) 

FloraBloomStart
#FloraBloomDuration


#### plotting the frequency of bloom occurences vs months and data analysis -> making figures -----------------------------------------------------------------------
    #figure keeps looking bad
bienBlooms <- BIEN_trait_traitbyspecies(usList$scrubbed_species_binomial,"plant flowering begin")
bienBlooms %>% add_count(scrubbed_species_binomial)
hist(as.numeric(bienBlooms$trait_value), bienBooms$scrubbed_species_binomial, xlab = "", ylab = "")  #[WIP]

plot(bienBlooms$id, bienBlooms$trait_value, xlab = "Species ID", ylab = "Bloom Month", main = "Flowering Distributions Throughout the Year")


#### Downloaded range maps and getting species data and then plotting!  ------------------------------------------
floraRangeBloom <- BIEN_ranges_load_species(mostPopularSpeciesBeginning) 


#floraRangeDuration <- BIEN_ranges_load_species(mostPopularSpeciesDuration)


#colorBloomStart <- c("red","green","yellow", "orange", "blue")[FloraBloomStart$scrubbed_species_binomial] 

tmap_mode("plot")
tmap_mode("view")
floraRangeBegin <-  tm_shape(floraRangeBloom) + tm_polygons(alpha = 0.8)  + tm_fill(palette = "Accent") + tm_layout(title = "Occurrences of Flowering Perennials in NA", legend.show = "TRUE", frame = TRUE)  + tm_basemap()
  #+tm_view(view.legend.position = c("LEFT", "BOTTOM")) #attempted to add a legend to no avail

leaflet("World") 

floraRangeBegin
class(floraRange)

#coverting new tmap into a raster restricted to contintental NA then comparing the bloom data with climate data
annualFlowering <- rasterize(floraRangeBloom, meanTempAnnual)
USPrecipBlooms <- tm_shape(annualFlowering) + tm_raster(alpha = 1, title = "Species") +  tm_shape(precipAnnual) + tm_raster(alpha = 0.6, title = "Mean Precipitation 30 year normal") + tm_basemap() 
 #attempt to added legend positions and accurate titles      # , view.legend.position = c("LEFT", "BOTTOM"), main = "Species"  ... , view.legend.position = c("LEFT", "BOTTOM"), main = "Annual Temperatures"
tmap_mode("plot")
USPrecipBlooms

USTempBlooms <- tm_shape(annualFlowering) + tm_raster(alpha = 1, title = "Species") + tm_shape(meanTempAnnual) + tm_raster(alpha = 0.6, title = "Mean Temperature 30 year normal") + tm_basemap()
USTempBlooms




#MayUSBlooms <- tm_shape(annualFlowering) + tm_raster(alpha = 1) + tm_shape(precipMay) + tm_raster(alpha = 0.3) + tm_shape(tempMay) + tm_raster(alpha = 0.4) + tm_basemap()  
#MayUSBlooms

#JuneUSBlooms <- tm_shape(annualFlowering) + tm_raster(alpha  =1) + tm_shape(precipJune) + tm_raster(alpha = 0.3) + tm_shape(tempJune) + tm_raster(alpha = 0.4) + tm_basemap()
#JuneUSBlooms
#scrapping duration analysis for now, not enough data recorded in BIEN with correlating range map for flowering durations
#floraRangeDuration <- tm_shape(floraRangeDuration) + tm_polygons("MAP_COLORS", alpha = 0.2) + tm_layout(title = "Highest Occurences of Flowering Duration Data in Continental US") + tm_basemap()  
                      
#floraRangeDuration

#next step maybe mapping the above two together

#attempting to map climate rasters vs flowering range and distributions
precipDuration <- plot(precipAnnual, aes(floraRangeD)) + geom_polygon()
precipDuration

#######filtering by greatest occurrences of flowering [Interetesting findings, may include in discussions but too much datat to spatially analyze reasonably] -------------------------------------------------------
mayBlooms <- filter(CalFlora, trait_value.x == 5)
mayRange <- BIEN_ranges_load_species(mayBlooms$scrubbed_species_binomial)  

tm_shape(mayRange) + tm_polygons() + tm_basemap()

aprilBlooms <- filter(CalFlora, trait_value.x == 4)
aprilRange <- BIEN_ranges_load_species(aprilBlooms$scrubbed_species_binomial) 


juneBlooms <- filter(CalFlora, trait_value.x == 6)
juneRange <- BIEN_ranges_load_species(juneBlooms$scrubbed_species_binomial)
  




#########plotting distributions [Utilized a different method]-----------------------------------------------------



tmap_mode("view")

plot(floraRange)

FloraDistribution <-  tm_shape(floraRange)  + tm_polygons() +tm_fill(col = "MAP_COLORS") + tm_borders() + tm_basemap()

convertedRange <- st_as_sf(floraRange)
FloraDistribution

convertedRange 



#lets try isolating the different polygons in the seasonal bloom data next time!
  #another idea would be to generate centroids or dot representations for each spatial polygon using a for loop and mutate

 #max.count(floraRange@data$species)

 #FloweringPoints <- gCentroid(floraRange, byid = TRUE)
  #  plot(FloweringPoints)
  #attempt <- tm_shape(floraRange) + tm_polygons() + tm_fill() + tm_dots(FloweringPoints) + tm_basemap()
  #attempt

 floweringStartCentroids <- gCentroid(floraRangeB, byid = TRUE)
 
 
 
  ######## PRISM climate raster data, annual data + data for months 4-6 as they have the vast majority of bloom dates


#precipJanuary <- raster("Z:/Project/PRISM_ppt_30yr_normal_4kmM2_all_bil/PRISM_ppt_30yr_normal_4kmM2_01_bil.bil")
#plot(precipJanuary)

precipAnnual <- raster("Z:/Project/PRISM_ppt_30yr_normal_4kmM2_all_bil/PRISM_ppt_30yr_normal_4kmM2_annual_bil.bil")
plot(precipAnnual)

precipApril <- raster("Z:/Project/PRISM_ppt_30yr_normal_4kmM2_all_bil/PRISM_ppt_30yr_normal_4kmM2_04_bil.bil")
plot(precipApril)
  
precipMay <- raster("Z:/Project/PRISM_ppt_30yr_normal_4kmM2_all_bil/PRISM_ppt_30yr_normal_4kmM2_05_bil.bil")
plot(precipMay)

precipJune <- raster("Z:/Project/PRISM_ppt_30yr_normal_4kmM2_all_bil/PRISM_ppt_30yr_normal_4kmM2_06_bil.bil")
plot(precipJune)

meanTempAnnual <- raster("Z:/Project/PRISM_tmean_30yr_normal_4kmM2_all_bil/PRISM_tmean_30yr_normal_4kmM2_annual_bil.bil")
plot(meanTempAnnual)

tempApril <- raster("Z:/Project/PRISM_tmean_30yr_normal_4kmM2_all_bil/PRISM_tmean_30yr_normal_4kmM2_04_bil.bil")
plot(tempApril)

tempMay <- raster("Z:/Project/PRISM_tmean_30yr_normal_4kmM2_all_bil/PRISM_tmean_30yr_normal_4kmM2_05_bil.bil")
plot(tempMay)

tempJune <- raster("Z:/Project/PRISM_tmean_30yr_normal_4kmM2_all_bil/PRISM_tmean_30yr_normal_4kmM2_06_bil.bil")
plot(tempJune)

##### Rasterize then plot! --------------------------------------------------------------------------------------

tmap_mode("view")
floweringMayT <- rasterize(mayRange, tempMay)
floweringMayP <- rasterize(mayRange, precipMay)

plot(floweringMayT)
plot(floweringMayP)


#####Rasterizing bloom data range maps according to the climate data during their monthly bloom

floweringApril <- rasterize(floraRangeBloom, tempApril)
plot(floweringApril)

floweringMay <- rasterize(floraRangeBloom, tempMay)
plot(floweringMay)

floweringJune <- rasterize(floraRangeBloom, tempJune)
plot(floweringJune)

annualFlowering <- rasterize(floraRangeBloom, meanTempAnnual)
plot(annualFlowering)

layout(matrix(1:6, nrow = 3, ncol = 2, byrow = TRUE) 
plot(tempApril, main = "April Temp", cex = 0.25, axes = FALSE, box = FALSE) 
plot(precipApril, main = "April Precip", cex = 0.25, axes= FALSE, box = FALSE)
plot(tempMay, main = "May Temp", cex = 0.25, axes = FALSE, box = FALSE)
plot(precipMay, main = "May Precip",  cex = 0.25, axes= FALSE, box = FALSE)
plot(tempJune, main = "June Temp", cex = 0.25, axes = FALSE, box = FALSE)
plot(precipJune, main = "June Precip", cex = 0.25, axes= FALSE, box = FALSE )




layout(matrix(1:2, nrow = 2, ncol = 1, byrow = TRUE))
plot(precipAnnual, main = "Annual Precipitation", axes = FALSE, box = FALSE)
plot(meanTempAnnual, main = "Annual Temperature", axes = FALSE, box = FALSE)



plot(annualFlowering)


### Thinking about using leaflet for interactive mapping maybe ------------------------------------------
leaflet("UnitedStates")

###SCRAPPED--------------------------------------------------------




#CA <- BIEN_occurrence_state(country = "United States")


#### Cleaning the BIEN data to only California and merging trait tables to include only Flowering date and duration and then downloading the range map of each included species
#BIEN_trait_traitbyspecies [FAILED] found a more efficient function!

#traits <- BIEN_trait_list()

#allTraits <- BIEN_trait_traits_per_species()
#allTraits

#FloweringCA <- merge(CA, allTraits, by = intersect("scrubbed_species_binomial","scrubbed_species_binomial")) %>% filter(trait_name == c("plant flowering duration", "plant flowering begin"
#))

#TraitsCA <- BIEN_trait_species(CA$scrubbed_species_binomial)

##### Merging begin flowering date and duration based on species name  [unecessary]-----------------------------------------------------
#CalFlora <- merge(CalFloraBloomStart, CalFloraBloomDuration, "scrubbed_species_binomial")

#monthBlooms <- count(CalFlora, trait_value.x)
#sum(monthBlooms$n) #vast majority of plants bloom in April and May
#max(CalFlora, scrubbed_species_binomial)

#rasterized results in the same raster = GOOD SIGN!

#floweringApril <- rasterize(aprilRange, tempApril)
#plot(floweringApril)

#floweringJune <- rasterize(juneRange, tempJune)
#plot(floweringJune)

#lets try rasterize with annual data next time!

#test <- rasterize(floraRange, precipAnnual)
#plot(test) #practically useless

#testing out loops to indvidually plot each species polygon as seperate layers [FAILED] too much data
#CalFloraDistribution <- tm_shape(California) + tm_polygons() + 

#for(i in 1:170){
#  tm_shape(floraRange@polygons[i]) + tm_polygons()+
#}
#tm_basemap()

###### California geography data frame to bound range maps then join! [SCRAPPED]--------------------------------------------
#states <- map_data("state")
#California <- filter(states, region == "california")
#class(California)

#California <- st_read("Z:/Project/CA_State/CA_State_TIGER2016.shp")
#California

#######Using California long lat spatial data to create a range box to derive species range distributions [FAILED] resulted in over 2000 individual species range maps :( 
#CalSpeciesRanges<- BIEN_ranges_box(min(California$lat), max(California$lat), min(California$long), max(California$long), return.species.list = TRUE)

# filtering to only species which have flowering data! 

##### Attempted conversion of California data frame into spatial point data and then spatial polygon data [FAILED] unneccessary-------------------------------------------------
#coordinates(California) <- ~long+lat

#df_to_SpatialPolygons(California, proj = "+init=epsg:4326 +proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0" )

#crs(California) <-  "+init=epsg:4326 +proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0" 

#California

#st_as_sf(California)

#plot(California)

#st_polygonize(California)



#calfloraRange <- BIEN_ranges_spatialpolygons(California) #takes too long to run


#CA<- coords2Polygons(data = California)