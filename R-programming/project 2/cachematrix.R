## solution to Assignment: Caching the Inverse of a Matrix

## creates a wrapper object around a matrix that can optionally store
## its inverse. exposes setters and getters for both. invalidates
## cache on set.
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinv <- function(inv) inverse <<- inv
  getinv <- function() inverse
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## computes the inverse of a matrix with caching.
## expects a wrapped matrix as returned from makeCacheMatrix. first
## checks cache in the object passed in for the presence of the result
## of a previous run. if found returns that, otherwise computes the
## result and then stores it in the cache as well as returning it to
## the caller
cacheSolve <- function(x) {
  inverse <- x$getinv()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data)
  x$setinv(inverse)
  inverse
}
