## These functions allows the user to compute the inverse of
## a matrix, a time-consuming process, especially if used in
## a loop. In this function we cache the computed values 
## instead of them being recomputed, saving up time.

## In this function we cache the inverse of the matrix by
## assigning a value to an object in an environment that is
## different from the current environment.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL #Creates a null matrix
        set <- function(y) { #Set the value of the matrix
                x <<- y #Assign a matrix to an object in a different environment
                inv <<- NULL #Assign the null matrix to an object in a different environment
        }
        get <- function() x #get the value of the matrix
        setinv <- function(solve) inv <<- solve #set the value of the inverse
        getinv <- function () inv #get the value of the inverse
        list(set = set, get = get, setinv = setinv,
             getinv = getinv) #creates a list containing the cached values

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
