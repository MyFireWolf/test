import os
files=open('c:/a.txt','r')
outfile=open('c:/b.txt','w')
a=0
lines=files.readlines()

try:
    for i in lines:
        a=a+1
        if i[0]=='\n': 
            continue
        if not i:            
            break          
        outfile.write(i)
except: 
    print "Error!"
finally:
    files.close()
    outfile.close()
print "Finish"
raw_input()


