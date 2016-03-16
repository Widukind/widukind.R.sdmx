if (!"rsdmx" %in% installed.packages()[,"Package"]) devtools::install_github("opensdmx/rsdmx")

library(rsdmx)

sdmx.data <- readSDMX("http://widukind-api.cepremap.org/api/v1/sdmx/INSEE/data/IPCH-2015-FR-COICOP/a.07120.indice?startPeriod=2010&endPeriod=2014")
sdmx.data <- readSDMX("http://widukind-api.cepremap.org/api/v1/sdmx/INSEE/data/IPCH-2015-FR-COICOP/a.07120+01123.indice?startPeriod=2010&endPeriod=2014")
sdmx.dsd <- readSDMX("http://widukind-api.cepremap.org/api/v1/sdmx/datastructure/INSEE/IPCH-2015-FR-COICOP?references=all")
sdmx.data <- setDSD(sdmx.data, sdmx.dsd)
stats <- as.data.frame(sdmx.data)
head(stats)

sdmx.dataflows <- readSDMX("http://widukind-api.cepremap.org/api/v1/sdmx/dataflow")
sdmx.dataflows <- readSDMX("http://widukind-api.cepremap.org/api/v1/sdmx/dataflow/INSEE")
sdmx.dataflows <- readSDMX("http://widukind-api.cepremap.org/api/v1/sdmx/dataflow/INSEE/IPCH-2015-FR-COICOP")
dataflows <- as.data.frame(sdmx.dataflows)
head(dataflows)

sdmx.concepts <- readSDMX("http://widukind-api.cepremap.org/api/v1/sdmx/conceptscheme/INSEE/IPCH-2015-FR-COICOP/latest?references=none")
stats <- as.data.frame(sdmx.concepts, conceptSchemeId="INSEE_CONCEPTS")
head(stats)

sdmx.codelists <- readSDMX("http://widukind-api.cepremap.org/api/v1/sdmx/codelist/INSEE/IPCH-2015-FR-COICOP/latest")
codelists <- sapply(slot(sdmx.codelists, "codelists"), function(x) slot(x, "id"))
print(codelists)
stats <- as.data.frame(sdmx.codelists, codelistId="freq")
head(stats)
