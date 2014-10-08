# 简单构建文件
一个最简单Gradle纯Java工程的build.gradle文件包含了以下内容:
``` groovy
apply plugin: 'java'
```
这是Gradle包装的Java插件。该插件提供了所有构建和测试Java应用程序的东西。
最简单的Android工程的build.gradle描述：
``` groovy
buildscript {
    repositories {
        mavenCentral()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:0.11.1'
    }
}

apply plugin: 'android'

android {
    compileSdkVersion 19
    buildToolsVersion "19.0.0"
}
```
<font color='red'>译者注：</font>目前gradle tools版本为0.13.+(2014.10.08)

上述内容包含了Android构建文件的3个主要部分：

**<font color='green'>buildscript { ... }</font>**配置了驱动构建的代码.

在这个例子中，他申明了使用Maven中央库，并且申明了一个Maven构件的依赖classpath。这个构件声明了Gradle的Android插件版本为0.11.1.

**注意**：这里的配置只影响了构建过程的代码，而不是整个工程的代码.工程本身需要声明它自己的仓库和依赖.这个后面会提到.

然后，跟前面提到的Java插件一样，添加了**<font color='green'>android</font>**插件.

最后，**<font color='green'>android { ... }</font>**配置了所有android构建的参数.也是Android DSL的入口点.
默认情况下，只有编译的target和build-tools版本是必须的.就是**<font color='green'>compileSdkVersion</font>**和**<font color='green'>buildtoolsVersion</font> **两个属性.
编译的target属性相当于在老的构建系统中`project.properties`中的target属性.这个新属性和老的target属性一样可以指定一个int(api等级)或者string类型的值.

**重要：** 你只能使用**<font color='green'>android</font>**插件.如果同时使用**<font color='green'>java</font>**插件，会导致构建错误.

**注意：** 你还需要添加*local.properties*文件，使用**<font color='green'>sdk.dir</font>**属性，来设置已经存在的SDK路径.    
另外，你也可以设置环境变量**<font color='green'>ANDROID_HOME</font>**.这两种方式没有什么区别,可以根据你自己的喜好来选择一种.






