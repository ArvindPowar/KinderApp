//
//  MainViewController.m
//  CommunicationApp
//
//  Created by mansoor shaikh on 13/04/14.
//  Copyright (c) 2014 MobiWebCode. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "RearViewController.h"
#import "ViewController.h"
#import "MessageViewController.h"
#import "EventViewController.h"
#import "AttendanceViewController.h"
#import "ActivityViewController.h"
#import "HomeViewController.h"
@interface MainViewController ()<SWRevealViewControllerDelegate>

@end

@implementation MainViewController
@synthesize viewController = _viewController;
@synthesize appDelegate,index;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - SWRevealViewDelegate

#define LogDelegates 0
- (NSString*)stringFromFrontViewPosition:(FrontViewPosition)position
{
    NSString *str = nil;
    if ( position == FrontViewPositionLeftSideMostRemoved ) str = @"FrontViewPositionLeftSideMostRemoved";
    if ( position == FrontViewPositionLeftSideMost) str = @"FrontViewPositionLeftSideMost";
    if ( position == FrontViewPositionLeftSide) str = @"FrontViewPositionLeftSide";
    if ( position == FrontViewPositionLeft ) str = @"FrontViewPositionLeft";
    if ( position == FrontViewPositionRight ) str = @"FrontViewPositionRight";
    if ( position == FrontViewPositionRightMost ) str = @"FrontViewPositionRightMost";
    if ( position == FrontViewPositionRightMostRemoved ) str = @"FrontViewPositionRightMostRemoved";
    return str;
}

- (void)revealController:(SWRevealViewController *)revealController willMoveToPosition:(FrontViewPosition)position
{
    NSLog( @"%@: %@", NSStringFromSelector(_cmd), [self stringFromFrontViewPosition:position]);
}

- (void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position
{
    NSLog( @"%@: %@", NSStringFromSelector(_cmd), [self stringFromFrontViewPosition:position]);
}

- (void)revealController:(SWRevealViewController *)revealController animateToPosition:(FrontViewPosition)position
{
    NSLog( @"%@: %@", NSStringFromSelector(_cmd), [self stringFromFrontViewPosition:position]);
}

- (void)revealControllerPanGestureBegan:(SWRevealViewController *)revealController;
{
    NSLog( @"%@", NSStringFromSelector(_cmd) );
}

- (void)revealControllerPanGestureEnded:(SWRevealViewController *)revealController;
{
    NSLog( @"%@", NSStringFromSelector(_cmd) );
}

- (void)revealController:(SWRevealViewController *)revealController panGestureBeganFromLocation:(CGFloat)location progress:(CGFloat)progress
{
    NSLog( @"%@: %f, %f", NSStringFromSelector(_cmd), location, progress);
}

- (void)revealController:(SWRevealViewController *)revealController panGestureMovedToLocation:(CGFloat)location progress:(CGFloat)progress
{
    NSLog( @"%@: %f, %f", NSStringFromSelector(_cmd), location, progress);
}

- (void)revealController:(SWRevealViewController *)revealController panGestureEndedToLocation:(CGFloat)location progress:(CGFloat)progress
{
    NSLog( @"%@: %f, %f", NSStringFromSelector(_cmd), location, progress);
}

- (void)revealController:(SWRevealViewController *)revealController willAddViewController:(UIViewController *)viewController forOperation:(SWRevealControllerOperation)operation animated:(BOOL)animated
{
    NSLog( @"%@: %@, %d", NSStringFromSelector(_cmd), viewController, operation);
}

- (void)revealController:(SWRevealViewController *)revealController didAddViewController:(UIViewController *)viewController forOperation:(SWRevealControllerOperation)operation animated:(BOOL)animated
{
    NSLog( @"%@: %@, %d", NSStringFromSelector(_cmd), viewController, operation);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate=[[UIApplication sharedApplication] delegate];
    

    RearViewController *rearViewController = [[RearViewController alloc] init];
    UINavigationController *frontNavigationController;
    HomeViewController *home=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];

//    MyProfileViewController *pvc=[[MyProfileViewController alloc] initWithNibName:@"MyProfileViewController" bundle:nil];
    ViewController *login;
    login=[[ViewController alloc] initWithNibName:nil bundle:nil];

    if(appDelegate.index==0)
        frontNavigationController = [[UINavigationController alloc] initWithRootViewController:home];
    else if(appDelegate.index==1)
        frontNavigationController = [[UINavigationController alloc] initWithRootViewController:home];
    else if(appDelegate.index==2)
        frontNavigationController = [[UINavigationController alloc] initWithRootViewController:home];
    else if(appDelegate.index==3)
            frontNavigationController = [[UINavigationController alloc] initWithRootViewController:home];
    else if(appDelegate.index==4)
        frontNavigationController = [[UINavigationController alloc] initWithRootViewController:home];
     if(appDelegate.index==5){
        frontNavigationController = [[UINavigationController alloc] initWithRootViewController:login];
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs removeObjectForKey:@"loggedin"];
        [prefs synchronize];
        appDelegate.index=0;
    }
    UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:rearViewController];
    SWRevealViewController *revealController = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
    revealController.delegate = self;
    self.viewController = revealController;
    [[[UIApplication sharedApplication] delegate] window].rootViewController = self.viewController;

    
    

}
- (BOOL)shouldAutorotate
{
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
