//
//  ContactViewController.m
//  iMyPass
//
//  Created by Claudia Oliva on 19/06/12.
//  Copyright (c) 2012 ASTA. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController
@synthesize popoverController;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(IBAction)Send:(id)sender{
    
    [self mailIt];
    
}


#pragma eMail - Envio de Correo

-(void)mailIt {MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    
    if ([MFMailComposeViewController canSendMail]) {
        
        picker.mailComposeDelegate = self;
        [picker setSubject:@"iMyPass"];
        
        NSArray *aReceptores=[NSArray arrayWithObjects:@"", nil];
        [picker setToRecipients:aReceptores];
        
        
        UIImage *roboPic = [UIImage imageNamed:@"makepass"];
        NSData *imageData = UIImageJPEGRepresentation(roboPic, 1);
        [picker addAttachmentData:imageData mimeType:@"image/png" fileName:@"makepass"];
        
        
        NSString *mensaje = textMensaje.text;
        
        //    NSString *mensaje = [NSString stringWithFormat:@"#VisitaDurango %@", msj];
        
        NSString *msj = [NSString stringWithFormat:@"Im using #iMyPass %@", mensaje];
        
        NSString *emailBody = msj;
        [picker setMessageBody:emailBody isHTML:YES];
        
        [self presentModalViewController:picker animated:YES];
        
    }
    else {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"iMyPass" message:@"Debe configurar una cuenta de correo en su dispositivo para poder enviar el mensaje" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
}


-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    
    [self dismissModalViewControllerAnimated:YES];
}



-(IBAction)Resign:(id)sender{
    
    [textMensaje resignFirstResponder];
    
}

@end
