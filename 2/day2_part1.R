strategy_guide <- read.table("input",
                           sep = " ",
                           header = F,
                           col.names = c("opponent",
                                         "me"))
myShape_score_mapping <- c("X"=1, "Y"=2, "Z"=3)

myShape_meaning_mapping <- c("X" = "rock",
                          "Y" = "paper",
                          "Z" = "scissors")
opponentShape_meaning_mapping <- c("A" = "rock",
                                   "B" = "paper",
                                   "C" = "scissors")

strategy_guide$shape_score <- 
  # How is this even possible?
  myShape_score_mapping[strategy_guide$me] |>
  as.vector()

strategy_guide$my_shape <-
  myShape_meaning_mapping[strategy_guide$me] |>
  as.vector()

strategy_guide$opponent_shape <- 
  opponentShape_meaning_mapping[strategy_guide$opponent] |>
  as.vector()

# matrix to compare values
match_scoring <-
  matrix(c(3, 0, 6,
         6, 3, 0,
         0, 6, 3),
       nrow = 3,
       ncol = 3,
       byrow = TRUE,
       dimnames = list(c("rock", "paper", "scissors"),
                       c("rock", "paper", "scissors"))
       )

match_list <- cbind(strategy_guide$my_shape, strategy_guide$opponent_shape)

total_match <-
  match_scoring[match_list] |>
  sum()

# Return total score
sum(strategy_guide$shape_score, total_match)

