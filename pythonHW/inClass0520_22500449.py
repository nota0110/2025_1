#재귀함수 연습!
def fact(n, factList):
    f = 1
    for i in range(n,0,-1):
        f *= i
    factList.append(f)

    if n == 1:
        f = 1
        return factList
    else :
        return fact(n-1,factList)
    
        

print(fact(5,[]))