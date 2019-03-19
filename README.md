# Analysis of Perennial Blooms in North America

## [Introduction]

Climate change has continuously proven to be a growing issue impacting global biodiversity and the ability of species to survive and propagate. In order to combat climate change, historical ecological solutions should be put under inspection. In the past, a large portion of carbon was sequestered by plant ecology, namely through perennial plants which persist beyond seasonality. Due to human development and agricultural intensification following the green revolution, tracts of forests everywhere were cut down subsequently lowering global carbon sequestration potential. In order to better understand the dynamics between climate change and perennial carbon sequestration, greater analyses are needed between the propagation of perennials and their environments. The significance of studying perennials is twofold: 1) The ubiquitous presence of perennials manifest the completion of ecological succession. [Priority Effects between Annual and Perennial plants by DeMalach and Fukami](https://www.sciencedirect.com/science/article/pii/S0167880900002735) notes that perennial presence signifies a stable ecosystem able to provide ecological services. 2) The multi-year persistence of perennials enables these species to better store and sequester carbon for longer periods of time, thereby slowing down the rate of climate change.  

This study will select four species of perennials prominent throughout the United States: 1) Silver Maple: [Acer saccharinum](https://plants.usda.gov/core/profile?symbol=acsa2), 2) American Plum: [Prunus americana](https://plants.usda.gov/core/profile?symbol=pram), 3) Common Dandelion: [Taraxacum officinale](https://plants.usda.gov/core/profile?symbol=taof), and 4) Silver Buffaloberry: [Shepherdia argentea](https://plants.usda.gov/core/profile?symbol=shar). The species ranges and their bloom patterns will be analyzed and compared to the correlating climate data in order to see if there is a relationship between blooms and climate. Furthermore, the ranges and seasonalities of each perennial species will be compared for similarities and differences in both scope and scale.

## [Methods]

Using the [Botanical Information and Ecology Network](http://bien.nceas.ucsb.edu/bien/), an open source, decentralized hub of ecological information, I downloaded data relating specifically to bloom dates of plant species only within the United States. Following this initial data restriction, the North American bloom patterns within the BIEN database were plotted as a histogram in order to analyze patterns in bloom dates. Then, in order to further limit the data set, I restricted my analysis to only include species which had the largest sample of records leading to the formulation of the four perennials under study: Silver Maple, American Plum, Common Dandelion, and Silver Buffaloberry.  

Next, I downloaded temperature and precipitation data from the [PRISM climate database](http://www.prism.oregonstate.edu/) hosted by Oregon State University. PRISM includes open source records of 30-year temperature (°C) and precipitation (mm) normals in raster format which I utilized as indicators of climate. In order to further analyze the relationship between the species range and climate, the spatial polygon species range data was plotted against the temperature and precipitation rasters. Attempting to see further significance, I rasterized the range data and again plotted it against the annual climate and precipitation data. Finally, I created a matrix consisting of the months with the greatest bloom occurences in order to demonstrate how climate changes during the flowering season.  


## [Results]

*-Interactive Maps-*

 (1). [Perennial Ranges and 30 year Temperature normals](https://tommyhayashi.github.io/NA-Perennial-Blooms/SpeciesRangesand30yearTemperatureNormals.html)

An interactive map containing layers representing the ranges for the Silver Maple, American Plum, Silver Buffaloberry, and the common Dandelion. These ranges are mapped over 30-year annual temperature normals for the continental United States.

 (2). [Perennial Ranges and 30 year Percipiation normals](https://tommyhayashi.github.io/NA-Perennial-Blooms/SpeciesRangesand30yearPercipitationnormals.html)

An interactive map containing layers representing the ranges for the Silver Maple, American Plum, Silver Buffaloberry, and the common Dandelion. These ranges are mapped over 30-year annual precipitation normals for the continental United States.

*-Static Maps-*

__Static 1__ ![Perennial Ranges](https://tommyhayashi.github.io/NA-Perennial-Blooms/PerennialOccurrences.jpeg)

This map illustrates the massive ranges of the Dandelion, Silver Maple, Silver Buffaloberry, and American Plum. This static image attempts to demonstrate both the amount of shared cohabitation, and the sheer sizes of the species ranges.

__Static 2__ ![Rasterized Species Ranges and Annual Temperature Data](https://tommyhayashi.github.io/NA-Perennial-Blooms/RasterRangeTemperature30yearNormals.jpeg)

This map depicts the rasterized North American species ranges from the BIEN database layered over the annual 30-year temperature data normals from PRISM. 

__Static 3__ ![Rasterized Species Ranges and Annual Percipitation Data](https://tommyhayashi.github.io/NA-Perennial-Blooms/RasterRangePrecipitation30yearNormals.jpeg)

This map depicts the rasterized North American species ranges from the BIEN database layered over the annual 30-year percipitation data normals from PRISM.

*-Figures-*

__Figure 1__ ![Histogram depicting frequencies of Blooms in North American Species](https://tommyhayashi.github.io/NA-Perennial-Blooms/BloomFrequency.jpeg)

Histogram depicting frequencies of blooms in North American species. Months are mapped along the x-axis and the frequency of blooms represents the y-axis.

__Figure 2__ ![Matrix of Precipitation and Temperature Changes during Bloom Season](https://tommyhayashi.github.io/NA-Perennial-Blooms/BloomMonthsTemperaturePrecipitation30yearnormals.jpeg)

Matrix of precipitation and temperature changes during the bloom season, ranging from April to June. Significant shifts in temperature and precipitation highs and lows should be noted.

[Rscript](https://github.com/tommyhayashi/PerennialBlooms/blob/master/project.R)

## [Discussion and Analysis]

The process of filtering the BIEN dataset generated interesting findings immediately. Firstly, the vast majority of species recorded within North America and particularly the continental US had seasonal blooms starting during the spring and ending midsummer. __Figure 1__ contains the monthly blooming occurrences of plants found within the United States and illustrates that the greatest concentrations of bloomings occur between April and June. Additionally, two trends within climate temperature and precipitation could be identified during these blooming months, the matrix in __Figure 2__ demonstrates how precipitation highs and lows decrease after April, whereas temperature highs continually increase from April to June. Therefore, the increase in temperature and decrease in precipitation may indicate why bloom concentrations increase from April to June within North American species.

The __Interactive maps 1 and 2__ demonstrate additional findings between the 30-year temperature and precipitation normalized averages and perennial ranges. The first noticeable difference between the species ranges is that the smallest species, the Dandelion, has the largest range. The reason for Taraxacum officinale’s comparatively large range has much to do with its smaller stature being easy to propagate across the nation and its quick maturity, growing only to a foot, requiring little nutrient investment. Additional findings related to the habitats which each species has noticeably evolved for, with the bigger perennials, American Plum, Silver Buffaloberry, and Silver Maple, all coexisting with similar ranges in the heart of the continental United States. However, differences can be noted between precipitation averages between the ranges of these larger perennial species. Most notably, the Silver Buffaloberry prefers dryer climates, whereas the ranges of the American Plum and Silver Maple extend into the wetter South Eastern regions of the United States. Furthermore, some fractures can be noted within some species ranges, with small seperate ranges of Silver Buffaloberry in the East, and American Plum and Silver Maple in the South. Finally, the __static maps__ all further demonstrate the findings noted out of the interactive maps. 

## [Significance]

The significance of understanding the distributions and differences between perennial species across North America, and the world, relates to the important roles which perennial plants play in carbon sequestration, food production, and ecological succession. Through an analysis of the Dandelion, Silver Maple, Silver Buffaloberry, and American Plum, it becomes clear that each perennial species has evolved for a specific environment and to play a particular ecological role. However, there are similarities to be had, as noted by the frequent overlap in species range maps, indicating that many of these species coexist ecologically, and rely on the same geography and climate zones as habitats.
	
The ecological value of studying and understanding the patterns of these perennial plants relates to the greater biogeochemical role which many of these species play. Since all of the species studied persist beyond annually, they all become important carbon sinkholes, particularly the larger species such as the Silver Maple. An article by the USDA Forest Service on [Carbon Sequestration](https://www.nrs.fs.fed.us/niacs/forests/carbonsequestration/) notes that over time, these multi-year species accumulate and store carbon which helps offset the carbon generated by humans. Through carbon sequestration and the success of larger perennial species, climate change can be combated using ecological means. Furthermore, there is immense ecological value in the persistence of perennial plants, as mentioned in the introduction, their presence indicates a stable ecosystem. Additionally, [Danielle Prieur](http://dc.medill.northwestern.edu/blog/2016/08/04/perennials-fighting-climate-change/#sthash.SOPvXnTN.xtzX6o0M.dpbs) notes from a presentation by Dr. Jerry Glover, that the longer root systems of perennial plants enrich the soil qualities of their habitats through their greater storage capacities of moisture and carbon. Furthermore, a decade-long grass study by [Tilman et al](https://www.nature.com/articles/nature04742) found that ecosystem stability positively related to root mass, and therefore the biomass of perennials. Thus, the ecosystem service of soil enrichment by perennials signifies greater increases in ecological resilience, this is especially pertinent given changing climates across North America. 
	
Escaping from the broad umbrella term of perennial, the Dandelion, Silver Maple, Silver Buffaloberry, and American Plum are all significant in their own right. Both the Dandelion and Silver Buffaloberry are especially noted to have potent medicinal properties. The [American Indian Health and Diet Project](http://www.aihd.ku.edu/foods/buffaloberry.html) notes that the Silver Buffalo has often been used in indigenous remedies, to treat ailments as severe as tuberculosis and stomach cancer. Similarly, the Dandelion has historically been used in herbal remedies and [Sawhney et al](https://www.researchgate.net/publication/281362336_Qualitative_and_quantitative_analysis_of_phytochemicals_of_Taraxacum_officinale) found in their study that Dandelions contain various chemical compounds vital for good health. 

The significance in the Plum and Maple relate to their role in American agriculture and food systems. The Silver Maple and American Plum both manifest means to food production, in addition to their ecological contribution as perennials. Furthermore, the massive 90-foot height of the [Silver Maple](https://plants.usda.gov/java/charProfile?symbol=ACSA2) at maturity demonstrates an important carbon sinkhole, and their large range across the Eastern United States signifies the potential to foster more growth thus offsetting emissions.

## [Conclusions]
This study found that the most prolific perennial species in the North American BIEN database have intersecting ranges, and while the ecological services each species provides dramatically differ depending on size, their presence is significant nonetheless. Furthermore, its abundantly clear that even though each species span a vast range across North America, their physiology is evolved for specific climates. The Silver Maple, for example, evolved for much colder, wetter climates, than the Silver Buffaloberry. Significant evidence points to the implicit value which the Silver Maple plays towards carbon sequestration, and continued advances in medicine may prove both the Silver Buffaloberry and common Dandelion useful. Although distinct trends in species ranges could be differentiated, the lack of substantial differences in range response to climate did not allow for reliable and accurate predictions on how future bloom distributions may shift. Given the opportunity to speculate, however, I predict that increases in climate variability across the continental United States will continue to fracture the blooming ranges of these perennial species. Since all of the studied perennials span ranges which encompass wildly differing climates, and range fracturing is already occurring, given greater climate change the ranges will likely either shrink or continue to fracture. 
	
[References](https://tommyhayashi.github.io/NA-Perennial-Blooms/FinalReferences.docx)
