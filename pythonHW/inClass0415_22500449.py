needStr = True
result =[]

while needStr:
    theString = input("10글자 이상의 문자열을 입력하시오 : ")
    if len(theString) >= 10:
        needStr = False
    else:
        continue

shiftString = (theString.swapcase()).replace(' ','*')
print(shiftString)
'''

word =''

for char in shiftString:
    if char.islower() == True:
        if word != '':
            result.append(word)
        word = char
    else:
        word += char
    #print(f'{char}, {word}')
result.append(word)
    
print(f'입력 문장 : {theString} \n변환 후 : {shiftString}\n리스트 : {result}')
'''
#The Beauty and THE bEAST

word =''

for char in shiftString:
    if char.islower() == True:
        if word != '':
            result.append(word)
            word = ''

    word += char
    #print(f'{char}, {word}')
result.append(word)

print(f'입력 문장 : {theString} \n변환 후 : {shiftString}\n리스트 : {result}')