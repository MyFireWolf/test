"""
    ʵ��ͨ�� socket����ҳ������.... Host:www.qq.com���ͷһ��Ҫ���������ͣ������ò���ҳ�棬��õ��ǳ����ҳ��.....
    http //www.qq.com
    host-->httplib.Http(host) www.qq.com
    msg GET / HTTP/1.0
    Host: www.qq.com
    User-Agent: Python-urllib/1.17
    
    
    HTTP/1.1 200 OK
    Server: squid/3.1.18
    Date: Tue, 05 Jun 2012 01:41:03 GMT
    Content-Type: text/html; charset=GB2312
    Connection: close
    Vary: Accept-Encoding
    Expires: Tue, 05 Jun 2012 01:56:03 GMT
    Cache-Control: max-age=900
    Vary: Accept-Encoding
    X-Cache: HIT from rainny.qq.com
    
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta name="description" content="��Ѷ��(www.QQ.com)���й���������������Ż���վ������Ѷ��˾�Ƴ��ļ�������Ϣ���������������ֲ�Ʒ�ͻ�������Ϊһ��Ĵ����ۺ��Ż���վ����Ѷ��������ȫ�����û���������Ϊ��ߴ������ͻ����ԣ�Ȩ����������ʱ�еĻ�����ý��ƽ̨��ͨ��ǿ���ʵʱ���ź�ȫ���������Ϣ��Ѷ����Ϊ�й������ڼƵĻ������û��ṩ���д�������������" />
    <title>��Ѷ��ҳ</title>
    
"""

import urllib
url='http://www.qq.com'
urlconn=urllib.urlopen(url)
urlstr=urlconn.read(2048)
#��������һ���汾
import socket
s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect(('www.qq.com',80))
s.sendall('GET / HTTP/1.0\r\nHost:www.qq.com\r\n\r\n')
import time
time.sleep(2)
f=s.recv(2048)
print f