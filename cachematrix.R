## Put comments here that give an overall description of what your
## functions do
## These are 2 functions that are used to create a special
## object that stores a matrix and caches it's inverse 

## Write a short comment describing this function
## creates a special matrix object that can cache its 
## inverse 
makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y){
    x <<- y
    s <<- NULL
  }
  get <-function() x
  setSolve <- function(solve) s <<- solve
  getSolve <- function() s 
  list(set = set, get = get, 
       setSolve = setSolve, getSolve = getSolve)
}


## Write a short comment describing this function
## Computes the inverse of the special matrix returned
## by makeCacheMatrix above. If the inverse has already
## been calculated then the inverse will be retrieved 
## from the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s <- x$getSolve()
  if(!is.null(s)){
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data)
  x$setSolve(s)
  s
}

