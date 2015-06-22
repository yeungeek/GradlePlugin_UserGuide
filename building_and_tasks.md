# 构建和任务
我们前面提到的每一个_Build Type_会创建自己的 `assemble <name>` task,但是Build Variant是Build Type和Product Flavor的组合。

当_Product Flavors_使用的时候，将会创建更多的assemble-type task：
1. assemble<Variant Name>
2. assemble<Build Type Name>
3. assemble<Product Flavor Name>

`#1` 允许直接构建一个Variant版本,例如`assembleFlavor1Debug`

`#2` 允许构建指定Build Type的所有APK，例如assembleDebug将会构建Flavor1Debug和Flavor2Debug两个Variant版本。

`#3` 允许构建指定flavor的所有APK，例如assembleFlavor1将会构建Flavor1Debug和Flavor1Release两个Variant版本。

另外，`assemble` task会构建所有可能组合的Variant版本

