df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
df <- df[c(2, 7, 11, 17, 23)]
df[, c(3, 4, 5)] <- sapply(df[, c(3, 4, 5)], as.numeric)

state <- "AK"
outcome <- "heart failure"
num <- 10L

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  
  ## Check that state and outcome are valid
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  states <- unique(df$State)
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  if (!(state %in% states)) {
    stop("invalid state")
  }
  
  if (!(outcome %in% outcomes)) {
    stop("invalid outcome")
  }
  
  df2 <- df[df$State == state, ]
  
  if (outcome == "heart attack") {
    df2 <- df2[order(df2[, 3], df2[, 1]), ]
    df2 <- df2[!is.na(df2[, 3]), ]
  }
  else if (outcome == "heart failure") {
    df2 <- df2[order(df2[, 4], df2[, 1]), ]
    df2 <- df2[!is.na(df2[, 4]), ]
  }
  else {
    df2 <- df2[order(df2[, 5], df2[, 1]), ]
    df2 <- df2[!is.na(df2[, 5]), ]
  }
  
  if (num == "best") {
    num <- 1L
  }  
  else if (num == "worst") {
    num <- nrow(df2)
  }
  else {
    num <- as.numeric(num)
  }
  
  df2[num, 1]
}