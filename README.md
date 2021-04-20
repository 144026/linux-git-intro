# Git Linux培训

- ppt内容被展开放到了`expanded`目录下，执行`make collapse`将在`build`目录还原出ppt内容

- 将准备好的ppt放到`ppts`目录下，执行`make expand`即可将ppt拆解到`expanded`目录，供git进行版本控制

- `dummy.pptx`是一个空的占位ppt，用来防止Makefile对空变量进行操作
