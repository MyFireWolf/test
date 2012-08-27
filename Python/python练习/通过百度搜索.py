#!/usr/bin/python
#coding: utf-8
#http://www.baidu.com/s?wd=a&rsv_bp=0&rsv_spt=3&inputT=516
#http://www.baidu.com/s?wd=mython&rsv_bp=0&rsv_spt=3&inputT=3375
#http://www.baidu.com/s?wd=python&rsv_bp=0&rsv_spt=3&inputT=1016
#http://www.baidu.com/s?wd=python&rsv_bp=0&rsv_spt=3&inputT=2640
import urllib
import httplib

params = urllib.urlencode({'sourceid':'chrome', 'ie':'UTF-8','q':'a'})
print params
conn = httplib.HTTPConnection('www.baidu.com')
print '---'
conn.request('GET', '/s?wd=中国&rsv_bp=0&rsv_spt=3')
print '----'
res = conn.getresponse()
print '-----'
data = res.read()
len(data)
htmlfile=file('d:\\a.html', 'wb')
htmlfile.write(data)
htmlfile.close()
import webbrowser
webbrowser.open('d:\\a.html')