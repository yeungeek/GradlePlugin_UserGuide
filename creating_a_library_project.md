# 创建一个库工程

一个库工程跟一个常规的Android工程很相似，只是有部分不同.

既然构建库跟构建工程不同，那肯定用不同的插件，但是两个插件内部其实共享大部分同样的代码，且由同一个jar提供：com.android.tools.build.gradle

```
buildscript {
    repositories {
        mavenCentral()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:0.5.6'
    }
}

apply plugin: 'android-library'

android {
    compileSdkVersion 15
}
```

这里创建了一个库工程，使用API 15编译，SourceSets dependencies的处理就跟在应用工程中一样，且可以用同样的方式自定义.
