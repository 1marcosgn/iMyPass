//
//  CreatePassViewController.h
//  iMyPass
//
//  Created by Claudia Oliva on 19/06/12.
//  Copyright (c) 2012 ASTA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUi.h>
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

@interface CreatePassViewController : UIViewController <UIPopoverControllerDelegate, MFMailComposeViewControllerDelegate>{
    
    IBOutlet UILabel *labelPass;
    
    IBOutlet UITextField *textfirstName;
    IBOutlet UITextField *textLastName;
    IBOutlet UITextField *textDay;
    
    UIPopoverController *popoverController;
    
    BOOL newMedia;
    
    IBOutlet UILabel *labelMensaje01;
    IBOutlet UILabel *labelMensaje02;
    IBOutlet UILabel *labelMensaje03;
    IBOutlet UILabel *labelMensaje04;
    IBOutlet UILabel *labelMensaje05;
    
    
    IBOutlet UIScrollView *scroll01;
    
    IBOutlet UILabel *labelPrevio;
    
}

@property (nonatomic, retain) UIPopoverController *popoverController;

-(IBAction)CreatePass:(id)sender;

-(IBAction)Oculta:(id)sender;

-(IBAction)Send:(id)sender;


- (void)showTweetSheet:(NSString *)tweet;

-(IBAction)Tw04:(id)sender;

-(IBAction)Tw05:(id)sender;

@end
