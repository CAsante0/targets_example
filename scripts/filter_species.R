filter_species <- function(data, species) {
  dplyr::filter(data, species == !!species)
}
