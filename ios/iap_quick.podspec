#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint iap_quick.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'iap_quick'
  s.version          = '0.0.11'
  s.summary          = 'This plugin makes integrating **In-App Purchase** in your Flutter app easy and fast. With a simple API, multi-platform support, and secure payment processing, this plugin lets you focus on user experience without worrying about complex technical issues.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/minhto2811/iap_quick'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'minhto28.dev@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'iap_quick_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end
