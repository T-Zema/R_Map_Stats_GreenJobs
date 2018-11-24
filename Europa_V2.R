library(dplyr)
library(eurostat)
library(sf)
library(tmap)


# Download attribute data from Eurostat
sp_data <- eurostat::get_eurostat("tgs00026", time_format = "raw", stringsAsFactors = FALSE) %>%
  # subset to have only a single row per geo
  dplyr::filter(time == 2010, nchar(geo) == 4) %>%
  # categorise
  
  dplyr::mutate(income = cut_to_classes(values, n = 5))
## Reading cache file /tmp/RtmpCXPiNi/eurostat/tgs00026_raw_code_FF.rds
## Table tgs00026 read from cache file: /tmp/RtmpCXPiNi/eurostat/tgs00026_raw_code_FF.rds
# Download geospatial data from GISCO
geodata <- get_eurostat_geospatial(output_class = "sf", resolution = "60", nuts_level = 2, year = 2013)
##
## COPYRIGHT NOTICE
##
## When data downloaded from this page
## <http://ec.europa.eu/eurostat/web/gisco/geodata/reference-data/administrative-units-statistical-units>
## is used in any printed or electronic publication,
## in addition to any other provisions
## applicable to the whole Eurostat website,
## data source will have to be acknowledged
## in the legend of the map and
## in the introductory page of the publication
## with the following copyright notice:
##
## - EN: (C) EuroGeographics for the administrative boundaries
## - FR: (C) EuroGeographics pour les limites administratives
## - DE: (C) EuroGeographics bezuglich der Verwaltungsgrenzen
##
## For publications in languages other than
## English, French or German,
## the translation of the copyright notice
## in the language of the publication shall be used.
##
## If you intend to use the data commercially,
## please contact EuroGeographics for
## information regarding their licence agreements.
##
## No encoding supplied: defaulting to UTF-8.
##
## # --------------------------
## HEADS UP!!
##
## Function now returns the data in 'sf'-class (simple features)
## by default which is different
## from previous behaviour's 'SpatialPolygonDataFrame'.
##
## If you prefer either 'SpatialPolygonDataFrame' or
## fortified 'data_frame' (for ggplot2::geom_polygon),
## please specify it explicitly to 'output_class'-argument!
##
## # --------------------------
##
# merge with attribute data with geodata
map_data <- inner_join(geodata, sp_data)
## Joining, by = "geo"
map1 <- tmap::tm_shape(geodata) +
  tmap::tm_fill("lightgrey") +
  tmap::tm_shape(map_data) +
  tmap::tm_grid() +
  tmap::tm_polygons("income", title = "Disposable household\nincomes in 2010",
                    palette = "Oranges")
print(map1)

# Interactive
tmap_mode("view")
map1
# Set the mode back to normal plotting
tmap_mode("plot")
print(map1)

