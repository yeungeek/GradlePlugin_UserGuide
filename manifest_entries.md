# Manifest属性
通过DSL可以配置下面的manifest属性:
* minSdkVersion
* targetSdkVersion
* versionCode
* versionName
* applicationId(有效的包名--查看[ApplicationId versus PackageName](http://tools.android.com/tech-docs/new-build-system/applicationid-vs-packagename)了解更多信息)
* Package Name for the test application
* Instrumentation test runner

例子：
``` groovy
android {
    compileSdkVersion 19
    buildToolsVersion "19.0.0"

    defaultConfig {
        versionCode 12
        versionName "2.0"
        minSdkVersion 16
        targetSdkVersion 16
    }
}
```
在**<font color='green'>android</font>**元素中的**<font color='green'>defaultConfig</font>**定义了所有的配置.

在android插件的先前版本使用`packageName`来配置manifest的`packageName`属性.
从0.11.0版本开始,你应该在`build.gradle`中使用`applicationId`来配置manifest的`packageName`属性.
这是被用来消除在应用程序的packageName(程序的ID)和java包名之间的混乱.

在构建文件中定义的强大之处是它的动态性.
例如.可以从文件中或者是自定义的逻辑代码中读取版本名称:

``` groovy

def computeVersionName() {
    ...
}

android {
    compileSdkVersion 19
    buildToolsVersion "19.0.0"

    defaultConfig {
        versionCode 12
        versionName computeVersionName()
        minSdkVersion 16
        targetSdkVersion 16
    }
}
```
>注意: 不要使用使用在给定范围内已经存在的getter方法可能引起冲突的方法名.例如，在`defaultConfig { ...}`中调用`getVersionName()`会自动
