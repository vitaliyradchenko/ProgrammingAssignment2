## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

    #Creates an inverse "matrix", which is really a list containing a 
    #function to
    #1.set the value of the matrix
    #2.get the value of the matrix
    #3.set the inverse matrix
    #4.get the inverse matrix
    
    
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
    
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    #The following function calculates the inverse matrix of the special 
    #"matrix" created with the above function. However, it first 
    #checks to see if the mean has already been calculated. If so, 
    #it gets the inverse matrix from the cache and skips the computation. 
    #Otherwise, it calculates the inverse matrix of the data and sets the
    #inverse matrix in the cache via the setsolve function.
    
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
    
}
