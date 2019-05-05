#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

static bool kEnabled;
static double kDistanceFromTop;
static CGFloat kDockHeight;
static bool kDockEnabled;
static CGFloat screenHeight, screenWidth;

%hook SBRootFolderView
- (void)setStatusBarHeight:(double)arg1 {
screenHeight= [[UIScreen mainScreen]bounds].size.height;
screenWidth = [[UIScreen mainScreen]bounds].size.width;

if(kEnabled && (screenHeight>screenWidth)) {
    arg1 = kDistanceFromTop;
    return %orig(arg1);
}
else {
return %orig; }
}

-(CGFloat)dockHeight {
screenHeight= [[UIScreen mainScreen]bounds].size.height;
screenWidth = [[UIScreen mainScreen]bounds].size.width;

if(kEnabled && kDockEnabled &&(screenHeight>screenWidth)) {
return kDockHeight;
}
else { return %orig; }
}
%end

%hook SBDockView 
-(CGFloat)dockHeight {
screenHeight= [[UIScreen mainScreen]bounds].size.height;
screenWidth = [[UIScreen mainScreen]bounds].size.width;

if(kEnabled && kDockEnabled &&(screenHeight>screenWidth)) {
return kDockHeight;
}
else { return %orig; }
}
%end

static void
loadPrefs() {
    static NSUserDefaults *prefs = [[NSUserDefaults alloc]
                                    initWithSuiteName:@"com.i0stweak3r.iconslide"];
    
    kEnabled =  [[prefs objectForKey:@"enabled"] boolValue] ? [prefs boolForKey:@"enabled"] : NO;
    
  kDockEnabled= [[prefs objectForKey:@"dockEnabled"] boolValue] ? [prefs boolForKey:@"dockEnabled"] : NO;

kDistanceFromTop = [[prefs objectForKey: @"statusBarHeight"] doubleValue] ? [[prefs objectForKey: @"statusBarHeight"] doubleValue] : 100.f;

kDockHeight = [[prefs objectForKey: @"dockHeight"] floatValue] ? [[prefs objectForKey: @"dockHeight"] floatValue] : 103.f;


}

%ctor {
    CFNotificationCenterAddObserver(
                                    CFNotificationCenterGetDarwinNotifyCenter(), NULL,
                                    (CFNotificationCallback)loadPrefs,
                                    CFSTR("com.i0stweak3r.iconslide-prefsreload"), NULL,
                                    CFNotificationSuspensionBehaviorDeliverImmediately);
    loadPrefs();
}


