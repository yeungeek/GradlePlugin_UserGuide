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
