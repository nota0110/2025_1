from tkinter import *
from tkinter import ttk
import sys

def hello(event):
    print("single click, button")

def quit(event):
    print("double click, stop")
    sys.exit()

widget = Button(None, text = "Mouse Clicks")
widget.pack()
widget.bind('<Button-1>', hello)
widget.bind('<Double-1>', quit)

mainloop()