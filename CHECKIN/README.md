# 签到目录

## 签到目标

在本目录(`CHECKIN`)下添加一份文件，文件名为`2021-4-$name`，`$name`代表自己的名字，例如`2021-4-张三`或`2021-4-李四`

## 签到方式

1. 请用自己的Github账户将本仓库fork一份
2. 安装一份自己的Linux系统(虚拟机、WSL或物理机都随意)，在该系统上安装`git`
3. 安装`screenfetch`并执行该命令，执行结果保存为上述文件(`2021-4-$name`)
4. 用`git`将该文件commit到自己fork的仓库，需要使用`conventional commits`格式，内容为`checkin: $name`
	- 请避免commit到`master`分支，应该是**`checkin`分支**
	- 注意是英文冒号，并且冒号后面跟一个半角空格
5. 在Github上提交pull request，等待反馈
	- 同样地，**应该向`checkin`分支提交PR**

## 考核标准 & 注意事项

- 符合要求的PR将被接受，签到成功，否则就还需要进一步修改
- 请不要使用UTF8以外的文件名、文件内容编码格式(UTF8 with BOM也不行)，也不要使用CRLF换行格式的文件
	- 使用linux并且系统语言选用英文，这些问题一般不会出现

## 示例

请参考本目录下的`2021-4-144026`文件(请在bash中查看)：

```txt
└─$ cat 2021-4-144026
..............
            ..,;:ccc,.                           144026@debian
          ......''';lxO.                         OS: Kali Linux
.....''''..........,:ld;                         Kernel: x86_64 Linux 5.9.0-kali4-amd64
           .';;;:::;,,.x,                        Uptime: 3h 16m
      ..'''.            0Xxoc:,.  ...            Packages: 3171
  ....                ,ONkc;,;cokOdc',.          Shell: zsh 5.8
 .                   OMo           ':ddo.        Resolution: 2560x2520
                    dMc               :OO;       DE: Xfce
                    0M.                 .:o.     WM: Xfwm4
                    ;Wd                          WM Theme: Kali-Light
                     ;XO,                        GTK Theme: Kali-Light [GTK2]
                       ,d0Odlc;,..               Icon Theme: Flat-Remix-Blue-Light
                           ..',;:cdOOd::,.       Font: WenQuanYi Micro Hei 12
                                    .:d;.':;.    Disk: 134G / 237G (60%)
                                       'd,  .'   CPU: AMD Ryzen 5 2500U with Radeon Vega Mobile Gfx @ 8x 2GHz
                                         ;l   .. GPU: AMD/ATI Raven Ridge [Radeon Vega Series / Radeon Vega Mobile Series]
                                          .o     RAM: 2251MiB / 6919MiB
                                            c
                                            .'
                                             .
```
