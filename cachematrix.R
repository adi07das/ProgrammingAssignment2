## It caches the inverse of a matrix. Whenever a inverse function is called, the## cache is first checked and then the value is retrieved based on it.

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL ## initialise inverse to NULL
  set <- function(y){
    x <<- y
    inv <<- NULL ##setting inv to another environment
  }
  get <- function() x ##fetching value of matrix
  setInverse <- function(solveMatrix) inv <<- solveMatrix ##sets inverse of matr##ix
  getInverse <- function() inv ##fetch inverse of matrix
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	 inv <- x$getInverse() ##stores inverse in inv
  if(!is.null(inv)){ ##checking if cache has some value or not
    message("getting cached data")
    return(inv)
  }
  data <- x$get() ##fetching matrix data
  inv <- solve(data) ##calculating inverse
  x$setInverse(inv) ##setting the inv variable with inverse
  inv
}
