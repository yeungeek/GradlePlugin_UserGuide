# 多工程报告
一个工程中配置了多个应用和库，当同一个时间运行所有测试时，它会生成一份包含了所有测试结果的报告，这个非常有用。

为了实现这个目标，在同一个依赖文件需要使用不同的插件。可以通过以下方式实现：
``` groovy
buildscript {
    repositories {
        mavenCentral()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:0.5.6'
    }
}

apply plugin: 'android-reporting'
```
这个必须添加到工程的根目录下，例如和settings.gradle在同一个目录下。

然后，在根目录下，执行下面这个命令会运行所有测试，并合并所有的报告：
``` groovy
gradle deviceCheck mergeAndroidReports --continue
```
> 注意：`--continue`选项保证能够执行所有测试，不管子工程的运行是否失败。如果没有这个选项，第一个失败测试就会终止全部的测试，导致一些项目不能够执行测试。
