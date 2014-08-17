a <- matrix( c(4,3,3,2), nrow = 2, ncol = 2)
ainverse <- matrix(c(-2, 3, 3, -4), nrow = 2, ncol = 2)
aidentity <- a %*% ainverse
# verify that a * a-invers = identity matrix
identical(aidentity, diag(nrow =  dim(a)))

source('./cachematrix.R')
# create matrix with the inverse structure
test <- makeCacheMatrix(a)
# calculate or get cached inverse of a
testInverse <- cacheSolve(test) 

#verify inverse data
identical(ainverse, testInverse)
identical(a %*% testInverse, diag(nrow =  dim(a)))

# should print
# "returning cached data"
# after this line is executed
cacheSolve(test)
