//
//  ContactViewController.h
//  iMyPass
//
//  Created by Claudia Oliva on 19/06/12.
//  Copyright (c) 2012 ASTA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUi.h>

@interface ContactViewController : UIViewController <UIPopoverControllerDelegate, MFMailComposeViewControllerDelegate>{
    
    UIPopoverController *popoverController;
    
    BOOL newMedia;
    
    IBOutlet UITextView *textMensaje;
    
}

@property (nonatomic, retain) UIPopoverController *popoverController;

-(IBAction)Send:(id)sender;

-(IBAction)Resign:(id)sender;


@end
