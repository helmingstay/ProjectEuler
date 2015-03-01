f.primes.to <- function(to, prime.vec=c(2,3)) {
    ## return a vec of all primes lte to
    ## start with an (gapless, ordered) vector of primes
    ##
    ## check for primes, ignore evens
    test <- seq(from=1, to=to, by=2) 
    ## step through numbers sequentially
    while (tail(prime.vec,1) <= to) {
        .divides <- (test %% prime
        ## no divisors, must be prime
        ## add to vec
        if (all( as.logical(test %% prime.vec))) {
            prime.vec <- c(prime.vec, test)
        }
        test <- test +1
    }
    return(prime.vec)
}


#.num <- 13195
.num <- 600851475143 
.limit <- round(sqrt(.num))
candidates <- rev(f.primes.to(.limit))
for (.prime in candidates) {
    print(.prime)
    if ((.num %% .prime) == 0) {
        .ans <- .prime
        break
    }
}
