strategy_guide <- read.table("input",
                           sep = " ",
                           header = F,
                           col.names = c("opponent",
                                         "outcome"))

myShape_score_mapping <- c("rock"=1, "paper"=2, "scissors"=3)

outcome_score_mapping <- c("win" = 6,
                           "draw" = 3,
                           "lose" = 0)

outcome_meaning_mapping <- c("X" = "lose",
                          "Y" = "draw",
                          "Z" = "win")
opponentShape_meaning_mapping <- c("A" = "rock",
                                   "B" = "paper",
                                   "C" = "scissors")


strategy_guide$outcome <-
  outcome_meaning_mapping[strategy_guide$outcome] |>
  as.vector()

strategy_guide$opponent <- 
  opponentShape_meaning_mapping[strategy_guide$opponent] |>
  as.vector()

# opponent move vs outcome
move_matrix <-
  matrix(c("scissors", "paper", "rock",
           "rock", "scissors", "paper",
           "paper", "rock", "scissors"),
         nrow = 3,
         ncol = 3,
         byrow = TRUE,
         dimnames = list(c("rock", "paper", "scissors"),
                         c("lose", "win", "draw")))

# fucking dynamic types, if I don't do it I can't use `[`
match_list <- cbind(strategy_guide$opponent, strategy_guide$outcome)

# Score for the match outcome
total_match <-
  outcome_score_mapping[strategy_guide$outcome] |>
  sum()

my_move <- 
  move_matrix[match_list]

total_move <-
  myShape_score_mapping[my_move] |>
  sum()

total_match+total_move
