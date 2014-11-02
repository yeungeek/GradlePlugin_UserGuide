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



