# Analysis of Perennial Blooms in North America

[Introduction]

Climate change has continuously proven to be a growing issue impacting global biodiversity and the ability of species to survive and propagate. In order to combat climate change, historical ecological solutions should be put under inspection. In the past, a large portion of carbon was sequestered by plant ecology, namely through perennial plants which persist beyond seasonality. Due to human development and agricultural intensification following the green revolution, tracts of forests everywhere were cut down subsequently lowering global carbon sequestration potential. In order to better understand the dynamics between climate change and perennial carbon sequestration, greater analyses are needed between the propagation of perennials and their environments. The significance of studying perennials is twofold: 1) The ubiquitous presence of perennials manifest the completion of an ecological succession. [Priority Effects between Annual and Perennial plants by DeMalach and Fukami](https://www.sciencedirect.com/science/article/pii/S0167880900002735) notes that perennial presence signifyies a stable ecosystem able to provide ecological services, and 2) The multi-year persistence of perennials enables these species to better store and sequester carbon for longer periods of time, thereby slowing down the rate of climate change.  

This study will select four species of perennials prominent throughout the United States: Silver Maple: [Acer saccharinum](https://plants.usda.gov/core/profile?symbol=acsa2), American Plum: [Prunus americana](https://plants.usda.gov/core/profile?symbol=pram), Common Dandelion: [Taraxacum officinale](https://plants.usda.gov/core/profile?symbol=taof), and Silver Buffaloberry: [Shepherdia argentea](https://plants.usda.gov/core/profile?symbol=shar). The species ranges and their bloom patterns will be analyzed and compared to the correlating climate data in order to see if there is a relationship between blooms and climate. Furthermore, the ranges and seasonalities of each perennial species will be compared for similarities and differences in both scope and scale.

[Methods]

Using the [Botanical Information and Ecology Network](http://bien.nceas.ucsb.edu/bien/), an open source, decentralized hub of ecological information, I downloaded data relating specifically to bloom data of plant species only within the United States. In order to further limit the data set, I then restricted my analysis to the species which had the largest sample of records which led to the formulation of the five perennials under study: Silver Maple, American Plum, Common Dandelion, Silver Buffaloberry, and Sweet Clover.  Next climate data was downloaded from the [PRISM climate database](http://www.prism.oregonstate.edu/) from Oregon State University which has open source records of 30 year temperature (°C) and precipitation (mm) normals in raster format. In order to further analyze the relationship between the species range and climate, the species range spatial data was rasterized and plotted against the annual climate and precipitation data. 


[Results]

-Interactive Maps-

1. [Perennial Ranges and 30 year Temperature normals](https://tommyhayashi.github.io/NA-Perennial-Blooms/SpeciesRangesand30yearTemperatureNormals.html)

2. [Perennial Ranges and 30 year Percipiation normals](https://tommyhayashi.github.io/NA-Perennial-Blooms/SpeciesRangesand30yearPercipitationnormals.html)

-Static Maps-

1. [Perennial Ranges]

2. [Rasterized Species Ranges and Annual Temperature Data](https://tommyhayashi.github.io/NA-Perennial-Blooms/RasterRangeTemperature30yearNormals.jpeg)

3. [Rasterized Species Ranges and Annual Percipitation Data](https://tommyhayashi.github.io/NA-Perennial-Blooms/RasterRangePrecipitation30yearNormals.jpeg)

-Figures-

1. [Histogram depicting frequencies of Blooms in North American Species](https://tommyhayashi.github.io/NA-Perennial-Blooms/BloomFrequency.jpeg)

2. [Matrix of Precipitation and Temperature Changes during Bloom Season](https://tommyhayashi.github.io/NA-Perennial-Blooms/BloomMonthsTemperaturePrecipitation30yearnormals.jpeg)


[Rscript](https://github.com/tommyhayashi/PerennialBlooms/blob/master/project.R)

[Discussion and Analysis]

The climate Figures generated interesting findings immediately. Firstly, the vast majority of species recorded within North America and particularly the continental US had seasonal blooms starting during the early summer or late spring and ending midsummer. Figure 1 contains the monthly blooming occurrences of plants found within the United States and illustrates that the greatest concentrations of bloomings occur between [April and June](https://tommyhayashi.github.io/NA-Perennial-Blooms/BloomFrequency.jpeg). Additionally, two trends within climate temperature and precipitation could be identified during these blooming months, the [matrix](https://tommyhayashi.github.io/PerennialBlooms/BloomMonthsTemperaturePrecipitation30yearnormals.jpeg) in Figure 2 demonstrates how precipitation highs and lows decrease after April, whereas temperature highs continually increase from April to June. Therefore, the increase in temperature and decrease in precipitation may indicate why bloom concentrations increase from April to June within North American species.

The Interactive maps 1 and 2 demonstrate additional findings between the 30-year temperature and precipitation normalized averages with perennial ranges. The first noticeable difference between the species ranges is that the smallest species, the Dandelion, has the largest range. The reason for Taraxacum officinale’s comparatively large range has much to do with its smaller stature being easy to propagate across the nation and its quick maturity, growing only to a foot, requiring little nutrient investment. Additional findings related to the habitats which each species has noticeably evolved for, with the bigger perennials, American Plum, Silver Buffaloberry, and Silver Maple, all coexisting with similar ranges in the heart of the continental United States. However, differences can be noted between precipitation averages between the ranges of these larger perennial species. Most notably, the Silver Buffaloberry prefers dryer climates, whereas the ranges of the American Plum and Silver Maple extend into the [wetter South Eastern regions of the United States](https://tommyhayashi.github.io/NA-Perennial-Blooms/SpeciesRangesand30yearPercipitationnormals.html). Finally, the static maps all further demonstrate the findings noted out of the interactive maps. 

[Significance]

The significance of understanding the distributions and differences between perennial species across North America, and the world, relates to the important roles which perennial plants play in carbon sequestration, food production, and ecological succession. Through an analysis of the Dandelion, Silver Maple, Silver Buffaloberry, and American Plum, it becomes clear that each perennial species has evolved for a specific environment and to play a particular ecological role. However, there are similarities to be had, as noted by the frequent overlap in species range maps, indicating that many of these species both coexist amicably, and rely on the same habitats and climate zones as habitats.
	
The ecological value of studying and understanding the patterns of these perennial plants relates to the greater biogeochemical role which many of these species play. Since all of the species studied persist beyond annually, they all become important carbon sinkholes, particularly the larger species such as the Silver Maple. [USDA Forest Service - Carbon Sequestration](https://www.nrs.fs.fed.us/niacs/forests/carbonsequestration/) Over time, these species accumulate and store carbon which helps offset the carbon generated by man-made emissions. Through carbon sequestration and the success of the larger perennial species, climate change can be combated using ecological means. Furthermore, there is immense ecological value in the persistence of perennial plants, as mentioned in the introduction, their presence indicates a stable ecosystem. Additionally, [Danielle Prieur](http://dc.medill.northwestern.edu/blog/2016/08/04/perennials-fighting-climate-change/#sthash.SOPvXnTN.xtzX6o0M.dpbs) notes from a presentation by Dr. Jerry Glover, that the longer root systems of perennial plants enrich the soil qualities of their habitats through their greater storage capacities of moisture and carbon. Furthermore, a decade-long grass study by [Tilman et al](https://www.nature.com/articles/nature04742) found that ecosystem stability positively related to root mass, and perenniating biomass. Therefore the ecosystem service of soil enrichment by perennials signifies greater increases in ecological resilience, which is especially pertinent given changing climates across North America. 
	
Escaping from the broad umbrella term of perennial, the Dandelion, Silver Maple, Silver Buffaloberry, and American Plum are all significant in their own right. Both the Dandelion and Silver Buffaloberry are especially noted to have potent medicinal properties. The [American Indian Health and Diet Project](http://www.aihd.ku.edu/foods/buffaloberry.html) notes that the Silver Buffalo has often been used in indigenous remedies, to treat ailments as severe as tuberculosis and stomach cancer. Similarly, the Dandelion has historically been used in herbal remedies and [Sawhney et al](https://www.researchgate.net/publication/281362336_Qualitative_and_quantitative_analysis_of_phytochemicals_of_Taraxacum_officinale) found in their study that Dandelions contain various compounds vital for good health. 
	
The significance in the Plum and Maple relate to their role in American agriculture and food systems. The Silver Maple and American Plum both manifest the production of food, in addition to their ecological contribution as perennials. Furthermore, the massive 90-foot height of the [Silver Maple](https://plants.usda.gov/java/charProfile?symbol=ACSA2) at maturity demonstrates an important carbon sinkhole, and their large range across the Eastern United States signifies the potential to foster more growth thus offsetting emissions.
