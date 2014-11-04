# 本地包
配置一个外部的jar包依赖，你需要在compile配置中添加一个依赖。
``` groovy
dependencies {
    compile files('libs/foo.jar')
}

android {
    ...
}
```
> 注意：
该dependencies的DSL标签是标准Gradle API中的一部分,所以它不属于android标签.

这个compile配置将被用于编译main application.它里面的所有依赖都会被添加到编译classpath中,**同时**也会被打包最终的APK.以下是添加依赖时可能用到的其他一些配置选项:
* compile 主程序
* androidTestCompile 测试程序
* debugCompile debug构建类型
* releaseCompile release构建类型




