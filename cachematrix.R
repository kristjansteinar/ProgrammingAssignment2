## Functions to create a datastructure that holds both a matrix and its
## inverse, thereby saving computation time.
## 
## It is assumed that the matrix supplied is always invertible.


## Creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL

    get <- function(){
        x
    } 

    set <- function(matrix) {
        x <<- matrix
        i <<- NULL
    }

    getInverse <- function() {
        i
    }

    setInverse <- function(inverse) {
        i <<- inverse
    }

    list(get = get,
        set = set,
        getInverse = getInverse,
        setInverse = setInverse
       )
}


## Computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed), 
## then cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getInverse()
    if( !is.null(inv) ) {
        message("returning cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setInverse(inv)
    inv
}
