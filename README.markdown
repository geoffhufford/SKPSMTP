# About skpsmtpmessage

A quick SMTP client for iOS. Fork of [skpsmtpmessage](https://github.com/phuongnq/SKPSMTP), by Ian Baird.
- Updated files to ARC, added bridging where needed;
- Got rid of all compile warnings;
- Updated Base64 encoding/decoding to use Apple's new ones from NSData
- Updated demo project to be iOS 8 and up compatable

To use this in your app, add the files in the SMTPLibrary directory to your project.

The Demo folder contains an Xcode project which will build a sample iPhone app.

Note: If you choose to build these files as a static library, you must add the following flag to your app's link flags in order to link to the NSStream+SKPSMTPExtension category. You will get an runtime exception (selector not recognized) if you forget. 
   
   Your Target -> Get Info -> Build -> All Configurations -> Other Link Flags: "-ObjC"
   
   See: http://developer.apple.com/qa/qa2006/qa1490.html

- Steve Brokaw

### Available via [Cocoapods](http://cocoapods.org/)

You can add to your Podfile to integrate into your project. 

    pod 'SMTPLibrary'

You might need to add the CFNetwork.framework to your linked files. 


