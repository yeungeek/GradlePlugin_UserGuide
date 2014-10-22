# 构建类型
默认情况下，Android插件会自动建立构建应用程序的debug和release版本的工程.
它们的区别主要是能否在一个安全(non dev)的设备上调试,以及APK是如何签名.

debug版本使用了通用的`name/password`对自动创建的密钥证书进行签名(为了防止在构建过程中出现认证请求).release版本在构建过程中不进行签名，而是需要后面再进行签名.

这个配置是通过一个叫**<font color='green'>BuildType</font>**对象来完成的.默认情况下,两个实例会被创建,一个**<font color='green'>debug</font>**和一个**<font color='green'>release</font>**

Android插件允许像创建其他*构建类型*那样来自定义这两个实例.可以在**<font color='green'>buildTypes</font>**的DSL容器中完成:
``` groovy
android {
    buildTypes {
        debug {
            applicationIdSuffix ".debug"
        }

        jnidebug.initWith(buildTypes.debug)
        jnidebug {
            packageNameSuffix ".jnidebug"
            jnidebugBuild true
        }
    }
}
```

上面的代码片段实现了以下功能：
* 配置默认的**<font color='green'>debug</font>**构建类型:
  * 设置包名为`<app appliationId>`.debug,以便能够在同一个设备上安装*debug*和*release*版本的apk
* 


