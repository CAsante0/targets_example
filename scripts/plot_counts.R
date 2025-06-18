plot_counts <- function(daily_counts, output_file) {
  p <- ggplot2::ggplot(daily_counts, ggplot2::aes(x = date, y = total)) +
    ggplot2::geom_line(color = "darkorange", size = 1) +
    ggplot2::geom_point() +
    ggplot2::labs(title = "Daily Fox Counts", x = "Date", y = "Count") +
    ggplot2::theme_minimal()

  ggplot2::ggsave(output_file, plot = p, width = 6, height = 4)
  return(output_file)
}
