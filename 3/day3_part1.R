backpack <- readLines("input")

lapply(backpack, \(x){
pocket_1 <- 
  strsplit(x, split = "") |>
  unlist() |>
  head(n = length(unlist(strsplit(x, split = "")))/2)

pocket_2 <- 
  strsplit(x, split = "") |>
  unlist() |>
  tail(n = length(unlist(strsplit(x, split = "")))/2)

which(c(letters, LETTERS) %in% pocket_2[which(pocket_2 %in% pocket_1)])
}
) |> 
  unlist() |>
  sum()
