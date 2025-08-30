
import random

def encode(file): #영문자 대/소문자, 숫자 : random(1~99)(중복 없이)로 지정, 한글자씩 /로 구분, 파일 저장
    #dictKeys가 되는 스트링을 먼저... 저장
    try:
        inputFile = open(file, 'r')
    except:
        print("파일을 여는 과정에서 문제가 발생했습니다. 파일 명을 확인해주세요!")
        exit()
    
    print(" ! encoding Started ! ")
    d = {}
    v = []
    dictKeys = ' qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890'
    while len(v)<len(dictKeys):
        newV = random.randint(1, 99)
        if newV not in v:
            v.append(newV)
    d[' '] = ' '
    for index in range(len(dictKeys)):
        d[dictKeys[index]] = v[index]
    
    
    encodedText = '/'
    for line in inputFile.readlines():
        for char in line:
            if char in d:
                encodedText += str(d[char])
            else:
                encodedText += char
            encodedText += '/'

    #print(encodedText) #콘솔 체크용
    encodedFile = open('encodedFile.txt', 'w')
    encodedFile.write(encodedText)

    print(" * encoding Finished * ")
    inputFile.close()
    encodedFile.close()
    return d


def decode(codeDict):
    print(" ! decoding started ! ")
    codeDict = codeDict #딕셔너리를 받아와
    dictValueList = list(codeDict.values()) #그 값을 리스트로 저장하고
    #print(sorted(dictValueList)) #확인용
    #print(type(dictValueList[4])) #밸류는 int형임!!
    encodedFile = open('encodedFile.txt', 'r') #인코디드 파일을 열어
    decodedText = '' #디코디드 텍스트를 초기화해
    for line in encodedFile.readlines(): #인코드 파일을 한줄씩 읽는데
        while '///' in line: #원글에 /가 있으면 ///가 있을 거니까
            line = line.replace('///','/slash/',1)#사이의 /를 slash로 바꿔줘(하나씩)

        for i in line.split('/'): #i를 /를 기준으로 나눠
            #print(f'i = {i}, type(i) = {type(i)}') #확인용
            if i == 'slash': #i가 slash
                decodedText += '/' #디코디드텍스트에 / 추가
            elif i.isdigit() and int(i) in dictValueList: #여기서 막히는데; i가 딕트밸류리스트에 있으면
                #아니 자료형문제였네 아니 분명히 스트링으로 정리를 했엇는데;;
                #print('i in value list!') #확인 출력
                for key, value in codeDict.items(): #딕셔너리 아이템을 쌍으로 받아와서
                    if i == str(value): #그 밸류가 i 와 같으면
                        #print(key, value, i)
                        decodedText += key # 그 밸류의 키를 텍스트에 추가
                        break
            else:
                print(f"not alpha or slash : {i}")
                decodedText += i
    #print('decodedText = ',decodedText)
    decodedFile = open('decodedFile.txt', 'w')
    decodedFile.write(decodedText)

    print(" * decoding Finished * ") 
    encodedFile.close()
    decodedFile.close()

    return 'decodedFile.txt'

def check(inputFileName, decodedFileName):
    checked = True
    input = open(inputFileName, 'r')
    output = open(decodedFileName, 'r')

    inputLines = input.readlines()
    outputLines = output.readlines()
    for i in range(len(inputLines)):
        if inputLines[i] != outputLines[i]:
            checked = False
            break
    if checked:
        print("Two files are same")
    else:
        print("decoding issue")
    input.close()
    output.close()
    return 'checked'


try :
    inputFileName = input("input file name : ")
    codeDict = encode(inputFileName)
    decodedFileName = decode(codeDict)
    check(inputFileName, decodedFileName)
except:
    print("진행 과정에서 문제가 생겼습니다. 다시 시도해주세요!")