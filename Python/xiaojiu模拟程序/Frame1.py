#Boa:Frame:Frame1

import wx

def create(parent):
    return Frame1(parent)

[wxID_FRAME1, wxID_FRAME1BUTTON1, wxID_FRAME1BUTTON2, wxID_FRAME1PANEL1, 
 wxID_FRAME1STATICLINE1, wxID_FRAME1TEXTCTRL1, wxID_FRAME1TEXTCTRL2, 
] = [wx.NewId() for _init_ctrls in range(7)]

[wxID_FRAME1FILEMENUITEMS0] = [wx.NewId() for _init_coll_filemenu_Items in range(1)]

[wxID_FRAME1HELPMENUITEMS0] = [wx.NewId() for _init_coll_helpmenu_Items in range(1)]

[wxID_FRAME1TIMER1] = [wx.NewId() for _init_utils in range(1)]
import os
class Frame1(wx.Frame):
    def _init_coll_boxSizer3_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.button1, 0, border=0, flag=0)
        parent.AddWindow(self.button2, 0, border=0, flag=0)

    def _init_coll_boxSizer1_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.textCtrl2, 1, border=0, flag=wx.EXPAND)
        parent.AddSizer(self.boxSizer3, 0, border=0, flag=0)

    def _init_coll_topSizer_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.textCtrl1, 1, border=0, flag=wx.EXPAND)
        parent.AddWindow(self.staticLine1, 0, border=0, flag=wx.EXPAND)
        parent.AddSizer(self.boxSizer1, 0, border=0, flag=wx.EXPAND)
        parent.AddSizer(self.boxSizer2, 0, border=0, flag=0)

    def _init_coll_menuBar1_Menus(self, parent):
        # generated method, don't edit

        parent.Append(menu=self.filemenu, title=u'\u52a0\u8f7d\u6587\u4ef6')
        parent.Append(menu=self.helpmenu, title=u'\u5173\u4e8e')

    def _init_coll_helpmenu_Items(self, parent):
        # generated method, don't edit

        parent.Append(help='', id=wxID_FRAME1HELPMENUITEMS0,
              kind=wx.ITEM_NORMAL, text=u'About')

    def _init_coll_filemenu_Items(self, parent):
        # generated method, don't edit

        parent.Append(help='', id=wxID_FRAME1FILEMENUITEMS0,
              kind=wx.ITEM_NORMAL,
              text=u'\u52a0\u8f7d\u6a21\u62df\u8bb0\u5f55\u6587\u4ef6')
        self.Bind(wx.EVT_MENU, self.OnFileJAZAIMenu,
              id=wxID_FRAME1FILEMENUITEMS0)

    def _init_sizers(self):
        # generated method, don't edit
        self.topSizer = wx.BoxSizer(orient=wx.VERTICAL)

        self.boxSizer1 = wx.BoxSizer(orient=wx.HORIZONTAL)

        self.boxSizer2 = wx.BoxSizer(orient=wx.VERTICAL)

        self.boxSizer3 = wx.BoxSizer(orient=wx.VERTICAL)

        self._init_coll_topSizer_Items(self.topSizer)
        self._init_coll_boxSizer1_Items(self.boxSizer1)
        self._init_coll_boxSizer3_Items(self.boxSizer3)

        self.panel1.SetSizer(self.topSizer)

    def _init_utils(self):
        # generated method, don't edit
        self.menuBar1 = wx.MenuBar()

        self.timer1 = wx.Timer(id=wxID_FRAME1TIMER1, owner=self)
        self.Bind(wx.EVT_TIMER, self.OnTimer1Timer, id=wxID_FRAME1TIMER1)

        self.filemenu = wx.Menu(title='')

        self.helpmenu = wx.Menu(title='')

        self._init_coll_menuBar1_Menus(self.menuBar1)
        self._init_coll_filemenu_Items(self.filemenu)
        self._init_coll_helpmenu_Items(self.helpmenu)

    def _init_ctrls(self, prnt):
        # generated method, don't edit
        wx.Frame.__init__(self, id=wxID_FRAME1, name='', parent=prnt,
              pos=wx.Point(521, 172), size=wx.Size(542, 439),
              style=wx.DEFAULT_FRAME_STYLE, title='Frame1')
        self._init_utils()
        self.SetClientSize(wx.Size(534, 405))
        self.SetToolTipString(u'Frame1')

        self.panel1 = wx.Panel(id=wxID_FRAME1PANEL1, name='panel1', parent=self,
              pos=wx.Point(0, 0), size=wx.Size(534, 405),
              style=wx.TAB_TRAVERSAL)

        self.staticLine1 = wx.StaticLine(id=wxID_FRAME1STATICLINE1,
              name='staticLine1', parent=self.panel1, pos=wx.Point(0, 355),
              size=wx.Size(534, 2), style=0)

        self.textCtrl2 = wx.TextCtrl(id=wxID_FRAME1TEXTCTRL2, name='textCtrl2',
              parent=self.panel1, pos=wx.Point(0, 357), size=wx.Size(459, 48),
              style=wx.TE_MULTILINE, value=u'')

        self.button1 = wx.Button(id=wxID_FRAME1BUTTON1, label=u'\u8f93\u5165',
              name='button1', parent=self.panel1, pos=wx.Point(459, 357),
              size=wx.Size(75, 24), style=0)
        self.button1.Bind(wx.EVT_BUTTON, self.OnSaveFileButton,
              id=wxID_FRAME1BUTTON1)

        self.button2 = wx.Button(id=wxID_FRAME1BUTTON2, label=u'\u6e05\u9664',
              name='button2', parent=self.panel1, pos=wx.Point(459, 381),
              size=wx.Size(75, 24), style=0)
        self.button2.Bind(wx.EVT_BUTTON, self.OnClearButton,
              id=wxID_FRAME1BUTTON2)

        self.textCtrl1 = wx.TextCtrl(id=wxID_FRAME1TEXTCTRL1, name='textCtrl1',
              parent=self.panel1, pos=wx.Point(0, 0), size=wx.Size(534, 355),
              style=wx.TE_MULTILINE, value=u'')
        self.textCtrl1.Enable(True)
        self.textCtrl1.SetEditable(False)
        self.textCtrl1.Bind(wx.EVT_LEFT_DCLICK, self.OnTextCtrl1LeftDclick)
        self.textCtrl1.Bind(wx.EVT_KEY_DOWN, self.OnTextCtrl1LeftDclick)

        self._init_sizers()

    def __init__(self, parent):
        self._init_ctrls(parent)
        self.SetMenuBar(self.menuBar1)
        self.CreateStatusBar()
        self.timer1.Start()
        
        if not os.path.isfile('c:/showtip.txt'):
            tempfile=open('c:/showtip.txt','w')
            tempfile.close()       
        self.filesoure=open('c:/showtip.txt')
        tempstr=self.filesoure.read()
        self.date=''.join(tempstr.split())
        self.count=0
        self.readindex=0
        self.readlen=len(self.date)
        self.SetDateSoure()
        
        
       
    def OnTimer1Timer(self, event):
        self.count=self.count+1
        if self.readindex > self.readlen:
            return 
        if self.count < 41:
            self.textctrlone=self.textctrlone+' '+ self.date[self.readindex]
            self.textctrltow=self.textctrltow+' '+ self.date[self.readindex+1]
            self.textctrlthree=self.textctrlthree+' '+ self.date[self.readindex+2]
            self.textCtrl1.SetValue(self.textctrlone+'\n'+self.textctrltow+'\n'+self.textctrlthree+'\n')
        elif self.count < 81: 
            self.textctrlrow2one=self.textctrlrow2one+' '+ self.date[self.readindex]
            self.textctrlrow2two=self.textctrlrow2two+' '+ self.date[self.readindex+1]
            self.textctrlrow2three=self.textctrlrow2three+' '+ self.date[self.readindex+2]
            self.textCtrl1.SetValue(self.textctrlone+'\n'+self.textctrltow+'\n'+self.textctrlthree+'\n' \
                                    +self.textctrlrow2one+'\n'+self.textctrlrow2two+'\n'+self.textctrlrow2three+'\n')
        elif self.count < 121:
            self.textctrlrow3one=self.textctrlrow3one+' '+ self.date[self.readindex]
            self.textctrlrow3two=self.textctrlrow3two+' '+ self.date[self.readindex+1]
            self.textctrlrow3three=self.textctrlrow3three+' '+ self.date[self.readindex+2]
            self.textCtrl1.SetValue(self.textctrlone+'\n'+self.textctrltow+'\n'+self.textctrlthree+'\n' \
                                    +self.textctrlrow2one+'\n'+self.textctrlrow2two+'\n'+self.textctrlrow2three+'\n' \
                                    +self.textctrlrow3one+'\n'+self.textctrlrow3two+'\n'+self.textctrlrow3three+'\n')
        elif self.count < 161:
            self.textctrlrow4one=self.textctrlrow4one+' '+ self.date[self.readindex]
            self.textctrlrow4two=self.textctrlrow4two+' '+ self.date[self.readindex+1]
            self.textctrlrow4three=self.textctrlrow4three+' '+ self.date[self.readindex+2]
            self.textCtrl1.SetValue(self.textctrlone+'\n'+self.textctrltow+'\n'+self.textctrlthree+'\n' \
                                    +self.textctrlrow2one+'\n'+self.textctrlrow2two+'\n'+self.textctrlrow2three+'\n' \
                                    +self.textctrlrow3one+'\n'+self.textctrlrow3two+'\n'+self.textctrlrow3three+'\n' \
                                    +self.textctrlrow4one+'\n'+self.textctrlrow4two+'\n'+self.textctrlrow4three+'\n'
                                    )
        elif self.count < 201:
            self.textctrlrow5one=self.textctrlrow5one+' '+ self.date[self.readindex]
            self.textctrlrow5two=self.textctrlrow5two+' '+ self.date[self.readindex+1]
            self.textctrlrow5three=self.textctrlrow5three+' '+ self.date[self.readindex+2]
            self.textCtrl1.SetValue(self.textctrlone+'\n'+self.textctrltow+'\n'+self.textctrlthree+'\n' \
                                    +self.textctrlrow2one+'\n'+self.textctrlrow2two+'\n'+self.textctrlrow2three+'\n' \
                                    +self.textctrlrow3one+'\n'+self.textctrlrow3two+'\n'+self.textctrlrow3three+'\n' \
                                    +self.textctrlrow4one+'\n'+self.textctrlrow4two+'\n'+self.textctrlrow4three+'\n' \
                                    +self.textctrlrow5one+'\n'+self.textctrlrow5two+'\n'+self.textctrlrow5three+'\n' \
                                    )
        elif self.count < 241:
            self.textctrlrow6one=self.textctrlrow6one+' '+ self.date[self.readindex]
            self.textctrlrow6two=self.textctrlrow6two+' '+ self.date[self.readindex+1]
            self.textctrlrow6three=self.textctrlrow6three+' '+ self.date[self.readindex+2]
            self.textCtrl1.SetValue(self.textctrlone+'\n'+self.textctrltow+'\n'+self.textctrlthree+'\n' \
                                    +self.textctrlrow2one+'\n'+self.textctrlrow2two+'\n'+self.textctrlrow2three+'\n' \
                                    +self.textctrlrow3one+'\n'+self.textctrlrow3two+'\n'+self.textctrlrow3three+'\n' \
                                    +self.textctrlrow4one+'\n'+self.textctrlrow4two+'\n'+self.textctrlrow4three+'\n' \
                                    +self.textctrlrow5one+'\n'+self.textctrlrow5two+'\n'+self.textctrlrow5three+'\n' \
                                    +self.textctrlrow6one+'\n'+self.textctrlrow6two+'\n'+self.textctrlrow6three+'\n' \
                                    )
            
        elif self.count < 281:
            self.textctrlrow7one=self.textctrlrow7one+' '+ self.date[self.readindex]
            self.textctrlrow7two=self.textctrlrow7two+' '+ self.date[self.readindex+1]
            self.textctrlrow7three=self.textctrlrow7three+' '+ self.date[self.readindex+2]
            self.textCtrl1.SetValue(self.textctrlone+'\n'+self.textctrltow+'\n'+self.textctrlthree+'\n' \
                                    +self.textctrlrow2one+'\n'+self.textctrlrow2two+'\n'+self.textctrlrow2three+'\n' \
                                    +self.textctrlrow3one+'\n'+self.textctrlrow3two+'\n'+self.textctrlrow3three+'\n' \
                                    +self.textctrlrow4one+'\n'+self.textctrlrow4two+'\n'+self.textctrlrow4three+'\n' \
                                    +self.textctrlrow5one+'\n'+self.textctrlrow5two+'\n'+self.textctrlrow5three+'\n' \
                                    +self.textctrlrow6one+'\n'+self.textctrlrow6two+'\n'+self.textctrlrow6three+'\n' \
                                    +self.textctrlrow7one+'\n'+self.textctrlrow7two+'\n'+self.textctrlrow7three+'\n' \
                                    )
            
        else:
            self.textctrlrow8one=self.textctrlrow8one+' '+ self.date[self.readindex]
            self.textctrlrow8two=self.textctrlrow8two+' '+ self.date[self.readindex+1]
            self.textctrlrow8three=self.textctrlrow8three+' '+ self.date[self.readindex+2]
            self.textCtrl1.SetValue(self.textctrlone+'\n'+self.textctrltow+'\n'+self.textctrlthree+'\n' \
                                    +self.textctrlrow2one+'\n'+self.textctrlrow2two+'\n'+self.textctrlrow2three+'\n' \
                                    +self.textctrlrow3one+'\n'+self.textctrlrow3two+'\n'+self.textctrlrow3three+'\n' \
                                    +self.textctrlrow4one+'\n'+self.textctrlrow4two+'\n'+self.textctrlrow4three+'\n' \
                                    +self.textctrlrow5one+'\n'+self.textctrlrow5two+'\n'+self.textctrlrow5three+'\n' \
                                    +self.textctrlrow6one+'\n'+self.textctrlrow6two+'\n'+self.textctrlrow6three+'\n' \
                                    +self.textctrlrow7one+'\n'+self.textctrlrow7two+'\n'+self.textctrlrow7three+'\n' \
                                    +self.textctrlrow8one+'\n'+self.textctrlrow8two+'\n'+self.textctrlrow7three+'\n' \
                                    )
        self.readindex=self.readindex+3
        event.Skip()
        self.timer1.Stop()

    def OnTextCtrl1LeftDclick(self, event):
        self.timer1.Start()
        event.Skip()



    def OnFileJAZAIMenu(self, event):
        self.timer1.Stop()
        dlg=wx.FileDialog(None)
        result=dlg.ShowModal()
        if result == wx.ID_OK:
            wx.MessageBox(dlg.GetPath())
            self.SetDateSoure(dlg.GetPath())
        else:wx.MessageBox('no')
        dlg.Destroy()
        self.timer1.Start()
    def SetDateSoure(self,filepath='c:/showtip.txt'):
        self.filesoure=open(filepath)
        tempstr=self.filesoure.read()
        self.date=''.join(tempstr.split())
        self.count=0
        self.readindex=0
        self.readlen=len(self.date)
        self.textCtrl1.SetValue('')
        self.textctrlone=self.textCtrl1.GetValue()
        self.textctrltow=self.textCtrl1.GetValue()
        self.textctrlthree=self.textCtrl1.GetValue()
        
        self.textctrlrow2one=self.textCtrl1.GetValue()
        self.textctrlrow2two=self.textCtrl1.GetValue()
        self.textctrlrow2three=self.textCtrl1.GetValue()
        
        self.textctrlrow3one=self.textCtrl1.GetValue()
        self.textctrlrow3two=self.textCtrl1.GetValue()
        self.textctrlrow3three=self.textCtrl1.GetValue()
        
        self.textctrlrow4one=self.textCtrl1.GetValue()
        self.textctrlrow4two=self.textCtrl1.GetValue()
        self.textctrlrow4three=self.textCtrl1.GetValue()
        
        self.textctrlrow5one=self.textCtrl1.GetValue()
        self.textctrlrow5two=self.textCtrl1.GetValue()
        self.textctrlrow5three=self.textCtrl1.GetValue()
        
        self.textctrlrow6one=self.textCtrl1.GetValue()
        self.textctrlrow6two=self.textCtrl1.GetValue()
        self.textctrlrow6three=self.textCtrl1.GetValue()
        
        self.textctrlrow7one=self.textCtrl1.GetValue()
        self.textctrlrow7two=self.textCtrl1.GetValue()
        self.textctrlrow7three=self.textCtrl1.GetValue()
        
        self.textctrlrow8one=self.textCtrl1.GetValue()
        self.textctrlrow8two=self.textCtrl1.GetValue()
        self.textctrlrow8three=self.textCtrl1.GetValue()

    
    def OnSaveFileButton(self, event):
        file_wildcard = "MouNi files(*.txt)|*.txt|All files(*.*)|*.*" 
        dlg = wx.FileDialog(self,"Save ",os.getcwd(),style = wx.SAVE | wx.OVERWRITE_PROMPT,wildcard = file_wildcard)
        if dlg.ShowModal() == wx.ID_OK:
            filename = dlg.GetPath()
            if not os.path.splitext(filename)[1]: 
                filename = filename + '.txt'
            if filename and  not os.path.isfile(filename):   
                f=open(filename,'w')
                f.close()
            f=open(filename,'r')
            oldstr=f.read()
            f.close()
            f=open(filename,'w')
            stringsave=self.textCtrl2.GetValue()
            f.write(oldstr+stringsave)            
            f.close()              
        dlg.Destroy()    
        
        
    def OnClearButton(self, event):
        self.textCtrl2.SetValue('')
        

        
       
        
        
       

    

        
