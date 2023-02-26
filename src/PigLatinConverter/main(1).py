word = input('Input word to convert into Pig Latin: ')
vowels = ('a', 'e', 'i', 'o', 'u', 'y', 'A', 'E', 'I', 'O', 'U', 'Y')
def findVowel(q):
  for index, char in enumerate(q):
    if (char in ('y','Y') and index == 0):
      continue
    if char in vowels:
      return index
  raise OSError('No vowel found')

def convertPig(w,p):
  if p > 0 :
    cutWord = word[p:]
    firstFew = word[:p]
    return (cutWord + '-' + firstFew + 'ay')
  else: 
    return (w + '-yay')
#print(findVowel(word))
#print(word)


print('Your word in pig latin is: ' + convertPig(word,findVowel(word)))

  



#firstLetter = word[0:1]
#print('first letter: ' + firstLetter)

#print('that word is '+ str(len(word)) + ' letters long!')
txt = ("hello my name is / zack")
print(txt)
