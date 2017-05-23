//
//  MessageViewController.m
//  School
//
//  Created by Infinitum on 26/04/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import "MessageViewController.h"
#import "SWRevealViewController.h"
#import "EventViewController.h"
#import "AttendanceViewController.h"
#import "ActivityViewController.h"
#import "AppDelegate.h"
#import "UIColor+Expanded.h"
#import "UIImage+FontAwesome.h"
#import "NSString+FontAwesome.h"

@interface MessageViewController ()

@end

@implementation MessageViewController
@synthesize appDelegate,chatTableView,msgListArray,msgText,sendBtn,attachmentBtn;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    appDelegate=[[UIApplication sharedApplication] delegate];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"f7f7f7"]];
    //bgimage
    UIImageView *bgImg=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,screenRect.size.width,screenRect.size.height)];
    [bgImg setImage:[UIImage imageNamed:@"bg_img.png"]];
    [self.view addSubview:bgImg];
    

    
    //circle logo
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setFrame:CGRectMake(0,25,screenRect.size.width, screenRect.size.height*0.04)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text=@"AMIT";
    [titleLabel setTextColor: [UIColor blackColor]];
    UIFont * font1s =[UIFont fontWithName:@"Open Sans" size:16.0f];
    titleLabel.font=font1s;
    [self.view addSubview:titleLabel];
    
    UIFont *customFontdregs = [UIFont fontWithName:@"MaterialIcons-Regular" size:25];
    UIButton * leftBackBtn=[[UIButton alloc]initWithFrame:CGRectMake(10,25,screenRect.size.width*.13,screenRect.size.height*.035)];
    [leftBackBtn addTarget:self action:@selector(CancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftBackBtn setTitle:@"\uE5C4" forState:UIControlStateNormal];
    [leftBackBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [leftBackBtn.titleLabel setFont:customFontdregs];
    [leftBackBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:leftBackBtn];
    
    UIImageView *userimage = [[UIImageView alloc] init];
    userimage.frame = CGRectMake(screenRect.size.width*.15,25, 30, 30);
    userimage.layer.cornerRadius = userimage.frame.size.width / 2;
    userimage.layer.masksToBounds = YES;
    userimage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    userimage.layer.borderWidth = 0.1;
    [userimage setImage:[UIImage imageNamed:@"upload_Picture.png"]];
    [self.view addSubview:userimage];

    UIFont * font1 =[UIFont fontWithName:@"Open Sans" size:15.0f];
    
    chatTableView=[[UITableView alloc]init];
    chatTableView.frame=CGRectMake(0,screenRect.size.height*.11,screenRect.size.width,screenRect.size.height*.79);
    [chatTableView removeFromSuperview];
    chatTableView.dataSource = self;
    chatTableView.delegate = self;
    [chatTableView setBackgroundColor:[UIColor clearColor]];
    chatTableView.separatorInset = UIEdgeInsetsZero;
    chatTableView.layoutMargins = UIEdgeInsetsZero;
    [chatTableView setSeparatorColor:[UIColor clearColor]];
    chatTableView.allowsMultipleSelection=YES;
    [self.view addSubview:chatTableView];
    
    NSIndexPath* ip = [NSIndexPath indexPathForRow:24 inSection:0];
    [chatTableView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionTop animated:NO];
    
    UIView * backgroundview=[[UIView alloc] init];
    [backgroundview setFrame:CGRectMake(0, screenRect.size.height*.91, screenRect.size.width, screenRect.size.height*.09)];
    [backgroundview setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:backgroundview];
    
    msgText=[[UITextField alloc]initWithFrame:CGRectMake(screenRect.size.width*.02,screenRect.size.height*.93,screenRect.size.width*.80,40)];
    msgText.font=font1;
    msgText.textAlignment=NSTextAlignmentLeft;
    UIView *paddingViews = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 40)];
    msgText.leftView = paddingViews;
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width*.13, 40)];
    msgText.rightView = paddingView1;
    msgText.delegate = self;
    msgText.textColor=[UIColor blackColor];
    [msgText setBackgroundColor:[UIColor clearColor]];
    [msgText.layer setCornerRadius:5.0f];
    msgText.leftViewMode = UITextFieldViewModeAlways;
    msgText.rightViewMode = UITextFieldViewModeAlways;
    msgText.tag=1;
    msgText.layer.borderColor=[UIColor lightGrayColor].CGColor;
    msgText.layer.borderWidth=1.f;
    msgText.placeholder=@"Type an message...";
    [self.view addSubview:msgText];
    
    UIFont *customFont = [UIFont fontWithName:@"Open Sans" size:screenRect.size.width*0.035];

    sendBtn=[[UIButton alloc]init];
    sendBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.83,screenRect.size.height*.93,screenRect.size.width*.13,40)];
    [sendBtn setBackgroundColor:[UIColor clearColor]];
    [sendBtn setBackgroundImage:[UIImage imageNamed:@"send.png"]forState:UIControlStateNormal];
    //    [sendBtn addTarget:self action:@selector(sendAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendBtn];
    
    UIButton *attahmentBtn=[[UIButton alloc]init];
    attahmentBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.01,screenRect.size.height*.92,screenRect.size.width*.13,40)];
    [attahmentBtn setBackgroundColor:[UIColor clearColor]];
    attahmentBtn.layer.cornerRadius = 20.0f;
    attahmentBtn.layer.borderColor=[UIColor colorWithHexString:@"F2F2f2"].CGColor;
    attahmentBtn.layer.borderWidth=1;
    [attahmentBtn setTitle:@"+" forState:UIControlStateNormal];
    [attahmentBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [attahmentBtn.titleLabel setFont:customFont];
    //    [sendBtn addTarget:self action:@selector(sendAction:) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:attahmentBtn];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
}

-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    const int movementDistance = -260; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    int movement = (up ? movementDistance : -movementDistance);
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 5; // you can have your own choice, of course
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 25;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:MyIdentifier];
    tableView.backgroundColor=[UIColor clearColor];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UIFont * font2 =[UIFont fontWithName:@"Open Sans" size:14.0f];
    NSString *msgStr=@"Lorem Ipsum is simply dummy text of the printing anf typeseting industry. Lorem Ipsum has been the lorem Ipsum is simply dummy text of the printing anf typeseting industry. Lorem Ipsum has been the lorem Ipsum is simply dummy text of the printing anf typeseting industry.";
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:msgStr];
    [title addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(0, title.length)];
    NSUInteger strcount = [msgStr length];
    int width=0;
    if (strcount<10) {
        width=screenRect.size.width*.30;
    }else if (strcount<20){
        width=screenRect.size.width*.45;
    }else if(strcount<30){
        width=screenRect.size.width*.70;
    }else{
        width=screenRect.size.width*.80;
    }
    UIView* customView;
    UITextView *msgLbl;
    
    if (indexPath.row%2) {
        
        customView = [[UIView alloc] initWithFrame:CGRectMake(screenRect.size.width*.15,screenRect.size.height*.005, width,[self textViewHeightForAttributedText:title andWidth:screenRect.size.width-80]+10)];
        [customView setBackgroundColor:[UIColor colorWithHexString:@"F2F2F2"]];
        //        customView.layer.cornerRadius=9.0f;
        
        customView = (UIView *)[self roundCornersOnView:customView onTopLeft:YES topRight:YES bottomLeft:NO bottomRight:YES radius:30.0];
        
        [cell.contentView addSubview:customView];
        
        UIImageView *userimg=[[UIImageView alloc]initWithFrame:CGRectMake(screenRect.size.width*.03,customView.bounds.size.height-screenRect.size.width*.09,screenRect.size.width*.09,screenRect.size.width*.09)];
        [userimg setImage:[UIImage imageNamed:@"upload_Picture.png"]];
        userimg.clipsToBounds = YES;
        userimg.layer.cornerRadius = 10;
        [cell.contentView addSubview:userimg];
        
        msgLbl=[[UITextView alloc]initWithFrame:CGRectMake(screenRect.size.width*.02,0, width-5,[self textViewHeightForAttributedText:title andWidth:screenRect.size.width-80]+10)];
        [msgLbl setText:msgStr];
        [msgLbl setTextColor:[UIColor grayColor]];
        msgLbl.font=font2;
        msgLbl.textAlignment = NSTextAlignmentLeft;
        //        msgLbl.lineBreakMode = NSLineBreakByWordWrapping;
        //        msgLbl.numberOfLines = 0;
        msgLbl.clipsToBounds = YES;
        msgLbl.layer.cornerRadius=9.0f;
        [msgLbl setBackgroundColor:[UIColor clearColor]];
        msgLbl.editable = NO;
        msgLbl.dataDetectorTypes = UIDataDetectorTypeAll;
        msgLbl.scrollEnabled=NO;
        [customView addSubview:msgLbl];
        
        UILabel *timeLabel = [[UILabel alloc] init];
        [timeLabel setFrame:CGRectMake((screenRect.size.width*.15+customView.bounds.size.width)-80,customView.bounds.size.height+2,80,28)];
        timeLabel.textAlignment = NSTextAlignmentRight;
        timeLabel.text=@"7m ago";
        [timeLabel setTextColor: [UIColor lightGrayColor]];
        UIFont * font1s =[UIFont fontWithName:@"Open Sans" size:14.0f];
        timeLabel.font=font1s;
        [cell.contentView addSubview:timeLabel];
        
    }
    else{
        
        customView = [[UIView alloc] initWithFrame:CGRectMake(screenRect.size.width*.85-width,screenRect.size.height*.005, width,[self textViewHeightForAttributedText:title andWidth:screenRect.size.width-80]+10)];
        [customView setBackgroundColor:[UIColor colorWithHexString:@"00aeef"]];
        //                customView.layer.cornerRadius=9.0f;
        [cell.contentView addSubview:customView];
        
        customView = (UIView *)[self roundCornersOnView:customView onTopLeft:YES topRight:YES bottomLeft:YES bottomRight:NO radius:30.0];
        
        UIImageView *userimg=[[UIImageView alloc]initWithFrame:CGRectMake(screenRect.size.width*.90,customView.bounds.size.height-screenRect.size.width*.09,screenRect.size.width*.09,screenRect.size.width*.09)];
        [userimg setImage:[UIImage imageNamed:@"upload_Picture.png"]];
        userimg.clipsToBounds = YES;
        userimg.layer.cornerRadius = 10;
        [cell.contentView addSubview:userimg];
        
        msgLbl=[[UITextView alloc]initWithFrame:CGRectMake(screenRect.size.width*.02,0, width-5,[self textViewHeightForAttributedText:title andWidth:screenRect.size.width-80]+10)];
        [msgLbl setText:msgStr];
        [msgLbl setTextColor:[UIColor whiteColor]];
        msgLbl.font=font2;
        msgLbl.textAlignment = NSTextAlignmentLeft;
        //        msgLbl.lineBreakMode = NSLineBreakByWordWrapping;
        //        msgLbl.numberOfLines = 0;
        msgLbl.clipsToBounds = YES;
        msgLbl.layer.cornerRadius=9.0f;
        [msgLbl setBackgroundColor:[UIColor clearColor]];
        msgLbl.editable = NO;
        msgLbl.dataDetectorTypes = UIDataDetectorTypeAll;
        msgLbl.scrollEnabled=NO;
        [customView addSubview:msgLbl];
        
        
        UILabel *timeLabel = [[UILabel alloc] init];
        [timeLabel setFrame:CGRectMake(screenRect.size.width*.05,customView.bounds.size.height+2,80,28)];
        timeLabel.textAlignment = NSTextAlignmentLeft;
        timeLabel.text=@"2m ago";
        [timeLabel setTextColor: [UIColor lightGrayColor]];
        UIFont * font1s =[UIFont fontWithName:@"Open Sans" size:14.0f];
        timeLabel.font=font1s;
        [cell.contentView addSubview:timeLabel];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (UIView *)roundCornersOnView:(UIView *)view onTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius
{
    if (tl || tr || bl || br) {
        UIRectCorner corner = 0;
        if (tl) corner = corner | UIRectCornerTopLeft;
        if (tr) corner = corner | UIRectCornerTopRight;
        if (bl) corner = corner | UIRectCornerBottomLeft;
        if (br) corner = corner | UIRectCornerBottomRight;
        
        UIView *roundedView = view;
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:roundedView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = roundedView.bounds;
        maskLayer.path = maskPath.CGPath;
        roundedView.layer.mask = maskLayer;
        return roundedView;
    }
    return view;
}

- (CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width
{
    UITextView *textView = [[UITextView alloc] init];
    [textView setAttributedText:text];
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}
- (int)timeDifference:(NSDate *)fromDate ToDate:(NSDate *)toDate{
    NSTimeInterval distanceBetweenDates = [fromDate timeIntervalSinceDate:toDate];
    return distanceBetweenDates;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    NSString *msgStr=@"Lorem Ipsum is simply dummy text of the printing anf typeseting industry. Lorem Ipsum has been the lorem Ipsum is simply dummy text of the printing anf typeseting industry. Lorem Ipsum has been the lorem Ipsum is simply dummy text of the printing anf typeseting industry.";
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:msgStr];
    UIFont * font2 =[UIFont fontWithName:@"Open Sans" size:14.0f];
    [title addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(0, title.length)];
    return [self textViewHeightForAttributedText:title andWidth:screenRect.size.width-80]+50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(IBAction)CancelAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
