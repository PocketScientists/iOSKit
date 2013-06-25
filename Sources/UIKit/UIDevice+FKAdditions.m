#import "UIDevice+FKAdditions.h"
#import "UIApplication+FKAdditions.h"
#import "FKUniversal.h"
#include <sys/sysctl.h>
#include <ifaddrs.h>
#include <arpa/inet.h>

FKLoadCategory(UIDeviceFKAdditions);

@implementation UIDevice (FKAdditions)

- (NSString *)ipAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    // Free memory
    freeifaddrs(interfaces);
    
    return address;
}

- (NSString *)debugInformation {
    NSString *appName = FKApplicationName();
    NSString *appVersion = FKApplicationVersion();
    NSString *appShortVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]; 
    NSString *iphoneOSVersion = self.systemVersion;
    NSString *deviceType = self.hardwarePlatform;
    NSString *deviceLang = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSString *appPirated = [UIApplication sharedApplication].pirated ? @"\n-- POSSIBLY PIRATED --" : @"";
    
    if ([UIDevice currentDevice].jailbroken) {
        deviceType = [NSString stringWithFormat:@"%@ (Possibly Jailbroken)", deviceType];
    }
    
    return [NSString stringWithFormat:@"%@ %@ %@\niOS: %@\nDevice: %@\nLang: %@%@", 
            appName, appVersion, (appShortVersion ? appShortVersion : @""), iphoneOSVersion, deviceType, deviceLang, appPirated];
}

- (NSString *)hardwarePlatform {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    
    return platform;
}

- (BOOL)isJailbroken {
    BOOL jailbroken = NO;
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt/";
    NSFileManager *fileManger = [[NSFileManager alloc] init];
    
    if ([fileManger fileExistsAtPath:cydiaPath]) {
        jailbroken = YES;
    }
    
    if ([fileManger fileExistsAtPath:aptPath]) {
        jailbroken = YES;
    }
    
    return jailbroken;
}

- (BOOL)isCrappy {
    static BOOL isCrappyDevice = YES;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        BOOL isSimulator = NO;
        BOOL isIPad2 = ($isPad() && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]);
        BOOL hasRetina = [[UIScreen mainScreen] scale] > 1.f;
        
#if TARGET_IPHONE_SIMULATOR
        isSimulator = YES;
#endif
        if (isIPad2 || hasRetina || isSimulator) {
            isCrappyDevice = NO;
        }
    });
    
    return isCrappyDevice;
}

- (BOOL)isSimulator {
#if TARGET_IPHONE_SIMULATOR
    return YES;
#else
    return NO;
#endif
}

- (void)simulateMemoryWarning {
#ifdef FK_DEBUG
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"UISimulatedMemoryWarningNotification", NULL, NULL, true);
#endif
}

- (BOOL)hasFourInchDisplay {
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568.f);
}

@end
