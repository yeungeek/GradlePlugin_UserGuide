# 运行ProGuard
从`Gradle Plugin for ProGuard version 4.10`后就开始支持`ProGuard`.ProGuard插件是自动应用，而且任务是自动创建的,如果构建类型的`minifyEnabled`属性被设置成运行ProGuard.
``` groovy
android {
    buildTypes {
        release {
            minifyEnabled true
            proguardFile getDefaultProguardFile('proguard-android.txt')
        }
    }

    productFlavors {
        flavor1 {
        }
        flavor2 {
            proguardFile 'some-other-rules.txt'
        }
    }
}
```
构建变种使用在它的构建类型和产物定制中声明的规则文件.

这里有两个默认规则文：
* proguard-android.txt
* proguard-android-optimize.txt

两个文件在SDK的路径下.使用`getDefaultProguardFile()`方法会返回文件的全路径.它们除了是否进行优化之外,其它都是相同的.
