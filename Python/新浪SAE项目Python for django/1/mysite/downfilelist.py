import os,locale
def getdownfilename():
    dirname=os.path.dirname(__file__)    
    downloadpath=os.path.join(dirname,'templates','download')
    pathlist=[]
    localecode=locale.getdefaultlocale()
    for i in os.listdir(downloadpath):
        unistr=i.decode(localecode[1])       
        pathlist.append(unistr)
    return pathlist
