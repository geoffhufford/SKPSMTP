//
//  Mailer.h
//  SMTPSender
//
//  Created by PhuongNQ on 10/26/13.
//
//

#import <Foundation/Foundation.h>
#import <SMTPLibrary/SKPSMTPMessage.h>

@interface Mailer : NSObject <SKPSMTPMessageDelegate>
- (void) sendMail;
@end
