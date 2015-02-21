#The prime factors of 13195 are 5, 7, 13 and 29.
#What is the largest prime factor of the number 600851475143 ?
is.divides <- function(x, denom) {
    (x %% denom == 0 ) & ((x %/% denom) > 1)
}

not.prime <- function(x, start.primes = c(2,3,5,7)) {
    ## a lot of the time
    if (x %in% start.primes ) return(FALSE)
    if (any(is.divides(x, start.primes))) return(TRUE)
    .max = sqrt(x)
    .test=tail(start.primes,1)
    while (.test <= .max ) {
        .test <- .test + 1
        if (!not.prime(.test)) {
            ## only test prime divisors
            if (is.divides(x, .test)) return(TRUE)
        }
    }
    ## tested all.
    return(FALSE)
}
       
#.num <- 13195
.num <- 600851475143 
.test <- round(sqrt(.num))
while (1) {
    if (!is.divides(.num, .test)){
        .test = .test-1
    } else if (!not.prime(.test)) {
        .ans = .test
        break
    } else { 
        .test = .test-1
    }
}
    
if (0) {
    ## testing on sequence
    .test <- seq(1, sqrt(num))
    .is.prime <- !sapply(.test, not.prime)
    .test <- .test[.is.prime]
    .ans <- .test[is.divides(.num, .test)]
}
