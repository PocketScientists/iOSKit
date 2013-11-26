// Part of iOSKit http://foundationk.it

#import <UIKit/UIKit.h>

/**
 This category adds support for super-easy rotation of a UIView, when autoresizingMasks just
 don't work. You can specify a portraitFrame as well as a landscapeFrame and have methods to
 set the corresponding frame animated or directly (when already used in an animation-block like
 willAnimateToInterfaceOrientation.
 */

@interface UIView (FKRotation)

/** property to specify a frame for portrait orientation */
@property (nonatomic, assign, setter = fkit_setPortraitFrame:) CGRect fkit_portraitFrame;
/** property to specify a frame for landscape orientation */
@property (nonatomic, assign, setter = fkit_setLandscapeFrame:) CGRect fkit_landscapeFrame;
/** specifies whether at least a portrait or landscape frame was set for this view */
@property (nonatomic, readonly) BOOL fkit_hasPortraitOrLandscapeFrame;

/**
 This creates a view with the portrait frame and sets it's portraitFrame/landscapeFrame properties
 
 @param portraitFrame the portrait frame of the view
 @param landscapeFrame the landscape frame of the view
 @return a UIView that was created with initWithFrame:portraitFrame and has a portraitFrame and landscapeFrame set
 */
+ (id)fkit_viewWithPortraitFrame:(CGRect)portraitFrame landscapeFrame:(CGRect)landscapeFrame;

/**
 This creates a view with the portrait frame and sets it's portraitFrame/landscapeFrame properties
 
 @param portraitFrame the portrait frame of the view
 @param landscapeOrigin the origin of the frame of the view in landscape orientation
 @return a UIView that was created with initWithFrame:portraitFrame and it's landscapeFrame is set to [landscapeOrigin, portraitFrame.size]
 */
+ (id)fkit_viewWithPortraitFrame:(CGRect)portraitFrame landscapeOrigin:(CGPoint)landscapeOrigin;

/**
 * Returns the frame set for the given interface orientation
 * 
 * @param interfaceOrientation the interface orientation that is used the determine the frame
 * @return the frame that is set for the given interface orientation
 */
- (CGRect)fkit_frameForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

/**
 * Animates the frame to the frame for the given interface orientation
 *
 * @param toInterfaceOrientation the interface orientation that specifies the frame used
 * @param duration the duration of the animation
 */
- (void)fkit_animateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration;

/**
 * Sets the frame of the UIView to the frame for the current statusBarOrientation
 */
- (void)fkit_layoutView;

/**
 * Sets the frame of the UIView to the frame for the given interface orientation
 *
 * @param interfaceOrientation the interface orientation that specifies the frame used
 */
- (void)fkit_setFrameForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

/**
 * Sets the frames of all subviews that support rotation (hasPortraitAndLandscapeFrames == YES) (not recursive!) 
 * to the frame for the given interface orientation
 *
 * @param interfaceOrientation the interface orientation that specifies the frame used
 */
- (void)fkit_setSubviewFramesForInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation;

/**
 * Sets the frames of all subviews that support rotation (hasPortraitAndLandscapeFrames == YES)
 * to the frame for the given interface orientation, can work recursively over whole view-hierarchy
 *
 * @param interfaceOrientation the interface orientation that specifies the frame used
 * @param recursive flag that indicates if the method should be called recursively over whole view-hierarchy
 */
- (void)fkit_setSubviewFramesForInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation recursive:(BOOL)recursive;

@end
