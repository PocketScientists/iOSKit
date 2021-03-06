#import "FKNetworkActivityManager.h"

static NSMutableSet *networkUsers = nil;

FKDefineGCDQueueWithName(network_queue);

NS_INLINE void FKUpdateNetworkActivityIndicatorVisibility() {
    if (networkUsers.count > 0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    } else {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
}

@implementation FKNetworkActivityManager

+ (void)initialize {
    if (self == [FKNetworkActivityManager class]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            networkUsers = [NSMutableSet set];
        });
    }
}

+ (NSUInteger)numberOfNetworkUsers {
    __block NSUInteger count = 0;
    dispatch_sync(network_queue(), ^{
        count = networkUsers.count;
    });

    return count;
}

+ (void)addNetworkUser:(id)networkUser {
    if (networkUser != nil) {
        dispatch_async(network_queue(), ^{
            uintptr_t address = (uintptr_t)networkUser;
            [networkUsers addObject:@(address)];
            FKUpdateNetworkActivityIndicatorVisibility();
        });
    }
}

+ (void)removeNetworkUser:(id)networkUser {
    if (networkUser != nil) {
        dispatch_async(network_queue(), ^{
            uintptr_t address = (uintptr_t)networkUser;
            [networkUsers removeObject:@(address)];
            FKUpdateNetworkActivityIndicatorVisibility();
        });
    }
}

+ (void)removeAllNetworkUsers {
    dispatch_async(network_queue(), ^{
        [networkUsers removeAllObjects];
        FKUpdateNetworkActivityIndicatorVisibility();
    });
}

@end
