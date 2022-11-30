calories <- scan("example", blank.lines.skip = FALSE)

split(calories, cumsum(is.na(calories))) |>
  vapply(\(x) sum(x, na.rm = TRUE), FUN.VALUE = 1)|>
  max()
