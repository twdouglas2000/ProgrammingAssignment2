#The following functions are designed for the user to input a matrix (presumed 
#that x[,1] == x[1,] and no NA values are present).
#This matrix as well as its inverse will then be stored in the cache. 
#This information can then be retrieved at any time without needing to be recalculated using the functions defined in the makeCacheMatrix function.


#The makeCacheMatrix function coerces x as a matrix and stores the matrix 
#and produces four functions that can be used outside of the makeCacheMatrix function
makeCacheMatrix <- function(x = matrix()) {
          matr <- NULL
          
          #assigns new value to y and resets matr to NULL for next matrix in function
          set <- function(y){
            x <<- y
            matr <<- NULL
          }
          
          #returns value of x
          get <- function() x
          
          
          #assigns inv to matr outside of function
          setinverse <- function(inv) matr <<- inv
          
          
          #returns the value of matr
          getinverse <- function () matr
          
          
          #makes these defined functions accessible outside of the "makeCacheMatrix()"
          list(set = set, get = get,
               setinverse = setinverse,
               getinverse = getinverse)
  
}



#The cacheSolve function takes the matrix from the makeCacheMatrix function (as well as 
#any additional arguments), stores it and its matrix inverse, and returns the matrix inverse. 
#Now the matrix and inverse can be recalled using the four functions defined in the makeCacheMatrix function.
cacheSolve <- function(x, ...) {
  
      #calls for the inverse of the chached matrix and assigns it to matr
      matr <- x$getinverse()
      
      
      #if matr has a value then the inverse has been already been cached 
      if (!is.null(matr)){
            message("fetching cached code")
            return(matr)
      }
      
      #cached matrix is called and assigned
      data <- x$get()
      
      #inverses the cached matrix
      matr <- solve(data)
      
      #caches the inversed matrix
      x$setinverse(matr)
      
      #returns the inversed matrix
      matr
}


