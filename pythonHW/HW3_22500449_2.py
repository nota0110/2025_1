'''
# 문제 3-2
작성자 : 윤민정
작성일 : 2025.04.14
작성 목적 : 문자열 중 자음들 중 대문자/소문자 분리하기.
'''

consonants = 'BbCcDdFfGgHhJjKkLlMmNnPpQqRrSsTtVvWwXxYyZz'
vowels = 'AaEeIiOoUu'

charConsonants = ''
charVowels = ''
charUpper = ''
charLower =''
needStr = True


while needStr:
    theString = input("20글자 이상의 문자열을 입력하시오 : ")
    if len(theString) >= 20:
        needStr = False
    else:
        continue

for char in theString:

    if char.isupper() == True:
        charUpper += char
    elif char.islower() == True:
        charLower += char
    else:
        continue

    if char in consonants:
        charConsonants += char
    elif char in vowels:
        charVowels += char
    else:
        continue






print(f'자음만 찾으면, {charConsonants}\n{charUpper},대문자 {len(charUpper)}개\n{charLower},소문자 {len(charLower)}개')

