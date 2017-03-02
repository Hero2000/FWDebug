# FWDebug

[![Pod Version](http://img.shields.io/cocoapods/v/FWDebug.svg?style=flat)](http://cocoadocs.org/docsets/FWDebug/)
[![Pod Platform](http://img.shields.io/cocoapods/p/FWDebug.svg?style=flat)](http://cocoadocs.org/docsets/FWDebug/)
[![Pod License](http://img.shields.io/cocoapods/l/FWDebug.svg?style=flat)](https://github.com/lszzy/FWDebug/blob/master/LICENSE)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/lszzy/FWDebug)

iOS调试库，方便iOS开发和测试。

## 使用教程
真机或模拟器中5秒内摇一摇两次即可出现调试菜单。功能如下：

* FLEX调试工具
* Class和Protocol的头文件查看
* FPS、内存、CPU占用率显示
* 手机、App信息查看
* App崩溃日志的记录、查看
* App文件管理器
* Documents文件http、webdav服务器

## 安装教程
推荐使用CocoaPods安装，自动管理依赖和环境配置。如需手工导入请参考Example项目配置。

### CocoaPods
本调试库支持Debug和Release环境，一般Debug模式开启。Podfile示例：

	platform :ios, '8.0'
	# use_frameworks!

	target 'Example' do
	  pod 'FWDebug', :configurations => ['Debug']
	end

### Carthage
本调试库支持Carthage，Cartfile示例：

	github "lszzy/FWDebug"

执行`carthage update`并拷贝`FWDebug.framework`到项目即可。

## 第三方库
本调试库使用了第三方库，在此感谢所有第三方库的作者。列举如下：
	
* [FLEX](https://github.com/Flipboard/FLEX)
* [GCDWebServer](https://github.com/swisspol/GCDWebServer)
* [RuntimeBrowser](https://github.com/nst/RuntimeBrowser)
* [KSCrash](https://github.com/kstenerud/KSCrash)

## 官方网站
[大勇的网站](http://www.ocphp.com)
