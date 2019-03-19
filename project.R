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


### add comments explaining what functions do and why I use them


#####
vignette("BIEN")
vignette("tmap-getstarted")
vignette("Raster")
vignette("leaflet")


#######

##### Selecting species lists for California for later joining-----------------------------------------------------

usList <- BIEN_list_country(country = "United States") #specifically filters which species have ranges intersecting with the United States



###### Downloading all flowering species data, begin date and duration, for species in California  ---------------------------------------------
#[Realized that bloom duration data has relatively few recordings and last minute decided to exclude from study]

trait_obs <-BIEN_trait_traits_per_species()  #downloading all trait data 
flower_counts <-trait_obs %>% filter(trait_name == c("plant flowering duration", "plant flowering begin")) #filtering trait data to be exclusively flowering bloom and duration


#filtering for the most prominent species, top 5 species with the most bloom beginning data [done manually, despicable I know]
#calCounts <- merge(flower_counts, caList, by = intersect("scrubbed_species_binomial","scrubbed_species_binomial"))
mostPopularSpeciesBeginning <- c("Acer saccharinum", "Prunus americana", "Taraxacum officinale", "Shepherdia argentea")
#mostPopularSpeciesDuration <- c("Diospyros lycioides", "Dodonaea viscosa", "Prunus armeniaca")
)

#Filtering by flowering start data
FloraBloomStart <- BIEN_trait_traitbyspecies(mostPopularSpeciesBeginning,  "plant flowering begin") 
#FloraBloomDuration <- BIEN_trait_traitbyspecies(mostPopularSpeciesDuration, "plant flowering duration" ) 

FloraBloomStart #checking data type
#FloraBloomDuration


#######filtering by greatest occurrences of flowering [Interetesting findings, may include in discussions but too much datat to spatially analyze reasonably] -------------------------------------------------------
mayBlooms <- filter(CalFlora, trait_value.x == 5)
mayRange <- BIEN_ranges_load_species(mayBlooms$scrubbed_species_binomial)  

tm_shape(mayRange) + tm_polygons() + tm_basemap()

aprilBlooms <- filter(CalFlora, trait_value.x == 4)
aprilRange <- BIEN_ranges_load_species(aprilBlooms$scrubbed_species_binomial) 


juneBlooms <- filter(CalFlora, trait_value.x == 6)
juneRange <- BIEN_ranges_load_species(juneBlooms$scrubbed_species_binomial)

#### plotting the frequency of bloom occurences vs months and data analysis -> making figures -----------------------------------------------------------------------
    #figure keeps looking bad
bienBlooms <- BIEN_trait_traitbyspecies(usList$scrubbed_species_binomial,"plant flowering begin") #filtering to only include the flowering data of US species
bienBlooms %>% add_count(scrubbed_species_binomial) #attempted to add a count column to demonstrate frequencies [wouldn't work for some reason]
plot(bienBlooms$n, bienBlooms$trait_value) #trial plot

#[failed] plot(as.numeric(bienBlooms$trait_value), bienBooms$scrubbed_species_binomial, xlab = "", ylab = "")  #[WIP]

#[gross] plot(bienBlooms$id, bienBlooms$trait_value, xlab = "US Species ID", ylab = "Bloom Month", main = paste("Flowering Distributions Throughout the Year"), xlim = 1)

bloomFrequency <- hist(as.numeric(bienBlooms$trait_value), xlab = "Month of Bloom", main = "Frequency of Blooming North American Species", freq = TRUE, col = )
#realized a histogram would be the best depiction, with the x axis representing month and y axis number of occurences
bloomFrequency

#### Downloaded range maps and getting species data and then plotting!  [first attempt, continued on later down] ------------------------------------------
floraRangeBloom <- BIEN_ranges_load_species(mostPopularSpeciesBeginning) #downloaded the range maps specifically for the top 5 US species with the most data in BIEN



tmap_mode("plot")
tmap_mode("view")
perennialRange <-  tm_shape(floraRangeBloom) + tm_polygons("MAP_COLORS", alpha = 0.66)  + tm_fill() + tm_layout(title = "Occurrences of Flowering Perennials in North America", legend.show = TRUE, frame = TRUE)  + tm_basemap()
   #attempted to add a legend to no avail

leaflet("World") 

perennialRange
  #used this map to statically depict the ranges of the studied species
 class(floraRange)

 ######## Downloading PRISM climate raster data, annual data + data for months 4-6 as they have the vast majority of bloom dates
 
 
 #precipJanuary <- raster("Z:/Project/PRISM_ppt_30yr_normal_4kmM2_all_bil/PRISM_ppt_30yr_normal_4kmM2_01_bil.bil")
 #plot(precipJanuary) [test]
 
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
 
 
 
 ##### ATtempted plotting using rasters, scrapped in the end but some of the data was used as figures or used for analysis, so still kinda helpful!
#coverting new tmap into a raster restricted to contintental NA then comparing the bloom data with climate data through layered mapping
annualFlowering <- rasterize(floraRangeBloom, meanTempAnnual)
#rasterized range of perennial species studied

USPrecipBlooms <- tm_shape(annualFlowering) + tm_raster(alpha = 1, title = "Species") +  tm_shape(precipAnnual) + tm_raster(alpha = 0.6, title = "Mean Precipitation 30 year normals", , palette = "Blues") + tm_basemap() 
 #attempt to added legend positions and accurate titles [SCRAPPED]     # , view.legend.position = c("LEFT", "BOTTOM"), main = "Species"  ... , view.legend.position = c("LEFT", "BOTTOM"), main = "Annual Temperatures"
tmap_mode("plot")

USPrecipBlooms #attempted mapping of species range raster with precipitation raster [ failed]

USTempBlooms <- tm_shape(annualFlowering) + tm_raster(alpha = 1, title = "Species") + tm_shape(meanTempAnnual) + tm_raster(alpha = 0.33, title = "Mean Temperature 30 year normals (Celsius)") + tm_basemap()
USTempBlooms
#plotting the rasterized annual flowering vs the raster of 30 year national temperature normals
tmaptools::palette_explorer()

tempPerennial <- tm_shape(meanTempAnnual) + tm_raster(title = "Mean Temperature 30 year normals (Celsius)") + tm_shape(floraRangeBloom) + tm_polygons(alpha = 0.5, "MAP_COLORS") + tm_basemap()
tempPerennial
#mapping the temperature raster with the spatial polygons representing the species ranges [decided to map each plant range independently]
precipPerennial <- tm_shape(precipAnnual) + tm_raster(title = "Mean Precipitation 30 year normals ") + tm_shape(floraRangeBloom) + tm_polygons(alpha = 0.5, "MAP_COLORS") + tm_basemap()
precipPerennial
#mapping the percipitation raster with the spatial polygons representing the species ranges  [decided to map each plant range independently]
bloomTempPerennial <- tm_shape(floraRangeBloom) + tm_polygons("MAP_COLORS") + tm_shape(tempApril) + tm_raster(title = "Mean Temperature 30 year normals") + tm_shape(tempMay) + tm_raster(title = "Mean Temperature 30 year normals") + tm_shape(tempJune) + tm_raster(title = "Mean Temperature 30 year normals") + tm_basemap()
bloomTempPerennial
#attempted mapping of the species range with the rasters representing April thru June [scrapped too much data representing in a single figure]


######Finally onto something! --------------------------------------------------------
#loading each species range individually to allow differentiability in interactive viewing
SilverMaple <- BIEN_ranges_load_species("Acer_saccharinum")
AmericanPlum <- BIEN_ranges_load_species("Prunus_americana")
SilverBuffaloBerry <- BIEN_ranges_load_species("Shepherdia_argentea")
Dandelion <- BIEN_ranges_load_species("Taraxacum_officinale")

#combining each individual layer
perennialLayers <- tm_shape(SilverMaple) + tm_polygons(alpha = 0.5, col = "green") +  tm_layout(title = "Occurrences of Flowering Perennials in NA") + tm_shape(AmericanPlum) + tm_polygons(alpha =0.5, col = "purple") +
            tm_shape(SilverBuffaloBerry) + tm_polygons(alpha = 0.5, col = "orange") + tm_shape(Dandelion) + tm_polygons(alpha = 0.5, col = "yellow")  +
 tm_basemap()
#mapping the layers independently
 
tmap_mode("plot") #trying out how it looks it plot vs view
tmap_mode("view")

perennialLayers #it's a cool map but I'll use it as a template to add in climate data 

precipPerennial <- tm_shape(precipAnnual) +tm_raster(title = "Mean Precipitation 30 year normals mm"^"2", palette = "Blues", legend.format = list(digits = ))+ tm_shape(SilverMaple) + tm_polygons(alpha = 0.33, col = "green") +  tm_layout(title = "Occurrences of Flowering Perennials in NA") + tm_shape(AmericanPlum) + tm_polygons(alpha =0.33, col = "purple") +
  tm_shape(SilverBuffaloBerry) + tm_polygons(alpha = 0.33, col = "orange") + tm_shape(Dandelion) + tm_polygons(alpha = 0.33, col = "yellow")
precipPerennial
#mapping the ranges independently plus precipitation 30 year normals, ranges as spatial polygons + precipitation as a raster

tempPerennial <- tm_shape(meanTempAnnual)  +tm_raster(title = "Average 30 year normals (Celsius)", palette = "Reds") +tm_shape(SilverMaple) + tm_polygons(alpha = 0.33, col = "green") +  tm_layout(title = "Occurrences of Flowering Perennials in NA") + tm_shape(AmericanPlum) + tm_polygons(alpha =0.33, col = "purple") +
  tm_shape(SilverBuffaloBerry) + tm_polygons(alpha = 0.33, col = "orange") + tm_shape(Dandelion) + tm_polygons(alpha = 0.33, col = "yellow")
tempPerennial
#same thing as above but temperature, hoping to identify trends between the spatial polygons and climate (temp + precip)


  
 

##### Rasterize then plot! --------------------------------------------------------------------------------------

tmap_mode("view")
floweringMayT <- rasterize(mayRange, tempMay) #trials
floweringMayP <- rasterize(mayRange, precipMay)

plot(floweringMayT) #tests
plot(floweringMayP)


perennialNARaster <- rasterize(meanTempAnnual, perennialLayers)
#rasterizing perennial layers 

#####Rasterizing bloom data range maps according to the climate data during their monthly bloom

floweringApril <- rasterize(floraRangeBloom, tempApril)
plot(floweringApril)

floweringMay <- rasterize(floraRangeBloom, tempMay)
plot(floweringMay)

floweringJune <- rasterize(floraRangeBloom, tempJune)
plot(floweringJune)

annualFlowering <- rasterize(floraRangeBloom, meanTempAnnual)
plot(annualFlowering)

##### Comparing climate data throughout the bloom season and vs annual data

#plotting as matrices to be able to visually compare changes in average temperature and percipitation during the bloom season and it looks pretty sweet
layout(matrix(1:6, nrow = 3, ncol = 2, byrow = TRUE)) 
plot(tempApril, main = "April Temperatures", cex = 1, axes = FALSE, box = FALSE) 
plot(precipApril, main = "April Precipitation", cex = 1, axes= FALSE, box = FALSE)
plot(tempMay, main = "May Temperatures", cex = 1, axes = FALSE, box = FALSE)
plot(precipMay, main = "May Precipitation",  cex = 1, axes= FALSE, box = FALSE)
plot(tempJune, main = "June Temperatures", cex = 1, axes = FALSE, box = FALSE)
plot(precipJune, main = "June Precipitation", cex = 1, axes= FALSE, box = FALSE )




layout(matrix(1:2, nrow = 2, ncol = 1, byrow = TRUE))
plot(precipAnnual, main = "Annual Precipitation", axes = FALSE, box = FALSE, , cex = 0.5)
plot(meanTempAnnual, main = "Annual Temperature", axes = FALSE, box = FALSE, , cex = 0.5)



plot(annualFlowering)




###SCRAPPED--------------------------------------------------------

### Thinking about using leaflet for interactive mapping maybe ------------------------------------------
leaflet("UnitedStates")


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

#attempt to loop through the layers of species ranges in order independently represent each range layer
#tmap_mode("view")
#speciesLayers ->  for(i in 1:4){
# tm_shape(floraRangeBloom@polygons[i]) + tm_polygons()+}
# tm_basemap()

#trying to differentiate the layers
#perennialLayers <-  tm_shape(floraRangeBloom) + tm_polygons() + tm_facets(~floraRangeBloom@polygons) + tm_layout(title = "Occurrences of Flowering Perennials in NA", legend.show = TRUE, frame = TRUE)  + tm_basemap()
#perennialLayers

#sfRangeBlooms <- st_as_sf(floraRangeBloom) 
# 

#speciesLayers <- for(1 in 1:4){
#   tm_shape(sfRangeBlooms[i]) + tm_polygons() +
#}
#+ tm_basemap()

###### bad looking mapping attempts  ------------------------------------------------------------------------------------
#mapping the ranges independently plus percipitation 30 year normals
#MayUSBlooms <- tm_shape(annualFlowering) + tm_raster(alpha = 1) + tm_shape(precipMay) + tm_raster(alpha = 0.3) + tm_shape(tempMay) + tm_raster(alpha = 0.4) + tm_basemap()  
#MayUSBlooms

#JuneUSBlooms <- tm_shape(annualFlowering) + tm_raster(alpha  =1) + tm_shape(precipJune) + tm_raster(alpha = 0.3) + tm_shape(tempJune) + tm_raster(alpha = 0.4) + tm_basemap()
#JuneUSBlooms
#scrapping duration analysis for now, not enough data recorded in BIEN with correlating range map for flowering durations
#floraRangeDuration <- tm_shape(floraRangeDuration) + tm_polygons("MAP_COLORS", alpha = 0.2) + tm_layout(title = "Highest Occurences of Flowering Duration Data in Continental US") + tm_basemap()  

#floraRangeDuration

#next step maybe mapping the above two together

#attempting to map climate rasters vs flowering range and distributions
#precipDuration <- plot(precipAnnual, aes(floraRangeD)) + geom_polygon()
#precipDuration

#########plotting distributions [Utilized a different method]-----------------------------------------------------



#tmap_mode("view")

#plot(floraRange)

#FloraDistribution <-  tm_shape(floraRange)  + tm_polygons() +tm_fill(col = "MAP_COLORS") + tm_borders() + tm_basemap()

#convertedRange <- st_as_sf(floraRange)
#FloraDistribution

#convertedRange 



#lets try isolating the different polygons in the seasonal bloom data next time!
#another idea would be to generate centroids or dot representations for each spatial polygon using a for loop and mutate

#max.count(floraRange@data$species)

#FloweringPoints <- gCentroid(floraRange, byid = TRUE)
#  plot(FloweringPoints)
#attempt <- tm_shape(floraRange) + tm_polygons() + tm_fill() + tm_dots(FloweringPoints) + tm_basemap()
#attempt

# floweringStartCentroids <- gCentroid(floraRangeB, byid = TRUE)