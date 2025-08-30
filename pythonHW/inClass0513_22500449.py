d = {0:'cero', 1:'uno', 2:'dos', 3:'tres', 4:'cuatro',5:'cinco',6:'seis',7:'siete',8:'ocho',9:'nueve'}

def getSp(n):
    sp = ''
    for i in n:
        sp += f'{d[int(i)]} '
    return(sp)

def spToNum(sp):
    tel = ''
    for j in sp.split():
        for key in d.keys():
            if j in d[key]:
                tel += f'{key} '
    return(tel)
        

n = input("전화번호 입력")
print(f'스페인어로 바꾸면, {getSp(n)} \n다시 숫자로 바꾸면, {spToNum(getSp(n))}')



