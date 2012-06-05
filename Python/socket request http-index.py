"""
    实例通用 socket发送页面请求.... Host:www.qq.com这个头一定要包含并发送，否则会得不到页面，获得的是出错的页面.....
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
    <meta name="description" content="腾讯网(www.QQ.com)是中国浏览量最大的中文门户网站，是腾讯公司推出的集新闻信息、互动社区、娱乐产品和基础服务为一体的大型综合门户网站。腾讯网服务于全球华人用户，致力成为最具传播力和互动性，权威、主流、时尚的互联网媒体平台。通过强大的实时新闻和全面深入的信息资讯服务，为中国数以亿计的互联网用户提供富有创意的网上新生活。" />
    <title>腾讯首页</title>
    
"""

import urllib
url='http://www.qq.com'
urlconn=urllib.urlopen(url)
urlstr=urlconn.read(2048)
#下面是另一个版本
import socket
s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect(('www.qq.com',80))
s.sendall('GET / HTTP/1.0\r\nHost:www.qq.com\r\n\r\n')
import time
time.sleep(2)
f=s.recv(2048)
print f