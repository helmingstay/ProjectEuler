f.primes.to <- function(to, num=Inf, .nalloc=100) {
    ## return a vec of all primes lte to
    ## start with 2 primes
    .init=c(2,3)
    .count = 2
    ##
    ## check for primes, ignore evens
    .nalloc.init <- max(.nalloc-.count, 0)
    prime.vec <- c(.init, rep(NA, .nalloc.init))
    test <- 3+2
    ## step through numbers sequentially
    while (test <= to && .count<num){
        ## grow return vector as-needed
        if ((.count %% .nalloc) == 0) {
            prime.vec = c(prime.vec, rep(NA, .nalloc))
        }
        ## no divisors, must be prime
        ## add to vec
        test.index <- which(prime.vec[1:.count] < sqrt(test))
        if (all( (test %% prime.vec[test.index])>0)) {
            .count <- .count + 1
            prime.vec[.count] <- test
        }
        ## skip evens
        test <- test + 2
    }
    return(prime.vec[1:.count])
}


if(F){
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
}
