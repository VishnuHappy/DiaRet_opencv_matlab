n, k = map(int, input().strip().split(' '))
a = list(map(int, input().strip().split(' ')))
x=[0]*n
j=1
for i in a:
    if j<n:
        x[n-k+j]=i
    else:
        x[j-n]=i
    j=j+1

print x