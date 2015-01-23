## These functions allow the user to compute the inverse of 
## a matrix, a time-consuming process, especially if used 
## in a loop. In this function we cache the computed values 
## instead of them being recomputed, saving up time.

## In this function we cache the inverse of the matrix by 
## assigning a value to an object in an environment that is 
## different from the currentenvironment.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL #Creates a null matrix
        set <- function(y) { #Set the value of the matrix
                x <<- y #Assign a matrix to an object in a different environment
                inv <<- NULL #Assign the null matrix to an object in a different environment
        }
        get <- function() x #get the value of the matrix
        setinv <- function(solve) inv <<- solve #set the value of the inverse of the matrix
        getinv <- function () inv #get the value of the inverse of the matrix
        list(set = set, get = get, setinv = setinv,
             getinv = getinv) #creates a list containing the cached values
}


## This function calculates the inverse of the matrix, but
## first checks if the inverse has already been calculated.

cacheSolve <- function(x, ...) {
        inv <- x$getinv() # gets the inverse of the matrix if it has already been calculated
        if(!is.null(inv)) {
                message ("getting cached data") #if the inverse has been calculated returns this message
                return (inv)
        }
        data <- x$get() #gets the matrix stored in the other function
        inv <- solve(data, ...) #Calculates the inverse of the matrix
        x$setinv(inv) #stores the inverse of the matrix in the cache
        inv #returns the inverse of the matrix
}


## To run, first store a matrix in the cache using makeCacheMatrix() function, then run the stored matrix in cacheSolve().
## Example
## >m <- matrix(1:4, 2, 2)
## >store <- makeCacheMatrix(m)
## >cacheSolve(store)