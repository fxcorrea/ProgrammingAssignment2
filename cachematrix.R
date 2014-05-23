## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # if an object is called without a method
  m <- NULL
  
  #1st function of list 
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  #if we don't pass argument x is an empty vector
  
  #2nd function of list
  #grabs vector stored in x and returns it.
  get <- function() x
  
  #3rd functionm
  setinv <- function(inv) m <<- inv
  
  #4th function
  getinv <- function() m
  #returns solve
  
  #do a list
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  
  #if the returned cache has anything 
  m <- x$getinv()
  #return 
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  
  #solve function (return)
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}
