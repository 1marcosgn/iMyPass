//
//  PrincipalViewController.m
//  iMyPass
//
//  Created by Claudia Oliva on 19/06/12.
//  Copyright (c) 2012 ASTA. All rights reserved.
//

#import "PrincipalViewController.h"

@interface PrincipalViewController ()

@end

@implementation PrincipalViewController

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
    UIImage *selectedImage0 = [UIImage imageNamed:@"engineActivo.png"];
    UIImage *unselectedImage0 = [UIImage imageNamed:@"enginePasivo.png"];
    
    UIImage *selectedImage1 = [UIImage imageNamed:@"tweetActivo.png"];
    UIImage *unselectedImage1 = [UIImage imageNamed:@"tweetPasivo.png"];
    
    UIImage *selectedImage2 = [UIImage imageNamed:@"contactActivo.png"];
    UIImage *unselectedImage2 = [UIImage imageNamed:@"contactPasivo.png"];
    
    UIImage *selectedImage3 = [UIImage imageNamed:@"infoActivo.png"];
    UIImage *unselectedImage3 = [UIImage imageNamed:@"infoPasivo.png"];
    
    
    UITabBar *tabBar = self.tabBarController.tabBar;
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
    UITabBarItem *item3 = [tabBar.items objectAtIndex:3];
    
    [item0 setFinishedSelectedImage:selectedImage0 withFinishedUnselectedImage:unselectedImage0];
    [item1 setFinishedSelectedImage:selectedImage1 withFinishedUnselectedImage:unselectedImage1];
    [item2 setFinishedSelectedImage:selectedImage2 withFinishedUnselectedImage:unselectedImage2];
    [item3 setFinishedSelectedImage:selectedImage3 withFinishedUnselectedImage:unselectedImage3];
    
    
    [super viewDidLoad];
    
	[scrollPrincipal setScrollEnabled:YES];
    [scrollPrincipal setContentSize:CGSizeMake(50, 790)];
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





@end
