## This Functions are meant to cache a matrix and calculate its inverse


## This function is used to declare a new matrix and cache it

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


## This function calculates the inverse of the matrix. If it has been calculated
## before it only returns the cached inverse matrix.

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
  ## Return the matrix
  i
}