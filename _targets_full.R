library(targets)

# Global options
tar_option_set(
  packages = c("dplyr", "ggplot2", "readr")  
)

list(
  #Simulate or load raw data
  tar_target(
    raw_data,
    tibble::tibble(
      date = rep(seq.Date(as.Date("2023-01-01"), as.Date("2023-01-10"), by = "day"), each = 3),
      species = rep(c("fox", "deer", "rabbit"), times = 10),
      count = sample(1:10, 30, replace = TRUE)
    )
  ),
  #filter for a specific species
  tar_target(
    fox_data,
    raw_data %>% filter(species == "fox")
  ),
  #Summarize counts by date
  tar_target(
    daily_fox_counts,
    fox_data %>%
      group_by(date) %>%
      summarise(total = sum(count), .groups = "drop")
  ),
  #Plot the daily fox counts
  tar_target(
    fox_plot,
    {
      p <- ggplot(daily_fox_counts, aes(x = date, y = total)) +
        geom_line(color = "darkorange", size = 1) +
        geom_point() +
        labs(title = "Daily Fox Counts", x = "Date", y = "Count") +
        theme_minimal()
      
      ggsave("fox_counts.png", plot = p, width = 6, height = 4)
      "fox_counts.png"
    }
  )
)
