# 远程文件
Gradle支持从Maven或者Ivy仓库中拉取构件.
首先必须将仓库添加到列表中，然后需要声明依赖的Maven或者Ivy构件名称.
``` groovy
repositories {
    mavenCentral()
}


dependencies {
    compile 'com.google.guava:guava:11.0.2'
}

android {
    ...
}
```
>注意: <font color='green'>mavenCentral()</font>是指定仓库URL的快捷方法.Gradle支持远程和本地的仓库.

>注意: Gradle遵循依赖递归.这意味着，如果一个依赖中又有自己的依赖，那么所有的构件都会被拉取下来.

更多关于设置依赖的信息,请查看[Gralde用户指南](http://gradle.org/docs/current/userguide/artifact_dependencies_tutorial.html)，和[DSL文档](http://gradle.org/docs/current/dsl/org.gradle.api.artifacts.dsl.DependencyHandler.html).
