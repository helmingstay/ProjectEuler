# By listing the first six prime numbers: 
# 2, 3, 5, 7, 11, and 13, we can see that the 6th 
# prime is 13.

#What is the 10 001st prime number?

source('helpers.R')
ans <- tail(f.primes.to(to=Inf, num=1e4+1), 1)
