## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # i stores the cached inverse matrix
  i <- NULL
  
  # Set for the matrix
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  # Get for the matrix
  get <- function() x
  # Set for the inverse
  seti <- function(inverse) i <<- inverse
  # Get for the inverse
  geti <- function() i
  
  # Return the matrix
  list(set = set, get = get, seti = seti, geti = geti)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  i <- x$geti()
  # if inverse is calculated it will give it back
  if(!is.null(i)) {
    message("returning cached matrix")
    return(i)
  }
  # if inverse is not calculated then it calculates
  d <- x$get()
  i <- solve(data, ...)
  # cache
  x$seti(i)
  # return
  i
}
