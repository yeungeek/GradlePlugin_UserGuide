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


新的标志性任务是必须的，为了能够保证在没有设备连接的情况下执行定期检查.
要注意的是**<font color='green'>build</font>**并不依赖于**<font color='green'>deviceCheck</font>**，或者**<font color='green'>connectedCheck</font>**

一个android工程只要有两种输出：debug apk和release apk.每个输出都有各自标志性的任务，可以方便的单独构建它们:
* **<font color='green'>assemble</font>**
  * **<font color='green'>assembleDebug</font>**
  * **<font color='green'>assembleRelease</font>**

它们都依赖于构建一个apk所需要执行多个步骤的其他一些任务.
**<font color='green'>assemble</font>**任务依赖了上面的两个，所以会构建出两个APK.

> 提示:Gradle在命令行上支持驼峰语法来命名它们的任务名称.例如.
``` gradle
gralde aR
```
等同与输入
``` gradle
gradle assembleRelease
```
只要没有其它命令匹配`aR`

check任务也有他自己的依赖:
* **<font color='green'>check</font>**
  * **<font color='green'>lint</font>**
* **<font color='green'>connectedCheck</font>**
  * **<font color='green'>connectedAndroidTest</font>**
  * **<font color='green'>connectedUiAutomatorTest</font>**(还么有实现)
* **<font color='green'>deviceCheck</font>**
  * 这个任务依赖于其它实现了测试扩展点的插件被创建的时候

最后，插件为所有的构建类型(**<font color='green'>debug, release, test</font>**)创建了`install/uninstall`任务，只要它们是可以被安装的(需要签名过的).

