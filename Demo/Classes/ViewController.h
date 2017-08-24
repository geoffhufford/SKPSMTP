//
//  ViewController.h
//  SMTPSender
//
//  Created by Vindzigelskis, Paulius on 8/24/17.
//
//

#import <UIKit/UIKit.h>
#import "SKPSMTPMessage.h"

@interface ViewController : UIViewController <SKPSMTPMessageDelegate>

@property (nonatomic, retain) IBOutlet UITextView *textView;

- (IBAction)sendMessage:(id)sender;
- (void)updateTextView;

@end
