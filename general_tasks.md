# 通用任务

添加一个插件到构建文件中，就会自动创建一组可执行的构建任务.Java和Android插件都有此功能.
下面的是约定的构建任务:
* **<font color='green'>assemble</font>**
组合工程所有输出的任务
* **<font color='green'>check</font>**
执行所有检查的任务
* **<font color='green'>build</font>**
执行<font color='green'>assemble</font>和<font color='green'>check</font>两个任务
* **<font color='green'>clean</font>**
这个任务会清空工程的输出

**<font color='green'>assemble</font>**，**<font color='green'>check</font>**和**<font color='green'>build</font>**这三个任务实际上不做任何事.它们只是一个标记，目的是让plugins添加实际需要的可以完成工作的任务.

这就允许你去调用相同的任务，无论是什么类型的工程，或者是工程应用了任何插件.
例如,使用了*findbugs*插件将会创建一个新的任务，并且让**<font color='green'>check</font>**任务依赖它，
当 **<font color='green'>check</font>** task被调用的时候,这个新的task
先会被调用.

在命令行中执行以下命令,你可以获取更多高级别的任务:
``` groovy
gradle tasks
```
查看task之间依赖关系的完整列表，可以执行以下命令
``` groovy
gradle tasks --all
```
>注意：Gradle会自动监视一个声明了输入和输出的task.
执行两次工程未变化的**<font color='green'>build</font>**，Gradle会使用UP-TO-DATE通知所有任务，也就意味着不需要做任何工作.这让任务之间可以相互正确的依赖，不用去执行不必要的构建操作.
