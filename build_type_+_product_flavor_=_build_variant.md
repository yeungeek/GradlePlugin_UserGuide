# 构建类型+产物定制=构建变种版本
正如前面看到的，每一个 _Build Type_都会生成一个新的APK。

_Prduct Flavors_同样有这个效果：工程的输出将会组合所有的可能,_Build Types_和_Product Flavor_(如果有Flavor定义存在的话)

每一种组合(包含_Build Type_和_Product Flavor_)，就是一个_Build Variant_(构建变种版本).

例如，在上面的例子中，声明的Favory与默认的`debug`和`release`两个_Build Type_将会生成以下的4个_Build Variants_:
* Flavor1 - debug
* Flavor1 - release
* Flavor2 - debug
* Flavor2 - release

工程中如果么有定义flavor同样还是有_Build Variants_，但是只是用的默认的flavor和配置。默认的flavor/config是没有名字的，所以生成的Build Variant的列表和Build Type列表一样。
