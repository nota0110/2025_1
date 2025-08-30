'''hw7 - 1
작성자 윤민정
작성일 26.06.13
작성 목적 - tkinter 활용(회문 확인)
'''

from tkinter import *
from math import *

def palin(s):
  s = s.lower()
  preprocessed = ''
  for char in s:
    if char.isalpha():
      preprocessed += char
  reversed_str = ''
  for i in range(len(preprocessed)-1, -1, -1):
    reversed_str += preprocessed[i]
  return preprocessed == reversed_str

def check():
  user_input = textInput.get()
  isPalin = palin(user_input)
  if isPalin:
    resultLabel.config(text="True", fg="blue")
  else:
    resultLabel.config(text="False", fg="red")

root = Tk()
root.geometry("300x200+100+100")

manualLabel = Label(root, text="input a string to check palindrome or not")
manualLabel.pack()

textInput = Entry(root)
textInput.pack()

checkButton = Button(root, text="Check", command=check)
checkButton.pack()

resultLabel = Label(root, text="")
resultLabel.pack()

root.mainloop()
