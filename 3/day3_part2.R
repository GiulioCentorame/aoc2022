backpack <- readLines("input")

  split(backpack, ceiling(seq_along(backpack)/3)) |>
  lapply(\(x) Reduce(intersect, as.vector(strsplit(x, split = "")))) |>
  unlist() |>
    match(c(letters, LETTERS)) |>
    sum()
  