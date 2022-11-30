calories <- scan("input", blank.lines.skip = FALSE)

split(calories, cumsum(is.na(calories))) |>
  vapply(\(x) sum(x, na.rm = TRUE), FUN.VALUE = 1)|>
  sort(decreasing = TRUE) |>
  head(n = 3) |>
  sum()

