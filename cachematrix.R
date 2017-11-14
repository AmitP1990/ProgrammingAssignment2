## A pair of function that is for caching the inverse of a matrix.
## Function creates a special matrix object that cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
Inverse <- Null
set <- function(y) {
x <<- y
Inverse <<- Null
}
        get <- function() x
        setInverse <- function(solveMatrix) Inverse <<- solveMatrix
        getInverse <- function() Inverse
        list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## Function computes the inverse of the special matrix returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        Inverse <- x$getInverse()
        if(!is.null(Inverse)) {
                message("getting cached data")
                return(Inverse)
       }
        data <- x$get()
        Inverse <- solve(data)
        x$setInverse(Inverse)
        Inverse
}
