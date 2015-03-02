## A Pythagorean triplet is a set of three natural numbers, 
## a < b < c, for which, a2 + b2 = c2

## For example, 32 + 42 = 9 + 16 = 25 = 52.

## There exists exactly one Pythagorean triplet for which 
## a + b + c = 1000.  Find the product abc.

## min a = 1, b=2

## use adply - take array, return data.frame
require(plyr)

## this we seek
.sum <- 1e3
aa <- 1:floor(.sum/3)
bb <- 2:floor(.sum/2)
## precompute squares
bb.sq <- bb^2

## for each element of aa
ans <- adply(aa, 1, function(.aa) {
    ## vectorized in bb / bb.sq 
    ## check if a + b + c = sum
    .test <- .aa + bb + sqrt(.aa^2 + bb.sq)
    if( any(.test == .sum)){
        ## we have a winner!
        ## make a nice return object
        ret <- data.frame(a=.aa, b=bb[.test==.sum])
        ret <- within(ret, {
            c <- .sum-a-b
            prod <- a*b*c
        })
        return(ret)
    } else{ 
        ## move along, nothing to see here
        return()
    }
})

