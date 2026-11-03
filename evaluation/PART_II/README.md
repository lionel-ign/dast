# FIRS - DATA ANALYSIS AND STORYTELLING

## Evaluation - Part II

In this second part of evaluation, you will be asked to produce an analysis in order to explore the drivers of forest biomass on a specified dataset, and to communicate on the results using visualizations.

### Objectives

From a designated dataset, you will have to
- define a problematic analysis problem;
- propose and implement several analysis approaches, using one or several models to explore the problematic;
- propose and implement several visualizations displaying the results of your analysis;
- present the resultats of your investigation, using your visualizations, in a narrative document;
- in an text join in the annexes of this narrative document, justify why you chose the corresponding analysis approaches, visualization approaches (type of chart, visual channels, ...), and narrative tactics.

### Deadline

You will have to send us your documents at the latest on the 17/11/2026 23:59.

### Data and constraints

You will be assigned individually a specific dataset as a csv file in your individual subfolders. 

The dataset contains the following columns:

* idp: plot id
* dep: department code
* ser_86: sylvoecoregion code
* espar: species code, see https://inventaire-forestier.ign.fr/dataifn/data/export_dataifn_doc_2025.zip 
* biom: plot-level biomass in tons/ha
* pro_psg: management code, 1 - private with management plan, 2 - private without management plan, 3 - state forest, 4 - municipality forest
* num_trees: number of tree individual per plot
* mean_dbh: plot-level average diameter at breast height in m² / ha
* competition_total: plot-level total basal area in m²/ha
* dem1000_altitude: plot elevation in meter above sea level
* dem1000_hillshade: plot hillshade in radian
* dem1000_roughness: plot roughness in meter
* perc_cut: percentage of trees cut betweeb two visits
* cut_intensity_nfi: cutting intensity class, 0 - no cuts, 1 - more than 90% cut, 2 - 50 to 90% cut, 3 - 15 to 50% cut, 4 - less than 15% cut.
* dist_road: distance to road class, 0 - less than 200m from road, 1 - between 200 and 500m from road, 2 - between 500 to 1000m to road, 3 - from 1000 to 2000m from road, 4 - more than 2000m from road
* mngmt_intensity: management intensity class, -1 - no information, 0 - no management traces, 1 - some management traces, 2 - large management traces 
* tmoy_[1]_[2]_anomaly: average anomalies in temperature in °C per seasons [1]: win - winter, spr - spring, sum - summer, aut - autumn and for [2]: moy - average, min - minimum and max - maximum temperature.
* soil CN: bioindicated soil C/N ratio unitless
* soil pH: bioindicated soil pH
* soil_waterlogging_perm: permanent soil waterlogging in mm
* soilwaterlogging_temp: temporary soil waterlogging in mm
* soil_swhc: soil water holding capacity in mm


You are free to enrich your analysis by integrating any additionnal dataset you looked for.
Additionnal to this dataset, you will be provided geospatial contours (french departments and sylvoecoregions) in the following formats: geopackage, geojson, topojson (for the use of altair). 
The data are available in WGS84 and RGF93, except the data in topojson format which are only in WGS84 coordinates (being created for altair).
If you need to project dat in other coordinates systems, use [this example](https://docs.qgis.org/3.44/en/docs/training_manual/vector_analysis/reproject_transform.html#:~:text=By%20default%2C%20QGIS%20reprojects%20data%20%E2%80%9Con%20the%20fly%E2%80%9D.,button%20in%20the%20bottom%20right%20corner%20of%20QGIS) "6.1.3. Follow Along: Saving a Dataset to Another CRS".


### Expectations

We have the following expectations:
- the narrative document can be a report in a pdf format, a notebook, an infographic document, or even a webpage. 
- if the narrative document is not a notebook, we are expected to receive any scripts you used for analyzing data and creating visualizations.
- every provided script should be well commented.
- the narrative document can include some interactive functionalities to propose to the readers some controled exploration of the dataset.
- the narrative document must present the results of your investigation, demonstrating a logical progression between the various analyses applied to your dataset. The visualizations showing your results, and what can be observed within them, must be explained.
- every choice in term of analysis approach, visualization approach or narrative strucuture, has to be justified in the annexes of your narrative document. The justification has to make it clear why you choose one method instead of another, according to the data nature and structure, the question you want to explore, the component you want to highlight, what you want your end-user to understand from the data.
- you are free to use R or python scripts. You can use other languages if you feel more comfortable. You are free to use Altair or any other visualization library/package/module. You are free to use QGIS.
- the use of scripts to create visualizations, or the incorporation of interactive features, is not mandatory. However, the evaluation will look more favorably upon the use of more technical solutions, as opposed to no-code alternatives, and the inclusion of interactive elements.
- in case you use no-code solutions to create visualization, the annexes has to contain screenshots of the used solutions.
- you are free to enrich your analysis by integrating any additionnal dataset you looked for.
- any use of generative AI must be explicitly disclosed. The use of generative AI is permitted solely for the purpose of language polishing.

### Expected results

You will produce a narrative document presenting the results of your investigation in a narrative way.
In case your document is not a notebook, you will join the different scripts you use to produce analysis and visualizations.
You will join annexes justifying your choice in terms of analysis, visualization, and narrative structures.

### Datasets

#### Individual datasets

[Bessard](data/bessard)
[Corbeaux](data/corbeaux)
[Cremier](data/cremier)
[Debeaupuis](data/debeaupuis)
[Etrillard](data/etrillard)
[Gouget](data/gouget)
[Lopez](data/lopez)
[Maufreron](data/maufreron)
[Petard](data/petard)
[Stona](data/stona)
[Taisne](data/taisne)
[Valmenier](data/valmenier)

#### Common datasets: geographical contours

[Geographical contours](data/geographic_contours)

### Interesting ressources

#### Modules/packages to create visualizations

##### Python
https://altair-viz.github.io/
https://matplotlib.org/
https://plotly.com/python/

##### R
https://ggplot2.tidyverse.org/
https://github.com/riatelab/mapsf
https://github.com/riatelab/geovizr

#### no-code solutions to create visualizations

https://magrit.cnrs.fr/
https://www.rawgraphs.io/

## Any questions

Feel free to contact us for any questions regarding this evaluation.