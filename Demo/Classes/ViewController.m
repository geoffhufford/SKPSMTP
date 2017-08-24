//
//  ViewController.m
//  SMTPSender
//
//  Created by Vindzigelskis, Paulius on 8/24/17.
//
//

#import "ViewController.h"
#import "Mailer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableDictionary *defaultsDictionary = [@{
                                                 @"fromEmail" : @"nquangphuong@gmail.com",
                                                 @"toEmail" : @"nquangphuong@gmail.com",
                                                 @"relayHost" :  @"smtp.gmail.com",
                                                 @"login" : @"nquangphuong@gmail.com",
                                                 @"pass" : @"yourpassword",
                                                 @"requiresAuth" : @YES,
                                                 @"wantsSecure" : @YES
                                                 } mutableCopy];
    
    [userDefaults registerDefaults:defaultsDictionary];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self updateTextView];
    Mailer *testMailer = [[Mailer alloc] init];
    [testMailer sendMail];
}

- (void)updateTextView {
    NSMutableString *logText = [[NSMutableString alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [logText appendString:@"Use the iOS Settings app to change the values below.\n\n"];
    [logText appendFormat:@"From: %@\n", [defaults objectForKey:@"fromEmail"]];
    [logText appendFormat:@"To: %@\n", [defaults objectForKey:@"toEmail"]];
    [logText appendFormat:@"Host: %@\n", [defaults objectForKey:@"relayHost"]];
    [logText appendFormat:@"Auth: %@\n", ([[defaults objectForKey:@"requiresAuth"] boolValue] ? @"On" : @"Off")];
    
    if ([[defaults objectForKey:@"requiresAuth"] boolValue]) {
        [logText appendFormat:@"Login: %@\n", [defaults objectForKey:@"login"]];
        [logText appendFormat:@"Password: %@\n", [defaults objectForKey:@"pass"]];
    }
    [logText appendFormat:@"Secure: %@\n", [[defaults objectForKey:@"wantsSecure"] boolValue] ? @"Yes" : @"No"];
    self.textView.text = logText;
    
}

- (IBAction)sendMessage:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    SKPSMTPMessage *testMsg = [[SKPSMTPMessage alloc] init];
    testMsg.fromEmail = [defaults objectForKey:@"fromEmail"];
    
    testMsg.toEmail = [defaults objectForKey:@"toEmail"];
    testMsg.bccEmail = [defaults objectForKey:@"bccEmal"];
    testMsg.relayHost = [defaults objectForKey:@"relayHost"];
    
    testMsg.requiresAuth = [[defaults objectForKey:@"requiresAuth"] boolValue];
    
    if (testMsg.requiresAuth) {
        testMsg.login = [defaults objectForKey:@"login"];
        
        testMsg.pass = [defaults objectForKey:@"pass"];
        
    }
    
    testMsg.wantsSecure = [[defaults objectForKey:@"wantsSecure"] boolValue]; // smtp.gmail.com doesn't work without TLS!
    
    
    testMsg.subject = @"SMTPMessage Test Message";
    //testMsg.bccEmail = @"testbcc@test.com";
    
    // Only do this for self-signed certs!
    // testMsg.validateSSLChain = NO;
    testMsg.delegate = self;
    
    NSDictionary *plainPart = @{
                                kSKPSMTPPartContentTypeKey : @"text/plain",
                                kSKPSMTPPartMessageKey : @"This is a tést messåge.",
                                kSKPSMTPPartContentTransferEncodingKey : @"8bit"
                                };
    
    NSString *vcfPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"vcf"];
    NSData *vcfData = [NSData dataWithContentsOfFile:vcfPath];
    
    NSDictionary *vcfPart = @{
                              kSKPSMTPPartContentTypeKey : @"text/directory;\r\n\tx-unix-mode=0644;\r\n\tname=\"test.vcf\"",
                              kSKPSMTPPartContentDispositionKey : @"attachment;\r\n\tfilename=\"test.vcf\"",
                              kSKPSMTPPartMessageKey : [vcfData base64EncodedStringWithOptions:0],
                              kSKPSMTPPartContentTransferEncodingKey : @"base64"
                              };
    
    testMsg.parts = @[plainPart,vcfPart];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [testMsg send];
    });
}
- (void)messageSent:(SKPSMTPMessage *)message
{
    self.textView.text  = @"Yay! Message was sent!";
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error
{
    self.textView.text = [NSString stringWithFormat:@"Darn! Error!\n%li: %@\n%@", (long)[error code], [error localizedDescription], [error localizedRecoverySuggestion]];
}

@end
