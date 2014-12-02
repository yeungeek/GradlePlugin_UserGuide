# 普通项目和库项目的区别

一个库工程主要输出一个 `aar` 包(代表Android存档)，这是个编译文件(类似jar包或者.so文件)和资源文件(manifest，res，assets)的组合.

库工程还可以生成一个测试apk来独立测试.

assembleDebug assembleRelease会调起同样的anchor task，所以用通过命令行去构建是无差别的

至于其他的，库工程跟应用工程是一样的，都有`build type`，`product flavors`，可以生成多个版本的aar

注意，大多数的Build Type配置不支持库工程，然而你可以使用自定义`sourceSets`来配置库内容是用于工程使用还是测试使用.
