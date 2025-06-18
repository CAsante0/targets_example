library(targets)
# grab everything from scripts folder
purrr::walk(list.files("scripts", full.names = TRUE), source)

tar_option_set(
  packages = c("dplyr", "ggplot2", "tibble")  # all needed pkgs
)
list(
  tar_target(raw_data, load_data()),
  tar_target(fox_data, filter_species(raw_data, species = "fox")),
  tar_target(daily_fox_counts, summarize_counts(fox_data)),
  tar_target(fox_plot, plot_counts(daily_fox_counts, output_file = "output/fox_counts.png"))
)
