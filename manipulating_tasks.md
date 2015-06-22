# 操作task
基础Java工程有一组有限的taskask相互处理生成一个输出。
`classes`task是一个编译java源码的task。在build.gradle脚本中可以很容易的去使用`classes`task。这个是**<font color='green'>project.tasks.classes</font>**的缩写。

在Android项目中，就相对比较复些。因为Android项目中有大量相同的task，它们的名字是基于_Build Types_和_Product Flavors_生成。

为了解决这个问题，Android对象有两个属性:
* **<font color='green'>applicationVariants </font>**(适用于app Plugin)
* **<font color='green'>libraryVariants</font>**(只适用于library plugin)
* **<font color='green'>testVariants</font>**(两者都适用)

这三个都会分别返回一个ApplicationVariant、LibraryVariant和TestVariant对象的[DomainObjectCollection](http://www.gradle.org/docs/current/javadoc/org/gradle/api/DomainObjectCollection.html)

注意使用了这三个collection中其中一个都会触发所对应的task。意味着使用了collection后不需要重新配置。

DomainObjectCollection可以直接访问所有对象，或者通过过滤器进行方便的筛选。
``` groovy
android.applicationVariants.all { variant ->
    ....
}
```
以上三个variant对象共享下面的这些属性:

Property Name|  Property Type| Description
----|------|----
name|String| Variant的名字，必须是唯一的
description|String|  Human readable description of the variant.
dirName|String|subfolder name for the variant. Guaranteed to be unique. Maybe more than one folder, ie “debug/flavor1”
baseName|String|Variant输出的基础名字，必须唯一.
outputFile|File|The output of the variant. This is a read/write property.
processManifest|ProcessManifest|处理Manifest的task.
aidlCompile|AidlCompile|The task that compiles the AIDL files.
renderscriptCompile|RenderscriptCompile|The task that compiles the Renderscript files.
mergeResources|MergeResources|The task that merges the resources.
mergeAssets|MergeAssets|The task that merges the assets.
processResources|ProcessAndroidResources|处理并编译资源文件的task.
generateBuildConfig|GenerateBuildConfig| The task that generates the BuildConfig class.
javaCompile|JavaCompile|The task that compiles the Java code.
processJavaResources|Copy|处理Java资源的task
assemble|DefaultTask|Variant的标志性assemble task

ApplicationVariant附加属性:

Property Name|  Property Type| Description
----|------|----
buildType|BuildType|The BuildType of the variant.
productFlavors|List<ProductFlavor>|Variant的ProductFlavor。一般不为空但也允许空值.
mergedFlavor|ProductFlavor|android.defaultConfig和variant.productFlavors的合并.
signingConfig|SigningConfig|Variant使用的SigningConfig对象
isSigningReady|boolean| true if the variant has all the information needed to be signed.
testVariant|BuildVariant|将会测试这个Variant的TestVariant
dex|Dex|将代码打包成dex的task。如果这个Variant是个库，这个值可以为空.
packageApplication|PackageApplication|The task that makes the final APK. Can be null if the variant is a library.
zipAlign|ZipAlign|The task that zipaligns the apk. Can be null if the variant is a library or if the APK cannot be signed.
install|DefaultTask|The installation task. Can be null.
uninstall|DefaultTask|The uninstallation task.

LibraryVariant属性：

Property Name|  Property Type| Description
----|------|----
buildType|BuildType|The BuildType of the variant.
mergedFlavor|ProductFlavor|The defaultConfig values
testVariant|BuildVariant|The Build Variant that will test this variant.
packageLibrary|Zip|用于打包库项目的AAR文件。如果是个库项目，这个值不能为空.

TestVariant 属性：

Property Name|  Property Type| Description
----|------|----
buildType|BuildType|The BuildType of the variant
productFlavors|List<ProductFlavor>|Variant的ProductFlavor。一般不为空但也允许空值.
mergedFlavor|ProductFlavor|android.defaultConfig和variant.productFlavors的合并.
signingConfig|SigningConfig|Variant使用的SigningConfig对象
isSigningReady|boolean| true if the variant has all the information needed to be signed.
testVariant|BuildVariant|将会测试这个Variant的TestVariant
dex|Dex|将代码打包成dex的task。如果这个Variant是个库，这个值可以为空.
packageApplication|PackageApplication|The task that makes the final APK. Can be null if the variant is a library.
zipAlign|ZipAlign|The task that zipaligns the apk. Can be null if the variant is a library or if the APK cannot be signed.
install|DefaultTask|The installation task. Can be null.
uninstall|DefaultTask|The uninstallation task.
connectedAndroidTest|DefaultTask|在连接设备上行执行Android测试的task.
providerAndroidTest|DefaultTask|The task that runs the android tests using the extension API.

Android task特有类型API：
* ProcessManifest
    * File manifestOutputFile
* AidlCompile
    * File sourceOutputDir
* RenderscriptCompile
    * File sourceOutputDir
    * File resOutputDir
* MergeResources
    * File outputDir
* MergeAssets
    * File outputDir
* ProcessAndroidResources
    * File manifestFile
    * File resDir
    * File assetsDir
    * File sourceOutputDir
    * File textSymbolOutputDir
    * File packageOutputFile
    * File proguardOutputFile
* GenerateBuildConfig
    * File sourceOutputDir
* Dex
    * File outputFolder
* PackageApplication
    * File resourceFile
    * File dexFile
    * File javaResourceDir
    * File jniDir
    * File outputFile
        * 直接在Variant对象中使用“outputFile”可以改变最终的输出文件夹
* ZipAlign
    * File inputFile
    * File outputFile
        * 直接在Variant对象中使用“outputFile”可以改变最终的输出文件夹

每个task类型的API的限制，主要是由于Gradle的工作方式和Android plugin的配置方式.

首先，Gradle意味着拥有的task只能配置输入输出的路径和一些可能使用的选项标记。因此，task只能定义一些输入和输出。

其次，大部分的task的输入都不是单一的，一般都混合了_sourceSet_,_Build Types_和_Product Flavors_.为了保持构建文件的简洁和
可读性，就会让开发者通过DSL语言来修改这些对象来配置构建过程，而不是去深入来修改输入和task的选项。

另外需要注意，除了ZipAlign task外，其它所有类型有需要设置私有数据来使它们运行。这就意味着不可能手动的为这些类型，创建新的task。

这些API可能会被更改，一般来说，当前API是围绕着那些给定输入和输出的task，来添加额外的处理(如果可能的话)。欢迎反馈意见，特别是那些没有预见的需求。

对于其他的Gradle task(DefaultTask, JavaCompile, Copy, Zip),请参考Gradle文档。
