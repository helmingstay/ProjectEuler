"""
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
"""

### generator??
def fSeq(x, n):
    cache = {}
    while True:
        while ( x > 1 ):
            if x in cache:
                yield n + cache[x]
            else:
                n += 1
                if (x % 2 ==0):
                    x /= 2
                else:
                    x = 3*x + 1
                cache[x]=n
        yield(n)

def getSeqLen(n, doFresh):


## http://stackoverflow.com/questions/2474015/getting-the-index-of-the-returned-max-or-min-item-using-max-min-on-a-list
def index_fun(values, fun):
    return fun(range(len(values)),key=values.__getitem__)

toN = int(1e6)
print(range(toN))
seqs = [ fSeq(x, 1) for x in range(toN)]
ans = [ max(seqs), index_fun(seqs, max) ]
print(ans)
