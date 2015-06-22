# 使用sourceCompatibility 1.7
使用Android KitKat (buildToolsVersion 19)，你可以使用diamond operator，multi-catch，switch中使用字符串，try with resource等等。为了实现这个，添加下面的配置。
``` groovy
android {
    compileSdkVersion 19
    buildToolsVersion "19.0.0"

    defaultConfig {
        minSdkVersion 7
        targetSdkVersion 19
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_7
        targetCompatibility JavaVersion.VERSION_1_7
    }
}
```
> 注意： 你可以设置 use **<font color='green'>minSdkVersion </font>**的值小于19，不过你只能使用除了try with resources之外的其他语言特性。如果要想使用try with resources特性，你必须设置使用use **<font color='green'>minSdkVersion </font>**版本为19.

你同样需要确认Gradle是否使用1.7或者更高版本的JDK。(Android Gradle plugin也需要0.6.1或者更高版本。)
