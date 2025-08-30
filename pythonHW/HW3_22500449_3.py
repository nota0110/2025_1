words = ['apple', 'ash', 'baby', 'box', 'buzz', 'cat', 'cantus', 'church', 'dish', 'knife', 'lady', 'leaf', 'pitch', 'stimulus', 'taxi', 'wish', 'wolf']

plural = []

mode = 0

for word in words:
    match word[len(word)-1]:
        case 'y':
            word = word[0:len(word)-1] + 'ies'
        case 'f':
            word = word[0:len(word)-1] + 'ves'
        case 'fe':
            word = word[0:len(word)-2] + 'ves'
        case 'x'|'z':
            word = word[0:len(word)] + 'es'
        case 'h':
            if word[len(word)-2] == 'c' or 's':
                word += 'es'
            else:
                word = word + 's'
        case 's':
            if word[len(word)-2] == 'u':
                word = word[0:len(word)-2] + 'i'
            else:
                word = word + 'es'

        case _:
            word = word + 's'

    plural.append(word)

            

for i in range(len(words)-1):
    print(f'{words[i]} - {plural[i]}')
