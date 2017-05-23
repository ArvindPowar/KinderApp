//
//  CreateAccountViewController.m
//  School
//
//  Created by Infinitum on 16/05/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import "CreateAccountViewController.h"
#import "UIColor+Expanded.h"
#import "SelectRoleViewController.h"
#import "ViewController.h"
@interface CreateAccountViewController ()

@end

@implementation CreateAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UIColor *darkOp = [UIColor colorWithHexString:@"#340DC4"];  //03687f  3884ea  2a7ae5
    UIColor *lightOp = [UIColor colorWithHexString:@"#8E44AD"]; //05819d 2096d3   70c7f4
    CAGradientLayer *gradient = [CAGradientLayer layer];
    // Set colors
    gradient.colors = [NSArray arrayWithObjects:
                       (id)darkOp.CGColor,
                       (id)lightOp.CGColor,
                       nil];
    gradient.frame = screenRect;
    [self.view.layer insertSublayer:gradient atIndex:0];
    UIFont *customFontdregs = [UIFont fontWithName:@"OpenSans-Bold" size:screenRect.size.width*0.035];
    
    UIButton*crateBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.10,screenRect.size.height*0.70,screenRect.size.width*0.805,screenRect.size.height*0.07)];
    crateBtn.layer.cornerRadius = 20.0f;
    [crateBtn setTitle:@"Create Account" forState:UIControlStateNormal];
    [crateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [crateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    crateBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [crateBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    [crateBtn.titleLabel setFont:customFontdregs];
    [crateBtn addTarget:self action:@selector(CreateAccountAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:crateBtn];

    UIButton*logintBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.10,screenRect.size.height*0.80,screenRect.size.width*0.805,screenRect.size.height*0.07)];
    logintBtn.layer.cornerRadius = 20.0f;
    [logintBtn setTitle:@"Sign in" forState:UIControlStateNormal];
    [logintBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logintBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    logintBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [logintBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    [logintBtn.titleLabel setFont:customFontdregs];
    [logintBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logintBtn];
    
    UIButton *forgotBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.15,screenRect.size.height*0.90,screenRect.size.width*0.70,screenRect.size.height*0.06)];
    forgotBtn.layer.cornerRadius = 2.0f;
    [forgotBtn setTitle:@"Lorem ipsum dolor sit amet" forState:UIControlStateNormal];
    [forgotBtn setBackgroundColor:[UIColor clearColor]];
    [forgotBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forgotBtn.titleLabel setFont:[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*0.035]];
    //    [forgotBtn addTarget:self action:@selector(ForgotAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgotBtn];
}
-(void)CreateAccountAction{
    SelectRoleViewController *rolevc=[[SelectRoleViewController alloc] initWithNibName:@"SelectRoleViewController" bundle:nil];
    [self.navigationController pushViewController:rolevc animated:YES];

}
-(void)loginAction{
    ViewController *rolevc=[[ViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:rolevc animated:YES];
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
