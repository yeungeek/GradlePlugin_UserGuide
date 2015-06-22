# 说明
Gradle Plugin User Guide中文版
========================
[![Build Status](https://www.gitbook.io/button/status/book/yeungeek/gradle-plugin-user-guide)](https://www.gitbook.io/book/yeungeek/gradle-plugin-user-guide/activity)

Gradle Plugin的使用，并结合例子说明

* Gradle Plugin User Guide中文版 正在翻译当中 欢迎大家一起加入
* github: https://github.com/yeungeek/GradlePlugin_UserGuide
* 使用了gitbook进行编辑：http://yeungeek.gitbooks.io/gradle-plugin-user-guide/
* 原文地址：http://tools.android.com/tech-docs/new-build-system/user-guide
* 我会开放权限给需要加入的同学，联系我: yeungeek#gmail.com

**翻译进度**

章节| 时间 | 译者|实例
----|------|----|----
1 | 14.09.29  | [yeungeek](https://github.com/yeungeek)|[HelloWorld](https://github.com/yeungeek/Android-Gradle-Samples/tree/master/HelloWorld)
2 | 14.09.29  | [yeungeek](https://github.com/yeungeek)|-
3.1 | 14.10.08  | [yeungeek](https://github.com/yeungeek)|
3.2 | 14.10.09  | [yeungeek](https://github.com/yeungeek)|
3.3 | 14.10.10  | [yeungeek](https://github.com/yeungeek)|
3.4 | 14.10.20  | [yeungeek](https://github.com/yeungeek)|
4.1 | 14.11.03  | [yeungeek](https://github.com/yeungeek)|
4.2 | 14.11.05  | [yeungeek](https://github.com/yeungeek)|
4.3 | 14.12.01  | [flyouting](https://github.com/flyouting)|
5.1 | 15.05.01  | [yeungeek](https://github.com/yeungeek)|
5.2 | 15.05.02  | [yeungeek](https://github.com/yeungeek)|
5.3 | 15.05.02  | [yeungeek](https://github.com/yeungeek)|
5.4 | 15.05.04  | [yeungeek](https://github.com/yeungeek)|
5.5 | 15.05.05  | [yeungeek](https://github.com/yeungeek)|
6 | 15.06.21  | [yeungeek](https://github.com/yeungeek)|
7 | 15.06.22  | [yeungeek](https://github.com/yeungeek)|

**特色**

我们是有实例的人

gradle对应的示例代码，可以fork [Samples](https://github.com/yeungeek/Android-Gradle-Samples).

# Summary

* [序言](README.md)
* [简介](11_goals_of_the_new_build_system.md)
   * [新构建系统的目标](goals_of_the_new_build_system.md)
   * [为什么使用Gradle?](why_gradle.md)
* [配置](req.md)
* [基础工程](requirements.md)
   * [简单构建文件](031_simple_build_files.md)
   * [工程结构](project_structure.md)
       * [配置工程结构](configuring_the_structure.md)
   * [构建任务](build_tasks.md)
       * [通用任务](general_tasks.md)
       * [Java工程任务](java_project_tasks.md)
       * [Android任务](android_tasks.md)
   * [基本的构建自定义](basic_build_customization.md)
       * [Manifest属性](manifest_entries.md)
       * [构建类型](build_types.md)
       * [签名配置](signing_configurations.md)
       * [运行ProGuard](running_proguard.md)
* [依赖,Android库和多项目设置](dependencies,_android_libraries_and_multi-project_setup.md)
   * [依赖二进制包](dependencies_on_binary_packages.md)
       * [本地包](local_packages.md)
       * [远程文件](remote_artifacts.md)
   * [多项目设置](multi_project_setup.md)
   * [库工程](library_projects.md)
       * [创建一个库工程](creating_a_library_project.md)
       * [普通项目和库项目的区别](differences_between_a_project_and_a_library_project.md)
       * [引用一个库工程](referencing_a_library.md)
       * [库工程发布](library_publication.md)
* [测试](testing.md)
   * [基本原理和配置](basics_and_configuration.md)
   * [运行测试](running_tests.md)
   * [测试Android库工程](testing_android_libraries.md)
   * [测试报告](test_reports.md)
       * [独立工程](single_projects.md)
       * [多工程报告](multi-projects_reports.md)
   * [Lint支持](lint_support.md)
* [构建变种版本](build_variants.md)
   * [产物定制](product_flavors.md)
   * [构建类型+产物定制=构建变种版本](build_type_+_product_flavor_=_build_variant)
   * [产物定制配置](product_flavor_configuration.md)
   * [源组件和依赖](sourcesets_and_dependencies.md)
   * [构建和任务](building_and_tasks.md)
   * [测试](testing.md)
   * [多定制的变种版本](multi-flavor_variants.md)
* [高级构建的自定义](advanced_build_customization.md)
   * [构建选项](build_options.md)
       * [Java编译选项](java_compilation_options.md)
       * [aapt选项](aapt_options.md)
       * [dex选项](dex_options.md)
   * [操作tasks](manipulating_tasks.md)
   * [构建类型和产物定制的属性引用](buildtype_and_product_flavor_property_reference.md)
   * [使用sourceCompatibility 1.7](using_sourcecompatibility_17.md)
