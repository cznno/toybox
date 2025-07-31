#Persistent
#MaxThreadsPerHotkey 2

; 当按住 O 键时，重复执行 SendRandomLetter 函数
o::
    IsOHeld := true
    Loop
    {
        If !(IsOHeld)
            Break ; 如果 O 键不再按住，则停止循环

        SendRandomLetter()
        Sleep, 50 ; 调整此值来控制输入速度（毫秒）。数字越小，速度越快。
    }
Return

; 当松开 O 键时
o Up::
    IsOHeld := false
Return

; 函数：发送一个随机字母
SendRandomLetter()
{
    Random, OutputVar, 97, 122 ; 生成一个随机ASCII码，对应 'a' 到 'z'
    SendInput % Chr(OutputVar)
}
