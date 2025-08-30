def CountFile(filename):
    
    try:
        f = open(filename, 'r')
    except:
        print("파일을 여는 과정에서 문제가 발생했습니다! 파일 이름을 확인해주세요.")
        return CountFile(input("파일 이름 = "))
    words = 0
    lettersNoSpace = 0
    lettersWithSpace = 0
    lines = f.readlines()
    for line in lines:
        if line[-1] == '\n':
            line = line[:-1]
        #print(line.split())
        #print(f"{line}\nㄴ In this string, there's {len(line.split())}words, {len(line)} letters, and {len(line)-len(line.split())} letters(exclude space)")
        lettersWithSpace += len(line)
        words += len(line.split())
        for char in line:
            if not char.isspace():
                lettersNoSpace += 1

    outputText = f'단어 수 : {words}\n문자 수(공백제외): {lettersNoSpace}\n문자 수(공백포함): {lettersWithSpace}\n줄 수: {len(lines)}\n'
    try:
        output = open('output.txt', 'w')
        output.write(outputText)
    except:
        print('output.txt 파일을 만들 수 없습니다. 터미널을 확인해 주세요!')
    return None

def readOutput():
    try:
        f = open('output.txt', 'r')
    except:
        print("'output.txt'파일을 찾을 수 없습니다. 다시 시도해주세요!")
        exit()
    for line in f.readlines():
        print(line)



CountFile('input.txt')
readOutput()


'''print(f'just f seems like : {f}')
print(f'readline() function returns this : \n{f.readline()}')
print(f'readlines() function returns this : \n{f.readlines()}')
#wow~~'''
    