# FWDebug

[![Pod Version](http://img.shields.io/cocoapods/v/FWDebug.svg?style=flat)](http://cocoadocs.org/docsets/FWDebug/)
[![Pod Platform](http://img.shields.io/cocoapods/p/FWDebug.svg?style=flat)](http://cocoadocs.org/docsets/FWDebug/)
[![Pod License](http://img.shields.io/cocoapods/l/FWDebug.svg?style=flat)](https://github.com/lszzy/FWDebug/blob/master/LICENSE)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/lszzy/FWDebug)

# [中文](README_CN.md)

iOS debugging library, support for iOS8 +, without adding any code to facilitate iOS development and testing.

## Screenshot
![Screenshot](FWDebug.gif)

## Tutorial
Real machine or simulator shaking within 5 seconds twice to appear debug menu. Functions are as follows:

* FLEX debugging tools
* Circular reference detection and analysis
* Class and Protocol header files to view
* FPS, memory, CPU occupancy rate display
* Phone, App information view
* App crash log records, view
* App file manager
* Documents file http, webdav server
* iOS10 + real machine NSLog display
* Generate dylib dynamic library and inject other App
* App encryption tools

## Installation
CocoaPods installation is recommended for automatic management of dependencies and environment configuration. For manual import, please refer to the Example project configuration.

### CocoaPods
This debug library supports Debug and Release environment, the general Debug mode is turned on, please remove when submitting AppStore. 
Podfile example:

	platform :ios, '8.0'
	# use_frameworks!

	target 'Example' do
	  pod 'FWDebug', :configurations => ['Debug']
	end

### Carthage
This debug library supports Carthage, Cartfile example:

	github "lszzy/FWDebug"

Execute `carthage update` and copy `FWDebug.framework` to the project.

## Changelog
1.4.1 version:

    * Optimized circular reference detection

1.4.0 version:

    * Add circular reference detection for classes and objects
    * Add circular reference detection for current ViewController

1.3.1 version:

	* Example project iPhoneX adaptation
	* Repair Documents file http server

1.3.0 version:

	* Remove some tools, keep the core functions
	* Reconstruction, optimization code
	* Add App Encryption Tool

1.2.1 version:

	* Sync FLEX latest trunk code
	* Add screenshots, update instructions

1.2.0 version:

	* Repair iOS10 real machine NSLog display
	* Add mobile app list to view
	* Add JSPatch dynamically modify the application
	* Add dylib projects and inject existing App tools

1.1.0 version:
	
	* Adjust the project structure
	* Update FLEX to 2.4.0 version
	* Add crash log debugging
	* Add Documents file http, webdav server
	* Add header files to view
	* Add FPS display
	* Add App, Device Information

1.0.0 version:

	* Add FLEX debugging

## Vendor
This debug library uses a third-party library, thanks to all third-party library authors. Listed below:
	
* [FLEX](https://github.com/Flipboard/FLEX)
* [GCDWebServer](https://github.com/swisspol/GCDWebServer)
* [RuntimeBrowser](https://github.com/nst/RuntimeBrowser)
* [KSCrash](https://github.com/kstenerud/KSCrash)
* [fishhook](https://github.com/facebook/fishhook)
* [FBRetainCycleDetector](https://github.com/facebook/FBRetainCycleDetector)

## Support
[ocphp.com](http://www.ocphp.com)
