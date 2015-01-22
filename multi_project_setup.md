# 多项目设置
使用多项目设置，Gradle项目可以依赖其他Gradle项目.

多项目设置的实现通常是在一个根项目路径下，包含了所有子项目的文件夹.

例如,给定以下的项目结构:
``` groovy
MyProject/
 + app/
 + libraries/
    + lib1/
    + lib2/
```
我们可以定义3个项目.Gradle会按照下面的名称去映射:
``` groovy
:app
:libraries:lib1
:libraries:lib2
```
每个项目都有属于自己的`build.gradle`来声明项目是如何构建的.
另外,在项目的根目录下有个`setting.gradle`.
这些文件的目录结构:
``` groovy
MyProject/
 | settings.gradle
 + app/
    | build.gradle
 + libraries/
    + lib1/
       | build.gradle
    + lib2/
       | build.gradle
```
`setting.gradle`文件内容很简单：
``` groovy
include ':app', ':libraries:lib1', ':libraries:lib2'
```
这里定义了哪个文件夹才是真正的Gradle项目.

其中<font color='green'>:app</font>项目可能依赖一些库,可以通过声明下面的这些依赖来解决:
``` groovy
dependencies {
    compile project(':libraries:lib1')
}
```
更多关于多项目配置的信息，请参考[多项目配置](http://gradle.org/docs/current/userguide/multi_project_builds.html)
