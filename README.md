# Analysis of Perennial Blooms in North America

[Introduction]

Climate change has continuously proven to be a growing issue impacting global biodiversity and the ability of species to survive and propagate. In order to combat climate change, historical ecological solutions should be put under inspection. In the past, a large portion of carbon was sequestered by plant ecology, namely through perennial plants which persist beyond seasonality. Due to human development and agricultural intensification following the green revolution, tracts of forests everywhere were cut down subsequently lowering global carbon sequestration potential. In order to better understand the dynamics between climate change and perennial carbon sequestration, greater analyses are needed between the propagation of perennials and their environments. The significance of studying perennials is twofold: 1) The ubiquitous presence of perennials manifest the completion of an ecological succession. [Priority Effects between Annual and Perennial plants by DeMalach and Fukami](https://www.sciencedirect.com/science/article/pii/S0167880900002735) notes that perennial presence signifyies a stable ecosystem able to provide ecological services, and 2) The multi-year persistence of perennials enables these species to better store and sequester carbon for longer periods of time, thereby slowing down the rate of climate change.  

This study will select four species of perennials prominent throughout the United States: Silver Maple: [Acer saccharinum](https://plants.usda.gov/core/profile?symbol=acsa2), American Plum: [Prunus americana](https://plants.usda.gov/core/profile?symbol=pram), Common Dandelion: [Taraxacum officinale](https://plants.usda.gov/core/profile?symbol=taof), and Silver Buffaloberry: [Shepherdia argentea](https://plants.usda.gov/core/profile?symbol=shar). The species ranges and their bloom patterns will be analyzed and compared to the correlating climate data in order to see if there is a relationship between blooms and climate. Furthermore, the ranges and seasonalities of each perennial species will be compared for similarities and differences in both scope and scale.

[Methods]

Using the [Botanical Information and Ecology Network](http://bien.nceas.ucsb.edu/bien/), an open source, decentralized hub of ecological information, I downloaded data relating specifically to bloom data of plant species only within the United States. In order to further limit the data set, I then restricted my analysis to the species which had the largest sample of records which led to the formulation of the five perennials under study: Silver Maple, American Plum, Common Dandelion, Silver Buffaloberry, and Sweet Clover.  Next climate data was downloaded from the [PRISM climate database](http://www.prism.oregonstate.edu/) from Oregon State University which has open source records of 30 year temperature (°C) and precipitation (mm) normals in raster format. In order to further analyze the relationship between the species range and climate, the species range spatial data was rasterized and plotted against the annual climate and precipitation data. 


[Results]

-Interactive Maps-

1. [Perennial Ranges and 30 year Temperature normals](https://tommyhayashi.github.io/PerennialBlooms/SpeciesRangesand30yearTemperatureNormals.html)

2. [Perennial Ranges and 30 year Percipiation normals](https://tommyhayashi.github.io/PerennialBlooms/SpeciesRangesand30yearPercipitationnormals.html)

-Static Maps-

1. [Perennial Ranges]

2. [Rasterized Species Ranges and Annual Temperature Data](https://tommyhayashi.github.io/PerennialBlooms/RasterRangeTemperature30yearNormals.jpeg)

3. [Rasterized Species Ranges and Annual Percipitation Data](https://tommyhayashi.github.io/PerennialBlooms/RasterRangePrecipitation30yearNormals.jpeg)

-Figures-

1. [Histogram depicting frequencies of Blooms in North American Species](https://tommyhayashi.github.io/PerennialBlooms/BloomFrequency.jpeg)

2. [Matrix of Percipitation and Temperature Changes during Bloom Season](https://tommyhayashi.github.io/PerennialBlooms/BloomMonthsTemperaturePrecipitation30yearnormals.jpeg)


[Rscript](https://github.com/tommyhayashi/PerennialBlooms/blob/master/project.R)

[Discussion and Analysis]

The climate Figures generated interesting findings immediately. Firstly, the vast majority of species recorded within North America and particularly the continental US had seasonal blooms starting during the early summer or late spring and ending midsummer. Figure 1 contains the monthly blooming occurences of plants found within the United States and illustrates that the greatest concentrations of bloomings occur between [April and June](https://tommyhayashi.github.io/PerennialBlooms/BloomFrequency.jpeg). Additionally, two trends within climate temperature and precipitation could be identified during these blooming months, the [matrix](https://tommyhayashi.github.io/PerennialBlooms/BloomMonthsTemperaturePrecipitation30yearnormals.jpeg) in Figure 2 demonstrates how precipitation highs and lows decrease after April, whereas temperature highs continually increase from April to June. Therefore, the increase in temperature and decrease in precipitation may indicate why bloom concentrations increase from April to June within North American species.

The Interactive maps 1 and 2 demonstrate additional findings between the 30 year temperature and precipitation normalized averages with perennial ranges. The first noticeable difference between the species ranges is that the smallest species, the Dandelion, has the largest range. The reason for Taraxacum officinale’s comparatively large range has much to do with its smaller stature being easy to propagate across the nation and its quick maturity, growing only to a foot, requiring little nutrient investment. Additional findings relate to the habitats which each species has noticeably evolved for, with the bigger perennials, American Plum, Silver Buffaloberry, and Silver Maple, all coexisting with similar ranges in the heart of the continental United States. However, differences can be noted between precipitation averages between the ranges of these larger perennial species. Most notably, the Silver Buffaloberry prefers dryer climates, whereas the ranges of the American Plum and Silver Maple extend into the [wetter South Eastern regions of the United States](https://tommyhayashi.github.io/PerennialBlooms/SpeciesRangesand30yearPercipitationnormals.html).  
Finally, the static maps all further demonstrate the findings noted out of the interactive maps. 