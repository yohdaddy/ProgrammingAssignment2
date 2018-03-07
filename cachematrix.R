## Programming Assigment 2: Example of lexical scoping using a matrix inversion function
## 

## A function that returns functions within a list to the parent environment
## 
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(z) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinver <- function(inver) m <<- inver
  getinver <- function() m
  list (set = set, get = get, setinver = setinver, getinver = getinver)
}


## Retrieves from cache or calculates the inverse of the matrix object passed as an argument in makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinver()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinver(m)
  m
  }
