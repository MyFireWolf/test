import socket
lst=[]
userip={}
ipa='192.168.1.'
for i in range(100,255):
    ipadd=ipa+str(i)
    lst.append(ipadd)
for i in lst:
    try:
        values=socket.gethostbyaddr(i)
        print values
        userip[i]=values
    except: 
        print 'No Found ',i

filer=open("host-ip.txt","w")
print 'finish'
for i,v in userip.items():
    print i,v[0]
    filer.write(i+' : '+v[0]+'\n')
    
filer.close()
