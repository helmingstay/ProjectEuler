## https://projecteuler.net/thread=7&page=8#198332
import math
def sieve(limit):
    ## initialize, true until disproven
    ret = [True] * limit
    ## start at 2
    ret[0] = False
    ret[1] = False
    
    ## return list
    l = []

    for i in range(2,limit):
        ## passes sieve, keep
        if ret[i]:
            l.append(i)
            for j in range(i*i,limit,i):
                ret[j] = False
    return l

nn = int(1e4)
## upper bound??
limit = int(nn * math.sqrt(nn))
primes = sieve(limit)
ans = primes[nn]
print(ans)
