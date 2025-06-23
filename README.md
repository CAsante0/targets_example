This repo serves a minimal example for creating and running your own targets pipeline.




# 1. Initialize a Targets pipeline in your project
```targets::tar_script()  # Generates _targets.R```

# 2. Define pipeline in _targets.R
# Example:
```library(targets)
tar_option_set(packages = "dplyr")
list(
  tar_target(data_raw, read.csv("data.csv")),
  tar_target(data_clean, clean_data(data_raw))
)
```
# 3. Run the pipeline
```targets::tar_make()```

# 4. Visualize pipeline dependency graph
```targets::tar_visnetwork()          # Static view```
targets::tar_visnetwork(targets_only = TRUE)  # Exclude functions

# Optional:
# Clean results
```targets::tar_destroy()```

