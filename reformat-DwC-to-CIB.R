#script that transforms DwC from dataset in Symbiota to format for CIB barcoding project. 
#colum headers: Catalog	Order	SciName	Suborder	Family	Subfamily	Genus	Species	Country	State/Province	County	Locality	Identified By	Date Identified	Type Status	Collector	Associated Collectors	Year	Event Date	Verbatim Date	Notes	Habitat	Life Stage	Sex	Individual Count	Sampling Protocol	Preparations	Decimal Latitude	Decimal Longitude	Uncertainty	Maximum Elevation In Meters
setwd("~/Documents/ecdysis-cibi")

# Load the data
occurrences <- read.csv("SymbOutput_2025-07-11_152542_DwC-A/occurrences.csv", stringsAsFactors = FALSE)

# Clean column names to remove extra whitespace
names(occurrences) <- trimws(names(occurrences))

# Create the new data frame with selected and renamed columns
transformed <- data.frame(
  Catalog = occurrences$catalogNumber,
  Order = occurrences$order,
  SciName = occurrences$scientificName,
  Suborder = NA,  # Darwin Core typically lacks suborder; fill as NA or infer if needed
  Family = occurrences$family,
  Subfamily = NA,  # Same as above
  Genus = occurrences$genus,
  Species = occurrences$specificEpithet,
  Country = occurrences$country,
  `State/Province` = occurrences$stateProvince,
  County = occurrences$county,
  Locality = occurrences$locality,
  `Identified By` = occurrences$identifiedBy,
  `Date Identified` = occurrences$dateIdentified,
  `Type Status` = occurrences$typeStatus,
  Collector = occurrences$recordedBy,
  `Associated Collectors` = NA,  # If you have this info in another column, map it here
  Year = occurrences$year,
  `Event Date` = occurrences$eventDate,
  `Verbatim Date` = occurrences$verbatimEventDate,
  Notes = occurrences$occurrenceRemarks,
  Habitat = occurrences$habitat,
  `Life Stage` = occurrences$lifeStage,
  Sex = occurrences$sex,
  `Individual Count` = occurrences$individualCount,
  `Sampling Protocol` = occurrences$samplingProtocol,
  Preparations = occurrences$preparations,
  `Decimal Latitude` = occurrences$decimalLatitude,
  `Decimal Longitude` = occurrences$decimalLongitude,
  Uncertainty = occurrences$coordinateUncertaintyInMeters,
  `Maximum Elevation In Meters` = occurrences$maximumElevationInMeters,
  stringsAsFactors = FALSE
)

# Write as tab-delimited file
write.table(transformed, file = "transformed_occurrences.tsv", sep = "\t", row.names = FALSE, quote = FALSE)
