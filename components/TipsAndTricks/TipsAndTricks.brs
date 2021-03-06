'*************************************************************
'** PhotoView for Google Photos
'** Copyright (c) 2017-2019 Chris Taylor.  All rights reserved.
'** Use of code within this application subject to the MIT License (MIT)
'** https://raw.githubusercontent.com/chtaylo2/Roku-GooglePhotos/master/LICENSE
'*************************************************************

Sub init()
    'Define SG nodes
    m.tipsList = m.top.findNode("tipsLabelList")
    m.tipsInfo = m.top.findNode("infoLabel")
    m.qrCode   = m.top.findNode("qrCode")
    
    m.tipsInfo.font.size = 30
      
    'Read in content
    m.readContentTask = createObject("roSGNode", "Local ContentReader")
    m.readContentTask.observeField("content", "setlist")
    m.readContentTask.file = "pkg:/data/TipsAndTricks/tipsContent.xml"
    m.readContentTask.control = "RUN"
End Sub


Sub setlist()
    'Populate list content
    m.tipsList.content = m.readContentTask.content
    m.tipsList.setFocus(true)
End Sub


Sub showfocus()
    'Show info for focused item
    if m.tipsList.content<>invalid then
        itemcontent = m.tipsList.content.getChild(m.tipsList.itemFocused)
        m.tipsInfo.text = itemcontent.description
        
        if itemcontent.title = "Reporting Bugs or Feature Requests" then
            m.qrCode.visible = "true"
        else
            m.qrCode.visible = "false"
        end if
        
    end if
End Sub
