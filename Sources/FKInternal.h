// Part of iOSKit http://foundationk.it

// if compiled against minimum OS-target iOS 5 (no runtime-check) use weak, else unsafe_unretained
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 50000
#define fk_weak weak
#else 
#define fk_weak unsafe_unretained
#endif