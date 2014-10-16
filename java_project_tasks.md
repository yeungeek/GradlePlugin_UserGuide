# Java工程任务
Java插件创建了两个主要的任务，是main标识任务的依赖
* **<font color='green'>assemble</font>**
  * **<font color='green'>jar</font>**
这个任务创建了所有输出
* **<font color='green'>check</font>**
  * **<font color='green'>test</font>**
这个任务执行所有的测试

**<font color='green'>jar</font>**任务本身直接或者间接依赖于其他任务:
像**<font color='green'>classes</font>**将会编译Java源码.
**<font color='green'>testClasses</font>**会编译所有的测试，却很少被调用，因为**<font color='green'>test</font>**依赖于它(与**<font color='green'>classes</font>**任务类似)

通常情况下，你可能只需要调用**<font color='green'>assemble</font>**和**<font color='green'>check</font>**任务，可以忽略其他的任务.

你可以在件中[Java 插件](http://gradle.org/docs/current/userguide/java_plugin.html)中查看完整的任务列表和他们描述.


