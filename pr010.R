# Sum of all primes below 2mill

.to <- 2e6
## all candidates to limit, skip evens
.primes <- c(2, seq(3, .to, by=2))
## start with 3, preincrement
.this <- 3
.counter <- 2
while (.this^2 < .to) {
    ## index vector
    .is.mult <- .primes %in% seq(from=.this^2, to=.to, by=.this)
    ## remove multiples from candidate vector
    .primes <- .primes[!.is.mult]
    ## pull the next prime
    .counter = .counter + 1
    .this <- .primes[.counter]
}
ans <- sum(.primes)
