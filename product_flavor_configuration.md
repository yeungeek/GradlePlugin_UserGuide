# 产物定制配置
每一个flavor都是通过闭包来配置：
``` groovy
android {
    ...

    defaultConfig {
        minSdkVersion 8
        versionCode 10
    }

    productFlavors {
        flavor1 {
            packageName "com.example.flavor1"
            versionCode 20
        }

        flavor2 {
            packageName "com.example.flavor2"
            minSdkVersion 14
        }
    }
}
```
注意**<font color='green'>android.productFlavors.* </font>**对象与**<font color='green'>android.defaultConfig</font>**对象的ProductFlavor类型是相同的。意味着它们共享一样的属性。

defaultConfig为所有的flavor提供基本的配置，每一个flavor都可以重设这些配置的值。在上面的例子中，最终的结果：
* flavor1
    * packageName: com.example.flavor1
    * minSdkVersion: 8
    * versionCode: 20
* flavor2
    * packageName: com.example.flavor2
    * minSdkVersion: 14
    * versionCode: 10

通常情况下，_Build Type_配置会覆盖其他的配置。例如，，_Build Type_中的<font color='green'>packageNameSuffix </font>会被追加到 Product Flavor的<font color='green'>packageName </font>上。

也有一些情况是一些设置可以同时在Build Type和Product Flavor中设置。在这种情况下，按照个别为主的原则决定。

例如：<font color='green'>signingConfig</font>就是其中一个例子。`signingConfig`允许通过设置<font color='green'>android.buildTypes.release.signingConfig</font>为所有release共享相同的SigningConfig。或者通过设置<font color='green'>android.productFlavors.*.signingConfig</font>为每一个release包设置独立的SigningConfig
