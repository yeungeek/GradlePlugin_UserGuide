# Android任务
Android插件使用了相同的约定，使它可以兼容其他插件，并且额外增加了标识性的任务:
* **<font color='green'>assemble</font>**
组合工程所有输出的任务
* **<font color='green'>check</font>**
执行所有检查的任务
* **<font color='green'>connectedCheck</font>**
在一个连接的设备或者模拟器上执行检查，它们可以在所有连接的设备上并行执行检查
* **<font color='green'>deviceCheck</font>**
使用APIs连接远程设备执行检查.主要用于CI(持续集成)服务上.
* **<font color='green'>build</font>**
执行assemble和check两个任务
* **<font color='green'>clean</font>**
这个任务会清空工程的输出


