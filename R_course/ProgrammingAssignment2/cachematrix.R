## these two functions provide matrix objects that exploit caching for non-redudant computation of the matrix' inverse


## this functions creates a new matrix object that stores the matrix itself and its inverse, it further provides methods to get and set both (matrix and inverse)

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y){
                x<<-y
                m<<-NULL
        }
        get <- function() x
        setinv <- function(inv) inv <<- inv
        getinv <- function() inv
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## cached calculation of a matrix inverse, using a cachable matrix type created via makeCacheMatrix 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if(!is.null(inv)){
                message("retrieving cached value...")
                return(inv)
        }
        mat <- x$get()
        inv <- solve(mat)
        x$setinv(inv)
        inv
}

##to test the code:


##simple test on diagonal matrix

##generate a diagonal matrix
#mat <- matrix(c(2,0,0,0,3,0,0,0,4), nrow = 3, ncol = 3)

##make cachable matrix
#mat1 <- makeCacheMatrix(mat)

##calculate inverse
#cacheSolve(mat1)
##second time use cached result
#cacheSolve(mat1)


## test with symmetric matrix
#mat <- matrix(c(2,-1,0,-1,2,-1,0,-1,2), nrow = 3, ncol = 3)
#mat2 <- makeCacheMatrix(mat)
#cacheSolve(mat2)
#cacheSolve(mat2)

