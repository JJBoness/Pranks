#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon

Path := "Rick.mp4"

thing := InputHook("M")
thing.FindAnywhere := true
thing.Start()

    MonitorGet(1, &Left, &Top, &Right, &Bottom)
    GUII := Rick_Gui(Left, Top, Right - Left, Bottom - Top, Path)

    StartX := Left + ((Right - Left) / 2)
    StartY := Top + ((Bottom - Top) / 2)
    

Starter()
Starter() {
    SetTimer(Mouserrr, 10)
}


Class Rick_Gui {
    __new(X, Y, W, H, Path) {
        this.X := X
        this.Y := Y
        this.W := W
        this.H := H

        this.myGui := Gui()
        this.myGui.Opt("-caption +Toolwindow")
        this.WMP := this.myGui.Add("ActiveX", "x0 y0 w" . W . " h" . H, "WMPLayer.OCX").Value
        this.WMP.Url := Path
        this.WMP.uiMode := "none"                     ; No WMP controls
        this.WMP.stretchToFit := true                 ; Video is stretched to the ActiveX range
        this.WMP.enableContextMenu := false           ; Disable right-click in video area
        this.WMP.settings.setMode("loop", true)       ; Loop video
        this.WMP.settings.volume := 100
    }

    Show() {
        this.myGui.Show("x" . this.X . " y" . this.Y " w" . this.W . " h" . this.H)
        this.WMP.controls.play
    }

    Hide() {
        this.myGui.Hide()
        this.WMP.controls.pause
    }
}

Mouserrr() {

    global StartX
    global StartY

    MouseGetPos(&X, &Y)

    if (X != StartX|| Y != StartY) {

        GUII.Show()
        SystemCursor("Hide")
        MouseMove(StartX ,StartY)
        
    } else {
        GUII.Hide()
        SystemCursor("Show")
    }
}

^!+o::
{
    ExitApp()
}

LWin::
{

}

OnExit (*) => SystemCursor("Show")  ; Ensure the cursor is made visible when the script exits.
SystemCursor(cmd)  ; cmd = "Show|Hide|Toggle|Reload"
{
    static visible := true, c := Map()
    static sys_cursors := [32512, 32513, 32514, 32515, 32516, 32642
                         , 32643, 32644, 32645, 32646, 32648, 32649, 32650]
    if (cmd = "Reload" or !c.Count)  ; Reload when requested or at first call.
    {
        for i, id in sys_cursors
        {
            h_cursor  := DllCall("LoadCursor", "Ptr", 0, "Ptr", id)
            h_default := DllCall("CopyImage", "Ptr", h_cursor, "UInt", 2
                , "Int", 0, "Int", 0, "UInt", 0)
            h_blank   := DllCall("CreateCursor", "Ptr", 0, "Int", 0, "Int", 0
                , "Int", 32, "Int", 32
                , "Ptr", Buffer(32*4, 0xFF)
                , "Ptr", Buffer(32*4, 0))
            c[id] := {default: h_default, blank: h_blank}
        }
    }
    switch cmd
    {
    case "Show": visible := true
    case "Hide": visible := false
    case "Toggle": visible := !visible
    default: return
    }
    for id, handles in c
    {
        h_cursor := DllCall("CopyImage"
            , "Ptr", visible ? handles.default : handles.blank
            , "UInt", 2, "Int", 0, "Int", 0, "UInt", 0)
        DllCall("SetSystemCursor", "Ptr", h_cursor, "UInt", id)
    }
}
