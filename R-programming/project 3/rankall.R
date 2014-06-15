rankall <- function(outcome, num = "best") {
  outcomes <- c('heart attack', 'heart failure', 'pneumonia')
  indices <- c(11, 17, 23)
  
  if (!outcome %in% outcomes) stop("invalid outcome")
  
  data <- read.csv("outcome-of-care-measures.csv")
  
  i <- indices[match(outcome, outcomes)]
  hospitals <- data[, c(2, 7, i)]
  hospitals[, 3] <- as.numeric(as.character(hospitals[, 3]))
  hospitals <- na.omit(hospitals)
  names(hospitals) <- c("hospital", "state", "rate")
  
  if (num == "best") {
    num <- 1
  } else if (num == "worst") {
  } else {
    num <- as.numeric(num)
    if (is.na(num)) {
      stop("invalid num")
    } else if (num > nrow(hospitals)) {
      return(NA)
    }
  }
  
  results <- NULL
  
  for(state in levels(hospitals$state)) {
    hospitals_for_state <- hospitals[hospitals$state == state, ]
    
    if (num == "worst") {
      n <- nrow(hospitals_for_state)
    } else {
      n <- num
    }
    result <- hospitals_for_state[order(hospitals_for_state$rate, hospitals_for_state$hospital), c(1, 2)][n, ]
    result$state <- rep(state, nrow(result))
    results <- rbind(results, result)  
  }
  
  rownames(results) <- NULL
  
  return(results)
}