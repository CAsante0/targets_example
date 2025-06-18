summarize_counts <- function(filtered_data) {
  filtered_data %>%
    dplyr::group_by(date) %>%
    dplyr::summarise(total = sum(count), .groups = "drop")
}
