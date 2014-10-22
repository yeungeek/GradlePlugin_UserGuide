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
>注意: 不要使用使用在给定范围内已经存在的getter方法可能引起冲突的方法名.例如，在`defaultConfig { ...}`中调用`getVersionName()`会自动使用defaultConfig.getVersionName()方法去替代自定义的方法.

如果一个属性不是通过DSL来设置的，一些默认的值将被使用.下表是可能用到的默认值:

Property Name| Default value in DSL object | Default value
----|------|----
**<font color='green'>versionCode</font>**|-1| value from manifest if present
**<font color='green'>versionName</font>**|null| value from manifest if present
**<font color='green'>minSdkVersion</font>**|-1| value from manifest if present
**<font color='green'>targetSdkVersion</font>**|-1| value from manifest if present
**<font color='green'>applicationId</font>**|null| value from manifest if present
**<font color='green'>testApplicationId</font>**|null|applicationId + “.test”
**<font color='green'>testInstrumentationRunner</font>**|null|android.test.InstrumentationTestRunner
**<font color='green'>signingConfig</font>**|null|null
**<font color='green'>proguardFile</font>**|N/A (set only)|N/A (set only)
**<font color='green'>proguardFiles</font>**|N/A (set only)|N/A (set only)

如果你在构建脚本中使用了自定义逻辑来查询这些属性，第二列的值就变得很重要.例如,你可能会写:
``` groovy
if (android.defaultConfig.testInstrumentationRunner == null) {
    // assign a better default...
}
```
如果这值一直为`null`,那么在构建的时候将被替换成第3列的默认值,但是在DSL中没有包含该值,所以你无法查询该值
除非是真的有必要才会如此定义，这是为了预防解析应用的manifest文件.
