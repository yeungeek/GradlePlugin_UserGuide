# 配置工程结构
当默认的工程结构不适用时，就可能需要去配置它.根据Gradle文档，根据下面的代码可以重新配置Java工程的sourceSets：
``` groovy
sourceSets {
    main {
        java {
            srcDir 'src/java'
        }
        resources {
            srcDir 'src/resources'
        }
    }
}
```
> **注意：** **<font color='green'>srcDir</font>**将会被添加到已存在的源文件目录中(这个在Gradle文档中没有提到，但是实际上确实是这样执行了)

要替换默认的源文件目录，你需要使用一个数组路径的**<font color='green'>srcDirs</font>**来替代.下面是使用调用对象的另外一种不同的方法：
``` groovy
sourceSets {
    main.java.srcDirs = ['src/java']
    main.resources.srcDirs = ['src/resources']
}
```
想了解更多的信息，可以查看Gradle文档中[Java插件](http://gradle.org/docs/current/userguide/java_plugin.html)部分.

Android插件使用了类似的语法，因为使用了它自己的sourceSets，这些配置会被添加到**<font color='green'>android</font>**对象中.
下面这个例子,使用了旧工程结构的main代码，并把**<font color='green'>androidTest</font>**的sourceSet映射到tests目录中.
``` groovy
android {
    sourceSets {
        main {
            manifest.srcFile 'AndroidManifest.xml'
            java.srcDirs = ['src']
            resources.srcDirs = ['src']
            aidl.srcDirs = ['src']
            renderscript.srcDirs = ['src']
            res.srcDirs = ['res']
            assets.srcDirs = ['assets']
        }

        androidTest.setRoot('tests')
    }
}
```
> 注意：因为旧的结构把所有的源文件(java, aidl, renderscript, and java resources)放在同一个目录中,所以我们需要重新映射所有的sourceSet新组件到同一个**<font color='green'>src</font>**目录下.

> 注意：**<font color='green'>setRoot()</font>**会移动所有的sourceSet(包括它的子目录)到新的目录.例子中把**<font color='green'>src/androidTest/*</font>**移动到**<font color='green'>tests/*</font>**

这是在Android中特有的，在Java sourceSets中不起作用.

上述的就是工程迁移的简单示例.


