## Implementation of a cache for matrix inversion

## A function which caches a matrix and its inverse
makeCacheMatrix <- function(mat = matrix()) {
  inv <- NULL
  
  set <- function(matData) {
    mat <<- matData
    inv <- NULL
  }
  get <- function() mat
  
  setInverse <- function(invData) inv <<- invData
  getInverse <- function() inv
  
  list(
    set = set,
    get = get,
    setInverse = setInverse,
    getInverse = getInverse
  )
}


## A function which calculates the inverse of a matrix and caches the result
## The passed matrix must be invertible
cacheSolve <- function(cacheMat, ...) {
  inv <- cacheMat$getInverse()
  if (!is.null(inv)){
    message("Getting cached data")
    return(inv)
  }
  
  mat <- cacheMat$get()
  inv <- solve(mat, ...)
  cacheMat.setInverse(inv)
  inv
}
