#!/usr/bin/python
# coding: utf-8
import sys,os
print       u"         总长度 :-------------------|"

x=raw_input(" input 20 number:")

while len(str(x))!=20:
    x=raw_input(" input 20 number:")
    try:
        int(x)
    except:
        x='x'
    
y=raw_input(" input your number:")
try:
    int(y)
except:
    y='y'
    while len(str(y))<8:
        y=raw_input(" input your number:")
        try:
            int(y)
        except:
            y='y'

a=int(x)+int(y)
#a=55555555555555555555+45678911
astr=str(a)
print u"第一次运算结果:"+astr
if len(astr)<20:
    for i in range(20-len(astr)):
        astr='0'+astr
if len(astr)==21:
    astr=astr[1:]
    onestr=astr[0:10]
    twostr=astr[10:20]
else:
    onestr=astr[0:10]
    twostr=astr[10:20]
oneint=int(onestr)
twoint=int(twostr)
b=oneint+twoint
bstr=str(b)
print u"  第一个十位数:",oneint
print u"  第二个十位数:",twoint
print u"       相加 +:______________"
print u"第二次运算结果:"+bstr
if len(bstr)<10:
    for i in 10-len(bstr):
        bstr='0'+bstr
if len(bstr)==11:
    bstr=bstr[1:]
else:
    bstr=bstr[0:10]
cstr=[]
for i in range(20):
    index=astr[i]
    index=int(index)
    cstr.append(bstr[-index])
print u"     运算结果:"
print cstr
print u"运算完成......按回车键退出......"
raw_input()


        
        
