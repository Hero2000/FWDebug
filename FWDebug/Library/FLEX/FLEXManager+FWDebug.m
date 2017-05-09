//
//  FLEXManager+FWDebug.m
//  FWDebug
//
//  Created by wuyong on 17/2/28.
//  Copyright © 2017年 ocphp.com. All rights reserved.
//

#import "FLEXManager+FWDebug.h"
#import "FLEXExplorerViewController.h"
#import "FLEXFileBrowserTableViewController.h"
#import "FLEXObjectExplorerViewController+FWDebug.h"
#import "FLEXClassExplorerViewController+FWDebug.h"
#import "FLEXFileBrowserTableViewController+FWDebug.h"
#import "FLEXExplorerToolbar+FWDebug.h"
#import "FLEXSystemLogTableViewController+FWDebug.h"
#import "FWDebugSystemInfo.h"
#import "FWDebugWebServer.h"
#import "FWDebugAppList.h"
#import "FWDebugJSPatch.h"
#import <objc/runtime.h>

@interface FLEXManager ()

@property (nonatomic, strong) FLEXExplorerViewController *explorerViewController;

@end

@interface FLEXExplorerViewController ()

@property (nonatomic, strong) FLEXExplorerToolbar *explorerToolbar;

@end

@implementation FLEXManager (FWDebug)

+ (void)load
{
    method_exchangeImplementations(
                                   class_getInstanceMethod(self, @selector(showExplorer)),
                                   class_getInstanceMethod(self, @selector(fwDebugShowExplorer))
                                   );
    
    method_exchangeImplementations(
                                   class_getInstanceMethod(self, @selector(hideExplorer)),
                                   class_getInstanceMethod(self, @selector(fwDebugHideExplorer))
                                   );
}

+ (void)fwDebugLoad
{
    [FLEXManager sharedManager].networkDebuggingEnabled = YES;
    
    [[FLEXManager sharedManager] registerGlobalEntryWithName:@"📘  App Browser" viewControllerFutureBlock:^UIViewController *{
        return [[FLEXFileBrowserTableViewController alloc] initWithPath:[NSBundle mainBundle].bundlePath];
    }];
    
    [[FLEXManager sharedManager] registerGlobalEntryWithName:@"🍀  JSPatch Editor" viewControllerFutureBlock:^UIViewController *{
        return [[FWDebugJSPatch alloc] init];
    }];
    
    [[FLEXManager sharedManager] registerGlobalEntryWithName:@"💟  System Apps" viewControllerFutureBlock:^UIViewController *{
        return [[FWDebugAppList alloc] init];
    }];
    
    [[FLEXManager sharedManager] registerGlobalEntryWithName:@"📳  Device Info" viewControllerFutureBlock:^UIViewController *{
        return [[FWDebugSystemInfo alloc] init];
    }];
    
    [[FLEXManager sharedManager] registerGlobalEntryWithName:@"📶  Web Server" viewControllerFutureBlock:^UIViewController *{
        return [[FWDebugWebServer alloc] init];
    }];
    
    [[FLEXManager sharedManager] registerGlobalEntryWithName:@"📄  Crash Log" viewControllerFutureBlock:^UIViewController *{
        NSString *crashLogPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        crashLogPath = [[crashLogPath stringByAppendingPathComponent:@"FWDebug"] stringByAppendingPathComponent:@"CrashLog"];
        return [[FLEXFileBrowserTableViewController alloc] initWithPath:crashLogPath];
    }];
}

- (FWDebugFpsInfo *)fwDebugFpsInfo
{
    FWDebugFpsInfo *fpsInfo = objc_getAssociatedObject(self, _cmd);
    if (!fpsInfo) {
        fpsInfo = [[FWDebugFpsInfo alloc] init];
        fpsInfo.delegate = self;
        objc_setAssociatedObject(self, _cmd, fpsInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [self.explorerViewController.explorerToolbar.fwDebugFpsItem setFpsData:fpsInfo.fpsData];
    }
    return fpsInfo;
}

- (void)fwDebugShowExplorer
{
    [self fwDebugShowExplorer];
    
    [self.fwDebugFpsInfo start];
}

- (void)fwDebugHideExplorer
{
    [self fwDebugHideExplorer];
    
    [self.fwDebugFpsInfo stop];
}

- (void)fwDebugFpsInfoChanged:(FWDebugFpsData *)fpsData
{
    [self.explorerViewController.explorerToolbar.fwDebugFpsItem setFpsData:fpsData];
}

@end
