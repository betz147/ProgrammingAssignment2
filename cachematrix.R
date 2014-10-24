# I create a pair of functions that cache the inverse of a matrix
# First, the function makeCacheMatrix creates a special matrix object that can cache its inverse
makeCacheMatrix <- function( m = matrix() ) {
  
# Initialisation of the inverse property
  y <- NULL
  
# Method to set the matrix
  set <- function( matrix ) {
  m <<- matrix
  y <<- NULL
  }
  
# Method the get the matrix
  get <- function() {
  
# Returns the matrix
  m
  }
  
# Method to set the inverse of the matrix
  setInverse <- function(inverse) {
  y <<- inverse
  }
  
# Method to get the inverse of the matrix
  getInverse <- function() {
  
# Return the inverse property
  y
  }

# Return a list of the methods
  list(set = set, get = get,
  setInverse = setInverse,
  getInverse = getInverse)
}

# Next, I compute the inverse of the special matrix returned by "makeCacheMatrix" function above.
# If the inverse has already been calculated, then the "cacheSolve" fucntion should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  
# Return the inverse of x as a matrix
  m <- x$getInverse()
  
# return the inverse if already set
  if( !is.null(m) ) {
  message("get cached data")
  return(m)
  }
  
# get the matrix from our object
  data <- x$get()
  
# matrix multiplication to calculate the inverse
  m <- solve(data) %*% data
  
# set the inverse to the object
  x$setInverse(m)
  
# return the matrix
  m
}
