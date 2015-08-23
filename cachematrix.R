## This Functions are meant to cache a matrix and calculate its inverse


## This function creates a special "matrix",
## wich is really a list containing a function to
## set the value of the matrix
## get the value of the matrix
## set the value of the matrix
## get the value of the matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  
  get <- function() x
  setInverse <- function(inverse) i <<- inverse
  getInverse <- function() i

  
  list( set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## This function calculates the inverse of the special matrix. 
## the special matrix wich created with the makeCacheMatrix function.
## It first checks to see if the inverse has already been calculated.
## if so, it gets the inverse from the cache
## otherwise it calculates the inverse of the matrix and sets the value of the inverse
## in the cache via the setinverse function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getInverse()
  if( !is.null(i) ) {
    message( "getting cached data" )
    return(i)    
  }
  
  data <- x$get()
  i <- solve(data, ...)
  x$setInverse(i)
  i
}