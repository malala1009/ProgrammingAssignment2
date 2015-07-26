## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  ## Initialize the inverse property
  i <- NULL
  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  
  ## Method the get the matrix
  get <- function() {
    ## Return the matrix
    m
  }
  
  ## Way to set the inverse of the matrix
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  ## Way to get the inverse of the matrix
  getInverse <- function() {
    ## Back the inverse property
    i
  }
  
  ## Back a list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getInverse()
  if( !is.null(i) ) {
    message("getting cached data")
    return(i)    
  }
  data <- x$get()
  ## Compute the inverse via matrix multiplication
  i <- solve(data) %*% data
  ## Set the inverse to the object
  x$setInverse(i)
  ## Coming back the matrix
  i
}