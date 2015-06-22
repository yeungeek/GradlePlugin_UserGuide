# dex选项
``` groovy
android {
    dexOptions {
        incremental false
        preDexLibraries = false
        jumboMode = false
        javaMaxHeapSize "2048M"
    }
}
```
这个将影响所有使用dex的task。
