# 基本原理和配置
正如前面提到的，在**<font color='green'>main</font>** sourceSet下面的就是**<fon
color='green'>androidTest</font>** sourceSet，默认路径在`src/androidTest/`下。
从这个测试_sourceSet_中可以构建出一个使用Android测试框架，并且可以发布到设备上测试应用的测试apk。这里包含了单元测试，集成测试，和后续的UI自动测试。

测试程序manifest中的`<instrumentation>`结构是自动生成的，但是你可以创建`src/androidTest/AndroidManifest.xml`文件来增加其他的组件到测试的manifest中。

下面是配置测试程序的一些值，可以在`<instrumentation>`节点中增加：
* **<font color='green'>testPackageName</font>**
* **<font color='green'>testInstrumentationRunner</font>**
* **<font color='green'>testHandleProfiling</font>**
* **<font color='green'>testFunctionalTest</font>**

正如前面所看到的，这些配置在**<font color='green'>defaultConfig </font>**对象中配置:
``` groovy
android {
    defaultConfig {
        testPackageName "com.test.foo"
        testInstrumentationRunner "android.test.InstrumentationTestRunner"
        testHandleProfiling true
        testFunctionalTest true
    }
}
```
在测试应用程序manifest文件中，`instrumentation`节点中的`testPackageName`属性会自动使用测试应用的package名称，即使这个名称已经在**<font color='green'>defaultConfig </font>**或者是_Build Type_对象中自定义过。这也是manifest文件自动生成的一个原因。

另外，这个_sourceSet_也可以配置自己的依赖。
默认情况下，应用程序和它拥有的依赖会被添加到测试应用的classpath中，但是也可以通过下面的方式进行扩展
``` groovy
dependencies {
    androidTestCompile 'com.google.guava:guava:11.0.2'
}
```
测试应用通过**<font color='green'>assembleTest</font>** task来构建。它不依赖main中的**<font color='green'>assemble</font>** task，不过需要手动来设置它，使它可以自动运行。

目前只有一个_Build Type_被测试。默认情况是**<font color='green'>debug</font>** _Build Type_,但是可以通过下面的方式进行重新配置：
``` groovy
android {
    ...
    testBuildType "staging"
}
```

