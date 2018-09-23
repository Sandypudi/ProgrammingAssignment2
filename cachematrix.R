## Both functions together cache the inverse of a matrix

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL ## Initialize the inverse property
        set <- function (y) {
        x <<- y ## Sets the argument for makeCacheMatrix as m
        inv <<- NULL 
        }
        ## resets the cached value of inv to NULL when a matrix is entered
        get <- function (){
                x ## returns the matrix set by set function
        }
        setinverse <- functin (inverse){
                inv <<- inverse ## Set the inverse of the matrix
        }
        getinverse <- function() {
                inv ## Return the inverse property
        }
        ## Return a list of the methods
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## This function computes the inverse of the matrix created by the 
## "makeCacheMatrix". It retrieves the inverse value from the cache, if it has
## been already calculated and the matrix has not changes. This will save the
## "cost involved in computing" the inverse of a matrix. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        
        ## Just return the inverse if its already set, if value of inv is NULL
        
        if( !is.null(inv) ) {
                message("getting cached data")
                return(inv)
        }
        ## Get the matrix from our object
        data <- x$get()
        
        ## Calculate the inverse using matrix multiplication
        inv <- solve(data)
        ## and store it in the cache for the next time
        x$setinverse(inv) ## stores through the argument for setinverse
        inv ## return the inverse of matrix x
}
