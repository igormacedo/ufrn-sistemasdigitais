import sys
import socket
import time

try:
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
except socket.erro:
    print "Failed to create socket"
    sys.exit()

host = '192.168.0.12'
port = 8888

while(True):
    msg = "That is my message"

    try:
        s.sendto(msg, (host, port))
    except socket.error, msg:
        print "Error code: " + str(msg[0]) + " Message: " + msg[1]

    time.sleep(1)

