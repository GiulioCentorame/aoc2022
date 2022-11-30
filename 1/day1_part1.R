calories <- scan("input", blank.lines.skip = FALSE)

split(calories, cumsum(is.na(calories))) |>
  lapply(\(x) sum(x, na.rm = TRUE)) |>
  unlist(use.names = FALSE) |>
  max()
