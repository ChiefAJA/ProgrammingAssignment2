## Put comments here that give an overall description of what your
## functions do
## These are 2 functions that are used to create a special
## object that stores a matrix and caches it's inverse 

## Write a short comment describing this function
## creates a special matrix object that can cache its 
## inverse 
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



## Write a short comment describing this function
## Computes the inverse of the special matrix returned
## by makeCacheMatrix above. If the inverse has already
## been calculated then the inverse will be retrieved 
## from the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
