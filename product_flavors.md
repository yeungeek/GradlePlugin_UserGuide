# 产物定制
一个产物定制定义了从工程中构建一个应用的自定义版本。一个单一的工程可以同时定义不同的定制产物。

这个新的设计概念，是为了解决不同版本之间微小的差异。虽然工程生成了多个定制的版本，但本质上都是同一个应用，这种方式比使用库工程的方式个更好。

产物定制需要在`productFlavors`DSL容器中声明：
``` groovy
android {
    ....

    productFlavors {
        flavor1 {
            ...
        }

        flavor2 {
            ...
        }
    }
}
```
这里创建了两个flavor，名为`flavor1`和`flavor2`

> 注意：flavor的命名不能与已存在的Build Type或者androidTest这个sourceSet有冲突。
