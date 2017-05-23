//
//  AttendanceViewController.m
//  School
//
//  Created by Infinitum on 26/04/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import "AttendanceViewController.h"
#import "SWRevealViewController.h"
@interface AttendanceViewController ()

@end

@implementation AttendanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UILabel *titleregisterlable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.20,25,screenRect.size.width*.60,screenRect.size.height*.035)];
    titleregisterlable.textAlignment = NSTextAlignmentCenter;
    titleregisterlable.text=@"ATTENDANCE";
    [titleregisterlable setTextColor: [UIColor blueColor]];
    [titleregisterlable setBackgroundColor:[UIColor clearColor]];
    titleregisterlable.font=[UIFont fontWithName:@"Open Sans" size:16.0f];
    [self.view addSubview:titleregisterlable];

    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [leftBtn setFrame:CGRectMake(10, 15,40,40)];
    [leftBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"menubar.png"] forState:UIControlStateNormal];
    [leftBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:leftBtn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
