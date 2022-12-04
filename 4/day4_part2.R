v_ranges <- readLines("input")

strsplit(v_ranges, split = "[-,]") |>
  lapply(\(x) length(intersect(x[1]:x[2], x[3]:x[4])) > 0 || length(intersect(x[3]:x[4], x[1]:x[2])) > 0)|>
  unlist() |>
  sum()
