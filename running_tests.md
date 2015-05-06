#  运行测试
正如前面提到的，标志性task **<font color='green'>connectedCheck</font>** 需要一个连接的设备来启动。
这个过程依赖**<font color='green'>androidTest</font>** task，所以也会运行该任务。这个task会执行下面这些任务：
* 确认应用和测试应用都被构建(依赖**<font color='green'>assembleDebug</font>**和)
**<font color='green'>assembleDebug</font>**
* 安装这两个应用
* 运行测试
* 卸载这两个应用

如果多于一个设备连接，所有的测试都会同时运行在所有连接的设备上。如果其中一个设备测试失败，那么其他设备也算是测试失败。

所有的测试结果被保存为xml文件，路径：
``` groovy
build/androidTest-results
```
(类似于junit的报告被保存在build/test-results目录下)

同样，路径可以自定义配置：
``` groovy
android {
    ...

    testOptions {
        resultsDir = "$project.buildDir/foo/results"
    }
}
```
**<font color='green'>android.testOptions.resultsDir </font>**的值通过**<font color='green'>Project.file(String)</font>**获取。
