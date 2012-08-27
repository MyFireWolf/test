from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import render_to_response
from mysite.myapp.models import Users
from mysite.myapp.forms import UsersForm,UploadFileForm
import datetime
import downfilelist


#def current_datetime(request):
 #   now = datetime.datetime.now()
  #  return render_to_response('current_datetime.html', {'current_date': now})

def hello(request):
    return HttpResponse("Hello, world! - Django")

def index_do(request):    
    return render_to_response('main.html')

def search_do(request):
    if 'name' in request.GET and request.GET['name']:
        j=request.GET['name']     
        plist=Users.objects.filter(name=j) 
        if len(plist):
            id=plist[0].id
            name=plist[0].name
            print "here"
            return render_to_response('myindex.html',{'id':id,'name':name})
        else:
            print "else"
            #return HttpResponseRedirect('/search')
            return render_to_response('do_search.html')
    else:
        print "default"
        return render_to_response('do_search.html')
"""def search(request):   
    if 'name' in request.GET:
        j=request.GET['name']
        plist=Namebook.objects.filter(name=j)
        if len(plist):
            id=plist[0].id
            name=plist[0].name
            country=plist[0].country
            return render_to_response('myindex.html',{'id':id,'name':name,'country':country})
        return HttpResponseRedirect('/search-form/')"""

def register_do(request):   
    if request.method == 'POST':        
        form = UsersForm(request.POST)
        if form.is_valid():
            user=Users()
            cd = form.cleaned_data    
            user.name=cd['name']
            user.passwd=cd['passwd']
            user.email=cd['email']
            user.save()
            return HttpResponseRedirect('index')
    else:
        form=UsersForm()         
    return render_to_response('register.html', {'form': form})

def uploadfile_do(request):
    if request.method == 'POST':
        form = UploadFileForm(request.POST, request.FILES)
        if form.is_valid():
            cd = form.cleaned_data   
            if cd['file']:
                savefilename=cd['file']
            else:
                savefilename=request.FILES['filepath'].name            
            #handle_uploaded_file(savefilename,request.FILES['filepath'])
            #return render_to_response('uploadfile.html', {'form': form,'filenamestr':savefilename})
            handle_uploaded_file2(savefilename)
            return HttpResponseRedirect('index')
    else:
        form = UploadFileForm()    
    return render_to_response('uploadfile.html', {'form': form})

def download_do(request):
    downfiles=downfilelist.getdownfilename()    
    #downfiles=['NASM\xca\xd6\xb2\xe1.pdf']
    return render_to_response('download.html',{'downfiles':downfiles})

def handle_uploaded_file(savefilename,f):
    import locale
    localecd=locale.getdefaultlocale()[1]
    #tofilepath='/media/'+savefilename
    #topath=tofilepath.encode(localecd)
    #print topath,type(topath)
    topath=savefilename.encode(localecd)
    destination = open(topath, 'wb+')
    for chunk in f.chunks():
        destination.write(chunk)
    destination.close()
def handle_uploaded_file2(f):
    import locale    
    import sae.storage
    localecd=locale.getdefaultlocale()[1]
    topath=f.encode(localecd)
    s = sae.storage.Client()
    s.list_domain()
    ob = sae.storage.Object('pieces of data')
    s.put('522828368qqcom',topath,ob)