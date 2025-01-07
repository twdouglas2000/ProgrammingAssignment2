#The following functions are designed for the user to input a matrix (presumed 
#that [,1] == [1,] and no NA values are present).
#This matrix as well as its inverse will then be stored in the cache. 
#This information can then be retrieved at any time without needing to be recalculated using the functions defined in the makeCacheMatrix function.
#These functions can hold multiple matrices for the data to be cached


#The makeCacheMatrix function coerces x as a matrix and stores the matrix 
#and produces four functions that can be used outside of the makeCacheMatrix function
makeCacheMatrix <- function(x = matrix()) {
          m <- NULL
          set <- function(y){
            x <<- y
            m <<- NULL
          }
          get <- function() x
          setinverse <- function(solve) m <<- solve
          getinverse <- function () m
          list(set = set, get = get,
               setinverse = setinverse,
               getinverse = getinverse)
  
}



#The cacheSolve function takes the matrix from the makeCacheMatrix function (as well as 
#any additional arguments), stores it and its matrix inverse, and returns the matrix inverse. 
#Now the matrix and inverse can be recalled using the four functions defined in the makeCacheMatrix function.
cacheSolve <- function(x, ...) {
      m <- x$getinverse()
      if (!is.null(m)){
            message("fetching cached code")
            return(m)
      }
      data <- x$get()
      m <- solve(data)
      x$setinverse(m)
      m
}



