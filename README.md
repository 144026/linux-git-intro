# Git & Linux培训 Archive

仓库包含两个分支，`master`分支用于保存培训课件，`checkin`分支用来签到

## 获取课件

先在本地clone一份仓库，其中：

- ppt内容被展开放到了`expanded`目录下，执行`make collapse`将在`build`目录还原出ppt内容
	- 准备好的ppt放到`ppts`目录下，执行`make expand`即可将ppt拆解到`expanded`目录，供git进行版本控制

- `dummy.pptx`是一个空的占位ppt，用来防止Makefile对空变量进行操作

- `Reference.md`包含各种参考链接

## 签到

- 进入`checkin`分支的`CHECKIN`目录，查看其中的`README.md`
