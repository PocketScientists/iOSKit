Pod::Spec.new do |s|
  s.platform     = :ios, '6.0'
  s.name         = 'iOSKit'
  s.version      = '0.0.2'
  s.license      = 'MIT'
  s.authors      = { 'Alex Wolf' => 'a.wolf@nousguide.com' }
  s.summary      = 'iOS Additions to FoundationKit.'
  s.homepage     = "http://foundationk.it/"
  s.source       = { :git => 'https://github.com/PocketScientists/iOSKit.git' }
  s.source_files = 'Sources/*/*.{h,m}', 'Sources/iOSKit.h'
  s.resource = 'Resources/iOSKit.bundle'
  s.prefix_header_contents = '
    #import <Foundation/Foundation.h>
    #import <UIKit/UIKit.h>
    #import "FoundationKit.h"
    #import "FKInternal.h"
  '
  s.requires_arc = true
  s.dependency 'FoundationKit'
end
