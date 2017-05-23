//
//  SelectRoleViewController.m
//  School
//
//  Created by Infinitum on 16/05/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import "SelectRoleViewController.h"
#import "UIColor+Expanded.h"
#import "PasswordViewController.h"
#import "CreateAccountViewController.h"
#import "AppDelegate.h"
@interface SelectRoleViewController ()

@end

@implementation SelectRoleViewController

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
    
    UIButton* leftbackBtn=[[UIButton alloc]initWithFrame:CGRectMake(13,25,screenRect.size.width*.13,screenRect.size.height*.035)];
    [leftbackBtn addTarget:self action:@selector(CancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftbackBtn setBackgroundImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];
    [self.view addSubview:leftbackBtn];

    UIFont *customFontdregs = [UIFont fontWithName:@"OpenSans-Bold" size:screenRect.size.width*0.035];
    
    UIFont * font1 =[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*0.055];
    UIFont * font2 =[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*0.035];

    NSString *msgStr=@"Welcome!\nWhich describes you?";
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:msgStr];
    [title addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0, 8)];
    [title addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(9, 20)];

    UILabel *signcontinueLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.15,screenRect.size.height*0.50,screenRect.size.width*0.70,screenRect.size.height*0.16)];
    signcontinueLbl.font=[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*.03];
    [signcontinueLbl setTextColor:[UIColor whiteColor]];
    signcontinueLbl.lineBreakMode = NSLineBreakByWordWrapping;
    signcontinueLbl.numberOfLines = 0;
    signcontinueLbl.textAlignment = NSTextAlignmentCenter;
    signcontinueLbl.attributedText=title;
    [self.view addSubview:signcontinueLbl];

    UIButton*crateBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.10,screenRect.size.height*0.70,screenRect.size.width*0.805,screenRect.size.height*0.07)];
    crateBtn.layer.cornerRadius = 20.0f;
    [crateBtn setTitle:@"Staff of Teacher" forState:UIControlStateNormal];
    [crateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [crateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    crateBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [crateBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    [crateBtn.titleLabel setFont:customFontdregs];
    crateBtn.tag=1;
    [crateBtn addTarget:self action:@selector(ChoosePasswordAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:crateBtn];
    
    UIButton*logintBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.10,screenRect.size.height*0.80,screenRect.size.width*0.805,screenRect.size.height*0.07)];
    logintBtn.layer.cornerRadius = 20.0f;
    [logintBtn setTitle:@"Parent" forState:UIControlStateNormal];
    [logintBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logintBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    logintBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [logintBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    [logintBtn.titleLabel setFont:customFontdregs];
    logintBtn.tag=2;
    [logintBtn addTarget:self action:@selector(ChoosePasswordAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logintBtn];
    
    UIButton *forgotBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.10,screenRect.size.height*0.90,screenRect.size.width*0.80,screenRect.size.height*0.06)];
    forgotBtn.layer.cornerRadius = 2.0f;
    [forgotBtn setTitle:@"By creating an account, I agree to the terms of services." forState:UIControlStateNormal];
    [forgotBtn setBackgroundColor:[UIColor clearColor]];
    [forgotBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forgotBtn.titleLabel setFont:[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*0.03]];
    //    [forgotBtn addTarget:self action:@selector(ForgotAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgotBtn];
}
-(IBAction)CancelAction:(id)sender{
    CreateAccountViewController *rolevc=[[CreateAccountViewController alloc] initWithNibName:@"CreateAccountViewController" bundle:nil];
    [self.navigationController pushViewController:rolevc animated:YES];
}

-(void)ChoosePasswordAction:(UIButton *)btn{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.userRole=[[NSString alloc]init];
    if (btn.tag==1) {
        appDelegate.userRole=@"Teacher";
    }else{
        appDelegate.userRole=@"Parent";
    }
    PasswordViewController *rolevc=[[PasswordViewController alloc] initWithNibName:@"PasswordViewController" bundle:nil];
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
