
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "SMTPLibrary"
  s.version      = "0.0.1"
  s.summary      = "A quick SMTP client for iOS. Fork of skpsmtpmessage, by Ian Baird."
  s.description  = "To use this in your app, add the files in the SMTPLibrary directory to your project. The Demo folder contains an Xcode project which will build a sample iPhone app."

  s.homepage     = "https://github.com/PauliusVindzigelskis/SKPSMTP"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors            = { "Ian Baird, modified by Paulius Vindzigelskis" => ""}
  # s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/PauliusVindzigelskis/SKPSMTP.git", :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'

  s.source_files  = "SMTPLibrary", "SMTPLibrary/**/*.{h,m}"
  s.public_header_files = "SMTPLibrary/**/*.h"

  s.requires_arc = true

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.


  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
