// Part of iOSKit http://foundationk.it
// 
// Partly based on Enormego Cocoa Helpers by Shaun Harrison.
// Partly based on Three20 Framework by Facebook.

#import <UIKit/UIKit.h>

/**
 This category adds support for easy coping with UIView-Hierarchies.
 */

@interface UIView (FKHierarchy)

@property (nonatomic, readonly) UIViewController *fkit_viewController;

- (UIView *)fkit_superviewWithClass:(Class)aClass;                        // strict:NO
- (UIView *)fkit_superviewWithClass:(Class)aClass strict:(BOOL)strict;

- (UIView *)fkit_descendantOrSelfWithClass:(Class)aClass;                 // strict:NO
- (UIView *)fkit_descendantOrSelfWithClass:(Class)aClass strict:(BOOL)strict;

- (void)fkit_removeAllSubviews;


- (void)fkit_bringToFront;
- (void)fkit_sendToBack;
- (BOOL)fkit_isInFront;
- (BOOL)fkit_isAtBack;

@end
