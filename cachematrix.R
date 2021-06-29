## Put comments here that give an overall description of what your
## functions do

## function to create a special "matrix" object; trully, it returns a list with the functions:
#1 get - returns the matrix
#2 set - set a new matrix
#3 setInvMat - sets the inverse matrix  
#4 getInvMat - returns the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInvMat <- function(solve) inv <<- solve
  getInvMat <- function() inv
  list(set = set, get = get,
       setInvMat = setInvMat,
       getInvMat = getInvMat)
}


## this function checks if the inverse matrix already stored in cache;
#if exists returns the inverse matrix
#else, store a new inverse matrix in cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInvMat()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInvMat(m)
  m
}
