//
//  ViewController.m
//  School
//
//  Created by Infinitum on 26/04/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "MainViewController.h"
#import "UIColor+Expanded.h"
#import "CreateAccountViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize usernameTxt,passwordTxt,logintBtn,forgotBtn,activityIndicator;
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

    UIButton *signcontinueBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.15,screenRect.size.height*0.40,screenRect.size.width*0.70,screenRect.size.height*0.06)];
    [signcontinueBtn setTitle:@"Sign in to Continue" forState:UIControlStateNormal];
    [signcontinueBtn setBackgroundColor:[UIColor clearColor]];
    [signcontinueBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signcontinueBtn.titleLabel setFont:[UIFont fontWithName:@"OpenSans-Bold" size:screenRect.size.width*0.035]];
    //    [signcontinueBtn addTarget:self action:@selector(ForgotAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signcontinueBtn];

    UIFont * font1 =[UIFont fontWithName:@"Open Sans" size:16.0f];
    //username textfield
    usernameTxt = [[RPFloatingPlaceholderTextField alloc] initWithFrame:CGRectMake(screenRect.size.width*0.10,screenRect.size.height*0.50,screenRect.size.width*0.80,screenRect.size.height*0.07)];
    usernameTxt.floatingLabelActiveTextColor = [UIColor whiteColor];
    usernameTxt.floatingLabelInactiveTextColor = [UIColor whiteColor];
    usernameTxt.font=font1;
    usernameTxt.textAlignment=NSTextAlignmentLeft;
    usernameTxt.delegate = self;
    usernameTxt.textColor=[UIColor whiteColor];
    [usernameTxt setBackgroundColor:[UIColor clearColor]];
    //    [flTextField setBackground:[UIImage imageNamed:@"text_box.png"]];
//    [usernameTxt.layer setCornerRadius:15.0f];
//    [usernameTxt.layer setMasksToBounds:YES];
    usernameTxt.tag=1;
    usernameTxt.placeholder=@"Email";
    CALayer *bottomBorders = [CALayer layer];
    bottomBorders.frame = CGRectMake(0.0f, usernameTxt.frame.size.height - 1, usernameTxt.frame.size.width, 1.0f);
    bottomBorders.backgroundColor = [UIColor lightGrayColor].CGColor;
    [usernameTxt.layer addSublayer:bottomBorders];
    [usernameTxt setKeyboardType:UIKeyboardTypeEmailAddress];
    [self.view addSubview:usernameTxt];

    //password text field
    passwordTxt = [[RPFloatingPlaceholderTextField alloc] initWithFrame:CGRectMake(screenRect.size.width*0.10,screenRect.size.height*0.60,screenRect.size.width*0.80,screenRect.size.height*0.07)];
    passwordTxt.floatingLabelActiveTextColor = [UIColor whiteColor];
    passwordTxt.floatingLabelInactiveTextColor = [UIColor whiteColor];
    passwordTxt.font=font1;
    passwordTxt.textAlignment=NSTextAlignmentLeft;
    passwordTxt.delegate = self;                
    passwordTxt.secureTextEntry = YES;
    passwordTxt.textColor=[UIColor whiteColor];
    [passwordTxt setBackgroundColor:[UIColor clearColor]];
    //    [flTextField setBackground:[UIImage imageNamed:@"text_box.png"]];
    [passwordTxt.layer setCornerRadius:15.0f];
    [passwordTxt.layer setMasksToBounds:YES];
    passwordTxt.tag=2;
    passwordTxt.placeholder=@"Password";
    CALayer *bottomBorders1 = [CALayer layer];
    bottomBorders1.frame = CGRectMake(0.0f, passwordTxt.frame.size.height - 1, passwordTxt.frame.size.width, 1.0f);
    bottomBorders1.backgroundColor = [UIColor lightGrayColor].CGColor;
    [passwordTxt.layer addSublayer:bottomBorders1];
    [self.view addSubview:passwordTxt];

    UIFont *customFontdregs = [UIFont fontWithName:@"OpenSans-Bold" size:screenRect.size.width*0.035];
    logintBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.10,screenRect.size.height*0.80,screenRect.size.width*0.805,screenRect.size.height*0.07)];
    logintBtn.layer.cornerRadius = 20.0f;
    [logintBtn setTitle:@"LOGIN" forState:UIControlStateNormal];
    [logintBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logintBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    logintBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [logintBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    [logintBtn.titleLabel setFont:customFontdregs];
    [logintBtn addTarget:self action:@selector(LoginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logintBtn];

    forgotBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.25,screenRect.size.height*0.90,screenRect.size.width*0.50,screenRect.size.height*0.06)];
    forgotBtn.layer.cornerRadius = 2.0f;
    [forgotBtn setTitle:@"Forgot Password?" forState:UIControlStateNormal];
    [forgotBtn setBackgroundColor:[UIColor clearColor]];
    [forgotBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forgotBtn.titleLabel setFont:[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*0.035]];
//    [forgotBtn addTarget:self action:@selector(ForgotAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgotBtn];

    usernameTxt.text=@"sudam1@gmail.com";
    passwordTxt.text=@"sudam@123";

}
-(IBAction)CancelAction:(id)sender{
    CreateAccountViewController *rolevc=[[CreateAccountViewController alloc] initWithNibName:@"CreateAccountViewController" bundle:nil];
    [self.navigationController pushViewController:rolevc animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void) threadStartAnimating:(id)data {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    [activityIndicator removeFromSuperview];
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.center = CGPointMake(screenRect.size.width / 2.0, screenRect.size.height / 2.0);
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
}

-(void)LoginAction{
    if ([usernameTxt.text isEqualToString:@""] && [passwordTxt.text isEqualToString:@""]) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Username & Password can't be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([usernameTxt.text isEqualToString:@""]){
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Username can't be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else if([passwordTxt.text isEqualToString:@""]){
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Password can't be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        BOOL stricterFilter = NO;
        NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
        NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
        NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        BOOL valid= [emailTest evaluateWithObject:[NSString stringWithFormat:@"%@",usernameTxt.text]];
        if (valid==YES) {
            [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
            NSURL *url;
            NSMutableString *httpBodyString;
            NSString *urlString;
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
                
            httpBodyString=[[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"uname=%@&pass=%@",usernameTxt.text,passwordTxt.text]];
            urlString = [[NSString alloc]initWithFormat:@"%@login",[prefs objectForKey:@"Link"]];
            url=[[NSURL alloc] initWithString:urlString];
            NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
                
            [urlRequest setHTTPMethod:@"POST"];
            [urlRequest setHTTPBody:[httpBodyString dataUsingEncoding:NSISOLatin1StringEncoding]];
                
            [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            if (error)
            {
            [activityIndicator stopAnimating];
            NSLog(@"Failed to submit request");
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Please try some time" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
                    }
                    else
                    {
            NSString *content = [[NSString alloc]  initWithBytes:[data bytes]
                                                                      length:[data length] encoding: NSUTF8StringEncoding];
            NSError *error;
            if ([content isEqualToString:@""]) {
            [activityIndicator stopAnimating];
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Invalid user name or password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            }else {
            NSDictionary *userDict=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSString *result = [[NSString alloc]init];
            result =[userDict objectForKey:@"status"];
            NSString *message = [[NSString alloc]init];
            message = [userDict objectForKey:@"msg"];
            int boolValue =[result intValue];
            if (boolValue==0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            }
            else if (boolValue==1){
            NSDictionary *activityData=[userDict objectForKey:@"data"];
            NSString *userid=[[NSString alloc]init];
            NSString *email=[[NSString alloc]init];
            NSString *name=[[NSString alloc]init];
            NSString *phone=[[NSString alloc]init];
            NSString * roleid=[[NSString alloc]init];
                                
            if ([activityData objectForKey:@"id"] != [NSNull null])
            userid=[activityData objectForKey:@"id"];
                                
            if ([activityData objectForKey:@"email"] != [NSNull null])
            email=[activityData objectForKey:@"email"];
                                
            if ([activityData objectForKey:@"name"] != [NSNull null])
            name=[activityData objectForKey:@"name"];
                                
            if ([activityData objectForKey:@"phone"] != [NSNull null])
            phone=[activityData objectForKey:@"phone"];
                                
            if ([activityData objectForKey:@"role_id"] != [NSNull null])
            roleid=[activityData objectForKey:@"role_id"];
                                
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setObject:userid forKey:@"userid"];
            [prefs setObject:email forKey:@"email"];
            [prefs setObject:name forKey:@"name"];
            [prefs setObject:phone forKey:@"phone"];
            [prefs setObject:roleid forKey:@"roleid"];
            [prefs synchronize];
                
                AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
                appDelegate.userRole=[[NSString alloc]init];

                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];

                if ([roleid isEqualToString:@"3"]) {
                    appDelegate.userRole=@"Teacher";
                }else if ([roleid isEqualToString:@"4"]){
                    appDelegate.userRole=@"Parent";
                            }
                        }
                    }
            [activityIndicator stopAnimating];
                }
            }];
            [activityIndicator stopAnimating];
        }
        else{
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Email invalid" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"OK"]){
        MainViewController *mainvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
        appDelegate.index=0;
        [self.navigationController pushViewController:mainvc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
