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
myencoding = "latin1" #Latin1��ISO-8859-1�ı���
CRLF = '/r/n' #����FTP�����б������
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))
file = s.makefile('r', encoding = myencoding)
print(repr(file.readline()))

s.sendall(('USER 123456' + CRLF ).encode(myencoding)) #'USER 123456'��CRLF֮�䲻���пո񣬷���FTP��������ʶ��
print(repr(file.readline()))
s.sendall(('PASS 654321' + CRLF ).encode(myencoding))
print(repr(file.readline()))
s.sendall(('PWD ' + CRLF ).encode(myencoding))
print(repr(file.readline()))

#print(repr(s.recv(1024)))
#s.send(b'QUIT /r/n') #�˷�ʽҲ���С�ֱ�ӷ����ֽڴ���send���ط��͵��ֽڴ�����
s.sendall(('QUIT ' + CRLF ).encode(myencoding)) #���ͱ���֮����ֽڴ������ͳɹ��򷵻�None
print(repr(file.readline()))
print(repr(file.readline()))
print(repr(file.readline()))
print(repr(file.readline()))
file.close()
s.close()
