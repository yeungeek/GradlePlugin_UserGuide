# 独立工程
一个工程将会自动生成测试运行。默认位置：
``` groovy
build/reports/androidTests
```

这个和jUnit报告所在位置类似，`build/reports/tests`，其他的报告通常位于` build/reports/<plugin>/`。

该位置可以自定义
```groovy
android {
    ...

    testOptions {
        reportDir = "$project.buildDir/foo/report"
    }
}
```
报告会合并运行在不同设备上的测试结果。
