# 工程结构
上面提到的基本构建文件需要一个默认的文件结构.Gradle遵循约定优于配置的概念. 在尽可能的情况下提供合理的默认参数.
基本的工程有两个名为"source sets"组件.就是main source code和test code.它们分别位于:
* src/main/
* src/androidTest/

里面的每个文件目录都对应了相应的源组件.
对于Java插件和Android插件，他们对应的Java源代码和Java资源目录：
* java/
* resources/

对于Android插件，有额外的文件和文件目录：
* AndroidManifest.xml
* res/
* assets/
* aidl/
* rs/
* jni/

**注意：** src/androidTest/AndroidManifest.xml是不需要的，因为它会自动创建.


