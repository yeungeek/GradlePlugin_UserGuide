# 引用一个库工程

引用一个库就跟引用其他工程一样：

```
dependencies {
    compile project(':libraries:lib1')
    compile project(':libraries:lib2')
}
```

注意: 如果你有多个库，那么这个顺序很重要，这就好像旧的构建系统，在project.properties文件中的依赖顺序一样重要。
