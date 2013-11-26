// Part of iOSKit http://foundationk.it
//
// Derived from Sam Soffes' Custom-Licensed SSToolkit: http://github.com/samsoffes/sstoolkit

#import <UIKit/UIKit.h>

/**
 This category adds various additions to UIScrollView for making life easier.
 */

@interface UIScrollView (FKAdditions)

@property (nonatomic, readonly, getter = fkit_isAtBottom) BOOL fkit_atBottom;

/** The currently visible Rect of the scrollView */
@property (nonatomic, readonly) CGRect fkit_visibleRect;

/**
 Scrolls the scrollView to the top, without animation.
 */
- (void)fkit_scrollToTop;

/**
 Scrolls the scrollview to the top.
 
 @param animated Scrolling happens either with animation or without
 */
- (void)fkit_scrollToTopAnimated:(BOOL)animated;

/**
 This method sets the content inset for the tableView itself as well as for the scrollIndicator.
 
 @param contentInset The contentInset to set on the tableView and the scrollIndicators
 */
- (void)fkit_setContentAndScrollIndicatorInset:(UIEdgeInsets)contentInset;

@end
