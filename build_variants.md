# 构建变种版本
新的构建系统其中的一个目标就是，允许为同一个应用构建不同的版本。

这里有两个主要的应用场景：
1. 同一个应用不同版本
   例如：一个免费的demo版本，一个收费的专业版本。
2. 同一个应用打包成不同的apk，发布到google play。
   点击该链接[more](http://developer.android.com/google/play/publishing/multiple-apks.html)，查看更多信息
3. 综合1和2的情况

这个目标就是同一个工程能够生成不同的APK，取代使用一个库工程，两个或者两个以上的应用工程来生成APK的方式。

