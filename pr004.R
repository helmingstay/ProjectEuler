## A palindromic number reads the same both ways. 
## The largest palindrome made from the product of 
## two 2-digit numbers is 9009 = 91 × 99.

## Find the largest palindrome made from the product of two 3-digit numbers.


f.is.palin <- function(x) {
    ## split into character vector of digits
    x.charvec <- strsplit(as.character(x),'')[[1]]
    ## test that forwards equals reverse
    return(identical(x.charvec, rev(x.charvec)))
}

test <- 100:999 %*% t(100:999)
## dont test symmetric cases
test <- test[!upper.tri(test)]
## test in decreasing order
test <- sort(as.vector(test), decreasing=T)

for (nn in test){
    if (f.is.palin(nn)) break
}
ans <- nn
