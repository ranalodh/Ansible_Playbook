#!/usr/bin/python
import os
print('1. Ping Google')
print('2. Ping Yahoo')
print('3. Ping custom URL')

key = input('Input your choice: ')
if key == 1:
    os.system("ping google.com")
elif key == 2:
    os.system("ping yahoo.com")
elif key == 3:
    url=raw_input('Enter URL: ')
    os.system("ping %s" %url)
else:
    print("invalid input")