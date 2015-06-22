# Java编译选项
``` groovy
android {
    compileOptions {
        sourceCompatibility = "1.6"
        targetCompatibility = "1.6"
    }
}
```
默认值是“1.6”，这个设置会影响所有编译Java源代码的task。
