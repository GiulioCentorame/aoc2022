calories <- scan("input", blank.lines.skip = FALSE)

split(calories, cumsum(is.na(calories))) |>
  lapply(\(x) sum(x, na.rm = TRUE)) |>
  unlist(use.names = FALSE) |>
  sort(decreasing = TRUE) |>
  head(n = 3) |>
  sum()

