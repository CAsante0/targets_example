load_data <- function() {
  tibble::tibble(
    date = rep(seq.Date(as.Date("2023-01-01"), as.Date("2023-01-10"), by = "day"), each = 3),
    species = rep(c("fox", "deer", "rabbit"), times = 10),
    count = sample(1:10, 30, replace = TRUE)
  )
}
