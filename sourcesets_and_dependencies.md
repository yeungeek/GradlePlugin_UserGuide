# 源组件和依赖
与Build Type类似，Product Flavor也会通过它们自己的sourceSet提供代码和资源。

上面的例子会创建4个_sourceSets_:
* android.sourceSets.flavor1
  位于src/flavor1/
* android.sourceSets.flavor2
  位于src/flavor2/
* android.sourceSets.androidTestFlavor1
  位于src/androidTestFlavor1/
* android.sourceSets.androidTestFlavor2
  位于src/androidTestFlavor2/

这些sourceSet用于构建APK，与android.sourceSets.main 和Build Type的sourceSet类似.

下面的规则用于处理所有使用的sourceSet来构建一个APK
* 多个文件夹中的所有的源代码(src/*/java)合并成一个输出
* 所有的Manifest文件都会合并成一个Manifest文件，类似于Build Type，允许Product Flavor可以拥有不同的的组件和权限声明
* 所有使用的资源（Android res和assets）遵循的优先级为Build Type会覆盖Product Flavor，最终覆盖main sourceSet的资源
* 每一个Build Variant都会根据资源生成自己的R类（或者其它一些源代码）。Variant互相之间没有什么是共享的。

最终，跟_Build Types_一样，_Product Flavors_也有自己的依赖。例如，如果使用flavor来生成一个基于广告的应用版本和一个付费的应用版本，其中广告版本可能需要依赖于一个广告SDK，但是另一个不需要。
``` groovy
dependencies {
    flavor1Compile "..."
}
```
在这个例子中，src/flavor1/AndroidManifest.xml文件中可能需要声明访问网络的权限。

每个Variant也可以创建额外的sourceSet：
* android.sourceSets.flavor1Debug
  位于src/flavor1Debug/
* android.sourceSets.flavor1Release
  位于src/flavor1Release/
* android.sourceSets.flavor2Debug
  位于src/flavor2Debug/
* android.sourceSets.flavor2Release
  位于src/flavor2Release/

这些sourceSet拥有比Build Type的sourceSet更高的优先级，并允许在Variant的层次上做一些定制。


