from django.conf.urls.defaults import *
import os
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Example:
    # (r'^mysite/', include('mysite.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),
    (r'^css/(?P<path>.*)$', 'django.views.static.serve', {'document_root': os.path.join(os.path.dirname(__file__), 'templates','css').replace('\\','/')}),
    (r'^download/(?P<path>.*)$', 'django.views.static.serve', {'document_root': os.path.join(os.path.dirname(__file__), 'templates','download').replace('\\','/')}),#'show_indexes':True
    (r'^images/(?P<path>.*)$', 'django.views.static.serve', {'document_root': os.path.join(os.path.dirname(__file__), 'templates','images').replace('\\','/')}),
    (r'^js/(?P<path>.*)$', 'django.views.static.serve', {'document_root': os.path.join(os.path.dirname(__file__), 'templates','js').replace('\\','/')}),
        
    # Uncomment the next line to enable the admin:
    (r'^admin/', include(admin.site.urls)),
    (r'^$', 'mysite.views.index_do'),
    (r'^hello$', 'mysite.views.hello'),
    (r'^index$', 'mysite.views.index_do'),
    (r'^search$', 'mysite.views.search_do'),
    (r'^register$','mysite.views.register_do'),
    (r'^download$','mysite.views.download_do'),
    (r'^uploadfile$','mysite.views.uploadfile_do'),
)
