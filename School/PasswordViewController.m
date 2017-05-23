//
//  PasswordViewController.m
//  School
//
//  Created by Infinitum on 16/05/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import "PasswordViewController.h"
#import "UIColor+Expanded.h"
#import "ViewController.h"
#import "SelectRoleViewController.h"
#import "AppDelegate.h"
#define MAX_LENGTHUSA 10

@interface PasswordViewController ()

@end

@implementation PasswordViewController
@synthesize emailTxt,passwordTxt,startedBtn,forgotBtn,firstnameTxt,lastnameTxt,mobileNoTxt,choosepassTxt,countInx,numberToolbar,views,view1,view2,activityIndicator;

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
    [signcontinueBtn setTitle:@"Lets get started!" forState:UIControlStateNormal];
    [signcontinueBtn setBackgroundColor:[UIColor clearColor]];
    [signcontinueBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signcontinueBtn.titleLabel setFont:[UIFont fontWithName:@"OpenSans-Bold" size:screenRect.size.width*0.035]];
    //    [signcontinueBtn addTarget:self action:@selector(ForgotAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signcontinueBtn];
    
    UIFont * font1 =[UIFont fontWithName:@"Open Sans" size:16.0f];
    //username textfield
    
    views= [[UIView alloc] initWithFrame:CGRectMake(0,screenRect.size.height*0.50,screenRect.size.width,screenRect.size.height*0.20)];
    [views setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:views];

    firstnameTxt = [[RPFloatingPlaceholderTextField alloc] initWithFrame:CGRectMake(screenRect.size.width*0.10,0,screenRect.size.width*0.80,screenRect.size.height*0.07)];
    firstnameTxt.floatingLabelActiveTextColor = [UIColor whiteColor];
    firstnameTxt.floatingLabelInactiveTextColor = [UIColor whiteColor];
    firstnameTxt.font=font1;
    firstnameTxt.textAlignment=NSTextAlignmentLeft;
    firstnameTxt.delegate = self;
    firstnameTxt.textColor=[UIColor whiteColor];
    [firstnameTxt setBackgroundColor:[UIColor clearColor]];
    //    [flTextField setBackground:[UIImage imageNamed:@"text_box.png"]];
    //    [usernameTxt.layer setCornerRadius:15.0f];
    //    [usernameTxt.layer setMasksToBounds:YES];
    firstnameTxt.tag=1;
    firstnameTxt.placeholder=@"First Name";
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, firstnameTxt.frame.size.height - 1, firstnameTxt.frame.size.width, 1.0f);
    bottomBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
    [firstnameTxt.layer addSublayer:bottomBorder];
    [views addSubview:firstnameTxt];

    lastnameTxt = [[RPFloatingPlaceholderTextField alloc] initWithFrame:CGRectMake(screenRect.size.width*0.10,screenRect.size.height*0.10,screenRect.size.width*0.80,screenRect.size.height*0.07)];
    lastnameTxt.floatingLabelActiveTextColor = [UIColor whiteColor];
    lastnameTxt.floatingLabelInactiveTextColor = [UIColor whiteColor];
    lastnameTxt.font=font1;
    lastnameTxt.textAlignment=NSTextAlignmentLeft;
    lastnameTxt.delegate = self;
    lastnameTxt.textColor=[UIColor whiteColor];
    [lastnameTxt setBackgroundColor:[UIColor clearColor]];
    //    [flTextField setBackground:[UIImage imageNamed:@"text_box.png"]];
    //    [usernameTxt.layer setCornerRadius:15.0f];
    //    [usernameTxt.layer setMasksToBounds:YES];
    lastnameTxt.tag=2;
    lastnameTxt.placeholder=@"Last Name";
    CALayer *bottomBorder1 = [CALayer layer];
    bottomBorder1.frame = CGRectMake(0.0f, lastnameTxt.frame.size.height - 1, lastnameTxt.frame.size.width, 1.0f);
    bottomBorder1.backgroundColor = [UIColor lightGrayColor].CGColor;
    [lastnameTxt.layer addSublayer:bottomBorder1];
    [views addSubview:lastnameTxt];

    view1= [[UIView alloc] initWithFrame:CGRectMake(0,screenRect.size.height*0.50,screenRect.size.width,screenRect.size.height*0.20)];
    [view1 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:view1];

    emailTxt = [[RPFloatingPlaceholderTextField alloc] initWithFrame:CGRectMake(screenRect.size.width*0.10,0,screenRect.size.width*0.80,screenRect.size.height*0.07)];
    emailTxt.floatingLabelActiveTextColor = [UIColor whiteColor];
    emailTxt.floatingLabelInactiveTextColor = [UIColor whiteColor];
    emailTxt.font=font1;
    emailTxt.textAlignment=NSTextAlignmentLeft;
    emailTxt.delegate = self;
    emailTxt.textColor=[UIColor whiteColor];
    [emailTxt setBackgroundColor:[UIColor clearColor]];
    //    [flTextField setBackground:[UIImage imageNamed:@"text_box.png"]];
    //    [usernameTxt.layer setCornerRadius:15.0f];
    //    [usernameTxt.layer setMasksToBounds:YES];
    emailTxt.tag=1;
    emailTxt.placeholder=@"Email";
    CALayer *bottomBorder2 = [CALayer layer];
    bottomBorder2.frame = CGRectMake(0.0f, emailTxt.frame.size.height - 1, emailTxt.frame.size.width, 1.0f);
    bottomBorder2.backgroundColor = [UIColor lightGrayColor].CGColor;
    [emailTxt.layer addSublayer:bottomBorder2];
    [emailTxt setKeyboardType:UIKeyboardTypeEmailAddress];
    [view1 addSubview:emailTxt];
    
    mobileNoTxt = [[RPFloatingPlaceholderTextField alloc] initWithFrame:CGRectMake(screenRect.size.width*0.10,screenRect.size.height*0.10,screenRect.size.width*0.80,screenRect.size.height*0.07)];
    mobileNoTxt.floatingLabelActiveTextColor = [UIColor whiteColor];
    mobileNoTxt.floatingLabelInactiveTextColor = [UIColor whiteColor];
    mobileNoTxt.font=font1;
    mobileNoTxt.textAlignment=NSTextAlignmentLeft;
    mobileNoTxt.delegate = self;
    mobileNoTxt.textColor=[UIColor whiteColor];
    [mobileNoTxt setBackgroundColor:[UIColor clearColor]];
    //    [flTextField setBackground:[UIImage imageNamed:@"text_box.png"]];
    //    [usernameTxt.layer setCornerRadius:15.0f];
    //    [usernameTxt.layer setMasksToBounds:YES];
    mobileNoTxt.tag=4;
    mobileNoTxt.placeholder=@"Mobile Number";
    CALayer *bottomBorder3 = [CALayer layer];
    bottomBorder3.frame = CGRectMake(0.0f, mobileNoTxt.frame.size.height - 1, mobileNoTxt.frame.size.width, 1.0f);
    bottomBorder3.backgroundColor = [UIColor lightGrayColor].CGColor;
    [mobileNoTxt.layer addSublayer:bottomBorder3];
    [mobileNoTxt setKeyboardType:UIKeyboardTypeDecimalPad];
    numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackOpaque;
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(doneWithNumberPad)],
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    numberToolbar.tintColor=[UIColor whiteColor];
    mobileNoTxt.inputAccessoryView = numberToolbar;
    mobileNoTxt.returnKeyType=UIReturnKeyNext;
    [view1 addSubview:mobileNoTxt];

    view2= [[UIView alloc] initWithFrame:CGRectMake(0,screenRect.size.height*0.50,screenRect.size.width,screenRect.size.height*0.20)];
    [view2 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:view2];

    choosepassTxt = [[RPFloatingPlaceholderTextField alloc] initWithFrame:CGRectMake(screenRect.size.width*0.10,0,screenRect.size.width*0.80,screenRect.size.height*0.07)];
    choosepassTxt.floatingLabelActiveTextColor = [UIColor whiteColor];
    choosepassTxt.floatingLabelInactiveTextColor = [UIColor whiteColor];
    choosepassTxt.font=font1;
    choosepassTxt.textAlignment=NSTextAlignmentLeft;
    choosepassTxt.delegate = self;
    choosepassTxt.secureTextEntry = YES;
    choosepassTxt.textColor=[UIColor whiteColor];
    [choosepassTxt setBackgroundColor:[UIColor clearColor]];
    //    [flTextField setBackground:[UIImage imageNamed:@"text_box.png"]];
    //    [usernameTxt.layer setCornerRadius:15.0f];
    //    [usernameTxt.layer setMasksToBounds:YES];
    choosepassTxt.tag=1;
    choosepassTxt.placeholder=@"Choose Password";
    CALayer *bottomBorder4 = [CALayer layer];
    bottomBorder4.frame = CGRectMake(0.0f, choosepassTxt.frame.size.height - 1, choosepassTxt.frame.size.width, 1.0f);
    bottomBorder4.backgroundColor = [UIColor lightGrayColor].CGColor;
    [choosepassTxt.layer addSublayer:bottomBorder4];
    [view2 addSubview:choosepassTxt];

    //password text field
    passwordTxt = [[RPFloatingPlaceholderTextField alloc] initWithFrame:CGRectMake(screenRect.size.width*0.10,screenRect.size.height*0.10,screenRect.size.width*0.80,screenRect.size.height*0.07)];
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
    passwordTxt.placeholder=@"Confirm Password";
    CALayer *bottomBorders1 = [CALayer layer];
    bottomBorders1.frame = CGRectMake(0.0f, passwordTxt.frame.size.height - 1, passwordTxt.frame.size.width, 1.0f);
    bottomBorders1.backgroundColor = [UIColor lightGrayColor].CGColor;
    [passwordTxt.layer addSublayer:bottomBorders1];
    [view2 addSubview:passwordTxt];
    
    UIFont *customFontdregs = [UIFont fontWithName:@"OpenSans-Bold" size:screenRect.size.width*0.035];
    startedBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.10,screenRect.size.height*0.80,screenRect.size.width*0.805,screenRect.size.height*0.07)];
    startedBtn.layer.cornerRadius = 20.0f;
    [startedBtn setTitle:@"Get Started!" forState:UIControlStateNormal];
    [startedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    startedBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [startedBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    [startedBtn.titleLabel setFont:customFontdregs];
    [startedBtn addTarget:self action:@selector(getStartedAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startedBtn];
    
    forgotBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.10,screenRect.size.height*0.90,screenRect.size.width*0.80,screenRect.size.height*0.06)];
    forgotBtn.layer.cornerRadius = 2.0f;
    [forgotBtn setTitle:@"By creating an account, I agree to the terms of services." forState:UIControlStateNormal];
    [forgotBtn setBackgroundColor:[UIColor clearColor]];
    [forgotBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forgotBtn.titleLabel setFont:[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*0.03]];
    //    [forgotBtn addTarget:self action:@selector(ForgotAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgotBtn];
 
    countInx=1;
    view1.hidden=YES;
    view2.hidden=YES;
}
-(void)doneWithNumberPad{
    [mobileNoTxt resignFirstResponder];
}

-(IBAction)CancelAction:(id)sender{
    if (countInx==1) {
        SelectRoleViewController *rolevc=[[SelectRoleViewController alloc] initWithNibName:@"SelectRoleViewController" bundle:nil];
        [self.navigationController pushViewController:rolevc animated:YES];
    }else if (countInx==2) {
        views.hidden=NO;
        view1.hidden=YES;
        view2.hidden=YES;

    }else if (countInx==3) {
        views.hidden=YES;
        view1.hidden=NO;
        view2.hidden=YES;
    }
    countInx--;
}

-(void)getStartedAction{
    if (countInx==1) {
        if ([firstnameTxt.text isEqualToString:@""] && [lastnameTxt.text isEqualToString:@""]) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"First & last name can't be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([firstnameTxt.text isEqualToString:@""]){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"First name can't be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else if([lastnameTxt.text isEqualToString:@""]){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Last name can't be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else{
        views.hidden=YES;
        view1.hidden=NO;
        view2.hidden=YES;
            countInx++;
        }
    }else if (countInx==2) {
        if ([emailTxt.text isEqualToString:@""] && [mobileNoTxt.text isEqualToString:@""]) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Email & Mobile number can't be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([emailTxt.text isEqualToString:@""]){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Email can't be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else if([mobileNoTxt.text isEqualToString:@""]){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Mobile number can't be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else{
            BOOL stricterFilter = NO;
            NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
            NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
            NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
            NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
            BOOL valid= [emailTest evaluateWithObject:[NSString stringWithFormat:@"%@",emailTxt.text]];
            if (valid==YES) {
                views.hidden=YES;
                view1.hidden=YES;
                view2.hidden=NO;
                countInx++;
            }else{
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Email invalid" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }else if (countInx==3){
        if ([choosepassTxt.text isEqualToString:@""] && [passwordTxt.text isEqualToString:@""]) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Choose & Confirm password can't be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([choosepassTxt.text isEqualToString:@""]){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Choose password can't be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else if([passwordTxt.text isEqualToString:@""]){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Confirm password can't be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        } else if(![self isValidPassword:choosepassTxt.text]) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Password must be minimum 8 characters, at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }else if([passwordTxt.text isEqualToString:choosepassTxt.text]){
            [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
            AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
            NSURL *url;
            NSMutableString *httpBodyString;
            NSString *urlString;
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            NSString *firstlastname=[NSString stringWithFormat:@"%@ %@",firstnameTxt.text,lastnameTxt.text];
            httpBodyString=[[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"namesurname=%@&email=%@&phone=%@&pass=%@&userType=%@",firstlastname,emailTxt.text,mobileNoTxt.text,passwordTxt.text,[appDelegate.userRole lowercaseString]]];
            urlString = [[NSString alloc]initWithFormat:@"%@register",[prefs objectForKey:@"Link"]];
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
                            
                            if ([message isEqualToString:@"Your email address already register"]) {
                                views.hidden=YES;
                                view1.hidden=NO;
                                view2.hidden=YES;
                                countInx--;
                            }
                        }
                        else if (boolValue==1){
                            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                            [alert show];
                        }
                    }
                    [activityIndicator stopAnimating];
                }
            }];
            [activityIndicator stopAnimating];
        }else{
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:@"Choose password & Confirm password not same" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"OK"]){
        ViewController *rolevc=[[ViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:rolevc animated:YES];
    }
}

- (void) threadStartAnimating:(id)data {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    [activityIndicator removeFromSuperview];
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.center = CGPointMake(screenRect.size.width / 2.0, screenRect.size.height / 2.0);
    [self.view addSubview: activityIndicator];
    [activityIndicator startAnimating];
}

-(BOOL)isValidPassword:(NSString *)passwordString
{
    NSString *stricterFilterString = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [passwordTest evaluateWithObject:passwordString];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField==mobileNoTxt){
        
        if (mobileNoTxt.text.length >= MAX_LENGTHUSA && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            return YES;
        }
    }
    return YES;
}
-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    int movementDistance=0;
    int tags=textField.tag;
    if (tags==4) {
        movementDistance = -65; // tweak as needed
    }
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    int tags=textField.tag;
    if (tags==4) {
        [self animateTextField:textField up:YES];
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    int tags=textField.tag;
    if (tags==4) {
        [self animateTextField:textField up:NO];
    }
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
