#Problem 1
#Multiples of 3 and 5

#If we list all the natural numbers below 10 that are 
#multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these
#multiples is 23.

#Find the sum of all the multiples of 3 or 5 below 1000.
## need to avoid double-counting multiples of both
.base = c(3,5, 3*5)
## test
# .bound = 10-1 
## actual problem
.bound = 1e3-1
## mod division - how high do we need to go
.n.base = (.bound %/% .base)
## use formula to sum to n, rather than generating sequence
f.sum.to = function(nn) (nn*(nn+1))/2
## vectorized sum + mult
.ans <- f.sum.to(.n.base) * .base
## subtract double-counts
.ans <- .ans[1] + .ans[2] - .ans[3]


