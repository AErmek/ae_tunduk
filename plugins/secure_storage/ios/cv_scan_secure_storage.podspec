#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint cv_scan_secure_storage.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'cv_scan_secure_storage'
  s.version          = '0.0.1'
  s.summary          = 'Keystore/Keychain-backed encrypted key-value storage for CV-Scan.'
  s.description      = <<-DESC
Keystore/Keychain-backed encrypted key-value storage for CV-Scan.
                       DESC
  s.homepage         = 'https://cvscan.ae.kg'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'CV-Scan' => 'dev@cvscan.ae.kg' }
  s.source           = { :path => '.' }
  s.source_files = 'cv_scan_secure_storage/Sources/cv_scan_secure_storage/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'secure_storage_privacy' => ['secure_storage/Sources/secure_storage/PrivacyInfo.xcprivacy']}
end
