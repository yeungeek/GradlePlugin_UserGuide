# 测试

测试multi-flavors项目非常类似于测试简单的项目。

`androidTest` sourceSet用于定义所有flavor共用的测试，但是每一个flavor也可以有它自己特有的测试

正如前面提到的，每一个flavor都会创建自己的测试sourceSet：
* android.sourceSets.androidTestFlavor1
位于src/androidTestFlavor1/
* android.sourceSets.androidTestFlavor2
位于src/androidTestFlavor2/

同样的，他们可以拥有自己的依赖：
``` groovy
dependencies {
    androidTestFlavor1Compile "..."
}
```
这些测试可以通过main的标志性deviceCheck task或者main的androidTest task（当flavor被使用的时候这个task相当于一个标志性task）来执行

每一个flavor也拥有它们自己的task来这行这些测试：androidTest< VariantName>:
* assembleFlavor1Test
* installFlavor1Debug
* installFlavor1Test
* uninstallFlavor1Debug
* ...

最终的HTML报告支持根据flavor合并生成。下面是测试结果和报告文件的路径，第一个是每一个flavor版本的结果，后面的是合并起来的结果：
* build/androidTest-results/flavors/<FlavorName>
* build/androidTest-results/all/
* build/reports/androidTests/flavors<FlavorName>
* build/reports/androidTests/all/

可以自定义报告的路径，只需要改变根目录，然后创建per-flavor子目录和聚合报告目录results/reports.

