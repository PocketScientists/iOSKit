#import "UIScreen+FKAdditions.h"
#import "UIApplication+FKConcise.h"

FKLoadCategory(UIScreenFKAdditions);

@implementation UIScreen (FKAdditions)

- (CGRect)fkit_currentBounds {
	return [self fkit_boundsForOrientation:$appOrientation];
}

- (CGRect)fkit_boundsForOrientation:(UIInterfaceOrientation)orientation {
	CGRect bounds = [self bounds];
    
	if (UIInterfaceOrientationIsLandscape(orientation)) {
		CGFloat buffer = bounds.size.width;
        
		bounds.size.width = bounds.size.height;
		bounds.size.height = buffer;
	}
	return bounds;
}

- (BOOL)fkit_isRetinaDisplay {
	static dispatch_once_t predicate;
	static BOOL answer;
    
	dispatch_once(&predicate, ^{
		answer = ([self respondsToSelector:@selector(scale)] && [self scale] == 2);
	});
    
	return answer;
}

@end
