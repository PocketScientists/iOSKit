#import "FKTableViewCellView.h"
#import "FKTableViewCell.h"

@implementation FKTableViewCellView

- (id)initWithFrame:(CGRect)frame {
	if((self = [super initWithFrame:frame])) {
		self.contentMode = UIViewContentModeRedraw;
	}
    
	return self;
}

- (void)drawRect:(CGRect)rect {
    UIView *v = self;
    while (v && ![v isKindOfClass:[FKTableViewCell class]]) v = v.superview;
    
    [((FKTableViewCell *)v) drawContentViewInRect:rect highlighted:NO];
}

@end

@implementation FKTableViewSelectedCellView

- (id)initWithFrame:(CGRect)frame {
	if((self = [super initWithFrame:frame])) {
		self.contentMode = UIViewContentModeRedraw;
	}
    
	return self;
}

- (void)drawRect:(CGRect)rect {
    UIView *v = self;
    while (v && ![v isKindOfClass:[FKTableViewCell class]]) v = v.superview;
    
	[((FKTableViewCell *)v) drawContentViewInRect:rect highlighted:YES];
}

@end
