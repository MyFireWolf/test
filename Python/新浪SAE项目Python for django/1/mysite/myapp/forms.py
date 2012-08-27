#!/usr/bin/python
#coding: utf-8
from django import forms
class UsersForm(forms.Form):
    name = forms.CharField()   
    passwd = forms.CharField(widget=forms.PasswordInput)
    repasswd=forms.CharField(widget=forms.PasswordInput)
    email = forms.EmailField(required=False)
    
    def clean_repasswd(self):
        repawd = self.cleaned_data['repasswd']
        pawd = self.cleaned_data['passwd']
        if pawd!=repawd:
            raise forms.ValidationError(u'两次输入不一致!')
        return repawd
  
class UploadFileForm(forms.Form):
    file = forms.CharField(max_length=50,label=u'上传后的文件名',required=False)
    filepath = forms.FileField(label=u'上传的文件路径')