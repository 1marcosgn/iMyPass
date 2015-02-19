//
//  CreatePassViewController.m
//  iMyPass
//
//  Created by Claudia Oliva on 19/06/12.
//  Copyright (c) 2012 ASTA. All rights reserved.
//

#import "CreatePassViewController.h"
#include <stdlib.h>

@interface CreatePassViewController ()

@end

@implementation CreatePassViewController
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

    [scroll01 setScrollEnabled:YES];
    [scroll01 setContentSize:CGSizeMake(50, 895)];
    
    
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


-(IBAction)CreatePass:(id)sender{
    
    if ([textDay.text isEqualToString:@""] || [textfirstName.text isEqualToString:@""] || [textLastName.text isEqualToString:@""]) {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"iMyPass" message:@"Woops!! you must to enter the all the info" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [alert show];
        
        labelPrevio.alpha = 0.0;
        
    }
    else {
        
        [UILabel animateWithDuration:0.3 animations:^(){ labelPrevio.alpha = 1.0;}];
    
    NSString *nombre;
    NSString *apellido;
    
    //First Part
    nombre = [textfirstName.text substringWithRange:NSMakeRange(0, 1)];
    apellido = [textLastName.text substringWithRange:NSMakeRange(0, 1)];
    
    nombre = [nombre uppercaseString];
    apellido = [apellido uppercaseString];
    
    NSString *primero = [NSString stringWithFormat:@"%@%@", nombre, apellido];
    

    //Second Part
    int conteo = [textLastName.text length];
    
    NSString *cantidad = [NSString stringWithFormat:@"0%d",conteo];
    
    
    //Third Part
    NSArray *array = [NSArray arrayWithObjects:@"%", @"#", @"$",@"<", @"@", nil];
    
    int randomNumber = arc4random()%5;
    
    NSString *simbolo = @"";
    
    simbolo = [array objectAtIndex:randomNumber];
    
    
    
    
    //Fourth
    NSArray *arrayletras = [NSArray arrayWithObjects:@"a", @"e", @"i", @"o", @"u", nil];
    
    int rand2 = arc4random()%5;
    int rand3 = arc4random()%5;
    
    NSString *letras = [NSString stringWithFormat:@"%@%@", [arrayletras objectAtIndex:rand2], [arrayletras objectAtIndex:rand3]];
    
    
    //Five step
    NSString *mes = textDay.text;
    
    //Final Pass
    NSString *password = [NSString stringWithFormat:@"%@%@%@%@%@",primero,cantidad,simbolo,letras,mes];
    
    labelPass.text = password;
        
    }
    
    
}


-(IBAction)Oculta:(id)sender{
    
    
}


-(IBAction)Send:(id)sender{
    
    
    [self EnviarMail];
    
}


-(void)EnviarMail{
    
    [self mailIt];
    
}

#pragma eMail - Envio de Correo

-(void)mailIt {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
        
        picker.mailComposeDelegate = self;
        [picker setSubject:@"iMyPass"];
        
        NSArray *aReceptores=[NSArray arrayWithObjects:@"", nil];
        [picker setToRecipients:aReceptores];
        
        
        UIImage *roboPic = [UIImage imageNamed:@"makepass"];
        NSData *imageData = UIImageJPEGRepresentation(roboPic, 1);
        [picker addAttachmentData:imageData mimeType:@"image/png" fileName:@"makepass"];
        
        
        NSString *mensaje = labelPass.text;
        
        //    NSString *mensaje = [NSString stringWithFormat:@"#VisitaDurango %@", msj];
        
        NSString *msj = [NSString stringWithFormat:@"This is your pass %@", mensaje];
        
        NSString *emailBody = msj;
        [picker setMessageBody:emailBody isHTML:YES];
        
        [self presentModalViewController:picker animated:YES];
        
    }
    else {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"iMyPass" message:@"Debes configurar una cuenta de correo en tu dispositivo para poder enviar mensajes" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [alert show];
    }
    
    
}


-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    
    [self dismissModalViewControllerAnimated:YES];
}

bool band1,band2,band3 = false;


-(IBAction)Tw01:(id)sender{
    
    [self showTweetSheet:@"primera"];
    
}


-(IBAction)Tw02:(id)sender{
    
    [self showTweetSheet:@"segunda"];
    
}


-(IBAction)Tw03:(id)sender{
    
    [self showTweetSheet:@"tercera"];
    
}


-(IBAction)Tw04:(id)sender{
    
    [self showTweetSheet:@"cuarta"];
    
}

-(IBAction)Tw05:(id)sender{
    
    [self showTweetSheet:@"quinta"];
    
}

- (void)showTweetSheet:(NSString *)tweet{
    
    NSString *msj = @"";
    
    //  Create an instance of the Tweet Sheet
    TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
    
    // Sets the completion handler.  Note that we don't know which thread the
    // block will be called on, so we need to ensure that any UI updates occur
    // on the main queue
    tweetSheet.completionHandler = ^(TWTweetComposeViewControllerResult result) {
        switch(result) {
            case TWTweetComposeViewControllerResultCancelled:
                //  This means the user cancelled without sending the Tweet
                break;
            case TWTweetComposeViewControllerResultDone:
                //  This means the user hit 'Send'
                break;
        }
        
        
        //  dismiss the Tweet Sheet 
        dispatch_async(dispatch_get_main_queue(), ^{            
            [self dismissViewControllerAnimated:YES completion:^{
                NSLog(@"Tweet Sheet has been dismissed."); 
            }];
        });
    };
    
    if ([tweet isEqualToString:@"primera"]) {
        
        msj = labelMensaje01.text;
        
    }
    if ([tweet isEqualToString:@"segunda"]) {
        
        msj = labelMensaje02.text;
        
    }
    if ([tweet isEqualToString:@"tercera"]) {
        
        msj = labelMensaje03.text;
        
    }
    if ([tweet isEqualToString:@"cuarta"]) {
        
        msj = labelMensaje04.text;
        
    }
    if ([tweet isEqualToString:@"quinta"]) {
        
        msj = labelMensaje05.text;
        
    }
    
    
    NSString *mensaje = [NSString stringWithFormat:@"#iMyPass %@", msj];
    
    //  Set the initial body of the Tweet2
    [tweetSheet setInitialText:mensaje]; 
    
    //  Adds an image to the Tweet
    //  For demo purposes, assume we have an image named 'larry.png'
    //  that we wish to attach
    
//    if (![tweetSheet addImage:imagenView.image]) 
//    {
//        //if (![tweetSheet addImage:[UIImage imageNamed:@"cab.png"]]) {
//        NSLog(@"Unable to add the image!");
//    }
    
    //  Add an URL to the Tweet.  You can add multiple URLs.
    /* if (![tweetSheet addURL:[NSURL URLWithString:@"http://twitter.com/"]]){
     NSLog(@"Unable to add the URL!");
     }*/
    
    //  Presents the Tweet Sheet to the user
    [self presentViewController:tweetSheet animated:YES completion:^{
        NSLog(@"Tweet sheet has been presented.");
    }];
    
    
}

@end
