import socket
ip = socket.gethostbyname("www.qq.com")
sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
sock.connect(('www.qq.com',80))
sock.send("GET / HTTP/1.1\r\nConnection:Close\r\n\r\n")
while True:
    buf = sock.recv(1024)
    if buf > "":
        print buf
    else:
        break
sock.close()
print "GET / HTTP/1.1\r\nHost: " + ip + "\r\nConnection:Close\r\n\r\n"


HOST = '127.0.0.1'    # The remote host
PORT = 21              # The same port as used by the server
myencoding = "latin1" #Latin1是ISO-8859-1的别名
CRLF = '/r/n' #发送FTP命令中必须包含
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))
file = s.makefile('r', encoding = myencoding)
print(repr(file.readline()))

s.sendall(('USER 123456' + CRLF ).encode(myencoding)) #'USER 123456'与CRLF之间不可有空格，否则FTP服务器不识别。
print(repr(file.readline()))
s.sendall(('PASS 654321' + CRLF ).encode(myencoding))
print(repr(file.readline()))
s.sendall(('PWD ' + CRLF ).encode(myencoding))
print(repr(file.readline()))

#print(repr(s.recv(1024)))
#s.send(b'QUIT /r/n') #此方式也可行。直接发送字节串，send返回发送的字节串长度
s.sendall(('QUIT ' + CRLF ).encode(myencoding)) #发送编码之后的字节串，发送成功则返回None
print(repr(file.readline()))
print(repr(file.readline()))
print(repr(file.readline()))
print(repr(file.readline()))
file.close()
s.close()
