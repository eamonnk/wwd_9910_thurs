

# url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv"
# whineQualityWhite <- read.csv(url, sep = ";")
# View(whineQualityWhite)

# 
# url <- "https://archive.ics.uci.edu/static/public/602/dry+bean+dataset.zip"
# download.file(url = url, destfile = "my_file.zip")       #  Destination file in the current working directory
# unzip("my_file.zip")
# list.files(path = "./DryBeanDataset")

# library(rvest)
# webpage <- read_html("https://pokemondb.net/pokedex/all")

#install.packages('rvest')
library(rvest)
webpage <- read_html("https://pokemondb.net/pokedex/all")
tableNodes <- html_nodes(webpage, "table")
table <- html_table(tableNodes)
pokemonData <- table[[1]]
View(pokemonData)

# write.table(pokemonData, "pokemon.txt", row.names = FALSE)
# 
# write.csv(pokemonData, "pokemon.csv", row.names = FALSE)

saveRDS(pokemonData, "pokemon.rds")
write_rds(pokemonData, "pokemon_readr.rds")
name <- pokemonData$Name
type <- pokemonData$Type
save(list = c("name", "type"), file = "pokemon.RData")


