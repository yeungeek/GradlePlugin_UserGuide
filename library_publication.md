# 库工程发布
默认情况下,一个库只会发布它的_release_ Variant(变种)版本.这个版本通过库项目被其他工程引用,不论它们本身构建了什么版本.这是由于Gradle的限制,我们正在努力消除这个临时的限制.

使用下面的代码,你可以控制哪个Variant版本为发行版
``` groovy
android {
    defaultPublishConfig "debug"
}
```
注意这里发布的配置名称引用的时完整的Variant版本名称._Release_和_debug_只能在项目中没有其他特性版本下适用.如果你想改变默认的发布版本，你可以使用这个特性：
``` groovy
android {
    defaultPublishConfig "flavor1Debug"
}
```
将库项目的所有变种版本发布也是有可能的。我们计划允许在一般的项目与项目进行依赖(类似于上面所说的情况)，但是由于Gradle的限制(我们正在努力修复这个问题)，目前还没有实现这种功能。</br>
默认情况下没有启用发布所有变种版本的功能。使用下面的代码启用它:
``` groovy
android {
    publishNonDefault true
}
```
理解发布多个Variant版本意味着发布多个aar文件，而不是一个aar文件包含多个Variant版本这个很重要。每个aar包含了一个单独的Variant版本.</br>
发布一个Variant版本意味着构建一个可用的aar文件作为Gradle项目的输出构件。无论是被发布到maven仓库，还是被作为另一个项目的库项目依赖。</br>
Gradle有个默认构建的概念。当添加以下配置后就会使用到：
``` groovy
compile project(':libraries:lib2')
```
创建一个其他发布构建的依赖，你需要指定使用哪个：
``` groovy
dependencies {
    flavor1Compile project(path: ':lib1', configuration: 'flavor1Release')
    flavor2Compile project(path: ':lib1', configuration: 'flavor2Release')
}
```
> **重要:**注意已发布的配置是一个完整的variant版本，包含了构建的类型，需要像上面一样的格式被引用 </br>
> **重要:**当启用非默认发布，maven发布插件将会发布其它Variant版本作为扩展包（按分类器分类）。这意味着不能真正的兼容发布到maven仓库。你应该另外发布一个单一的Variant版本到仓库中，或者允许发布所有配置以支持跨项目依赖。
