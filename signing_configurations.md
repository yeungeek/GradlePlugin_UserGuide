# 签名配置
签名一个应用程序需要以文件:
* keystore
* keystore密码
* key的别名(alias)
* key密码
* 存储类型

位置,键名,两个密码和存储类型一起组成了签名配置(*SigningConfig*)

默认情况下, **<font color='green'>debug</font>**被配置成使用debug keystore,keystore使用了已知的密码和一个已知密码的默认key.
debug keystore的位置在`$HOME/.android/debug.keystore`，如果不存在则会自动创建该文件.

**<font color='green'>debug</font>**构建类型会自动使用**<font color='green'>debug</font>**的签名配置.

默认配置中可以创建其他配置或者自定义构建.通过**<font color='green'>signingConfigs</font>** DSL容器来完成:
``` groovy
android {
    signingConfigs {
        debug {
            storeFile file("debug.keystore")
        }

        myConfig {
            storeFile file("other.keystore")
            storePassword "android"
            keyAlias "androiddebugkey"
            keyPassword "android"
        }
    }

    buildTypes {
        foo {
            debuggable true
            jniDebuggable true
            signingConfig signingConfigs.myConfig
        }
    }
}
```

上面的代码片段修改了debug keystore的位置到工程的根目录下.设置使用了上述的配置会自动影响其他的构建类型,在上述的例子就是**<font color='green'>debug</font>**的构建类型.

上述的代码片段使用了新的配置来创建新的签名配置和新的构建类型.

> 注意:
只有在默认的路径下的debug keystore会自动创建.改变了debug keystore路径不会按需进行创建.使用默认debug keystore的路径来创建一个不同名称的SigningConfig，还是会在默认路径下创建keystore.换句话说,是否会自动创建keystore，不是根据配置的名称，而是根据keystore的路径.

**注意:**
> keystore的路径经常使用工程的根路径,也可以使用绝对路径，虽然这样是不推荐的(除了自动创建出来的debug keystore).


**注意:**
> **如果你将这些文件添加到版本控制中，你可能不想把密码存储在文件中.下面的`Stack Overflow`解答提供了如何从控制台或者从环境变量中读取密码的方法:** http://stackoverflow.com/questions/18328730/how-to-create-a-release-signed-apk-file-using-gradle
