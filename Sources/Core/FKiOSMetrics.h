// Part of iOSKit http://foundationk.it

#import <iOSKit/UIApplication+FKConcise.h>
#import <iOSKit/FKUniversal.h>


NS_INLINE CGFloat FKBarHeightForOrientation(UIInterfaceOrientation orientation) {
	if ($isPad() || UIInterfaceOrientationIsPortrait(orientation)) {
        return 44.f;
    }
    
    return 32.f;
}

NS_INLINE CGFloat FKStatusBarHeight() {
    if ($app.statusBarHidden) {
        return 0.f;
    }
    
    return 20.f;
}
