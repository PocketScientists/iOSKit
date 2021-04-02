Pod::Spec.new do |s|
  s.platform     = :ios, '11.0'
  s.name         = 'iOSKit'
  s.version      = '1.0.3'
  s.license      = 'MIT'
  s.authors      = { 'Alex Wolf' => 'a.wolf@nousguide.com' }
  s.summary      = 'iOS Additions to FoundationKit.'
  s.homepage     = "http://foundationk.it/"
  s.source       = { :git => 'https://github.com/PocketScientists/iOSKit.git' }
  s.source_files = 'Sources/*/*.{h,m}', 'iOSKit/iOSKit.h'
  s.public_header_files = 'Sources/*/*.h', 'iOSKit/iOSKit.h'

  s.frameworks = 'CoreGraphics', 'Foundation', 'UIKit'

  s.resource_bundle = { 'iOSKit' => 'Resources/*' }
  s.prefix_header_contents = '
    #import <Foundation/Foundation.h>
    #import <UIKit/UIKit.h>
    #import <FoundationKit/FoundationKit.h>
  '
  s.requires_arc = true
  s.dependency 'FoundationKit'
end
