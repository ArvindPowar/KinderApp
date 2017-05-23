//
//  HomeViewController.m
//  School
//
//  Created by Infinitum on 28/04/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"
#import "EventViewController.h"
#import "AttendanceViewController.h"
#import "ActivityViewController.h"
#import "AppDelegate.h"
#import "UIColor+Expanded.h"
#import "UIImage+FontAwesome.h"
#import "NSString+FontAwesome.h"
#import "MessageViewController.h"
#import "LearningViewController.h"
#import "ActivityDetalisViewController.h"
#import "MainViewController.h"
#import "RoomListVO.h"
#import "StudentVO.h"
#import "AsyncImageView.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize appDelegate,titlelable,MenuleftBtn,searchBtn,dotBtn,messageBtn,eventBtn,attendanceBtn,activtyBtn,messageLbl,eventLbl,attendanceLbl,activtyLbl,plusBtn,MessageArray,tableViewMain,messageView,eventView,EventArray,AttendanceArray,StudentArray,eventSelectArray,activityView,tap,DropBtn,DropBtn1,dropdownView,scrollView,roomListArray,dropdownMenuBtn,eventnavBtn,attendSelectArray,notificationBtn,homeBtn,homeLbl,LearningArray,activityDropdownV,activitydropdownArray,activityDDBtn,DropBtn2,acitivtyDDStr,activityIndicator,currentRoomID;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    appDelegate=[[UIApplication sharedApplication] delegate];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    titlelable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.18,15,screenRect.size.width*.40,40)];
    titlelable.textAlignment = NSTextAlignmentLeft;
    //titlelable.text=@"MESSAGES";
    titlelable.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
    [titlelable setBackgroundColor:[UIColor clearColor]];
    titlelable.font=[UIFont fontWithName:@"Open Sans" size:18.0f];
    [self.view addSubview:titlelable];
    
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    //slider menu button
    MenuleftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [MenuleftBtn setFrame:CGRectMake(10, 15,40,40)];
    [MenuleftBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [MenuleftBtn setBackgroundImage:[UIImage imageNamed:@"menubar.png"] forState:UIControlStateNormal];
    [MenuleftBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:MenuleftBtn];
    
    UIFont *customFontdregs = [UIFont fontWithName:@"FontAwesome" size:20];
    //search button
    searchBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.80,15,40,40)];
    //    [searchBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setTitle:@"\uf002" forState:UIControlStateNormal];
    [searchBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [searchBtn.titleLabel setFont:customFontdregs];
    [searchBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:searchBtn];

    //right menu button
    dotBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.90,15,40,40)];
    //    [searchBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [dotBtn setTitle:@"\uf142" forState:UIControlStateNormal];
    [dotBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [dotBtn.titleLabel setFont:customFontdregs];
    [dotBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:dotBtn];

    
    //bottom 4 button code
    
    UIFont *customFontdreg = [UIFont fontWithName:@"FontAwesome" size:24];
    UIFont *customFont = [UIFont fontWithName:@"MaterialIcons-Regular" size:30];

    if ([appDelegate.userRole isEqualToString:@"Teacher"]) {
        

        DropBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [DropBtn setFrame:CGRectMake(screenRect.size.width*0.15, 15,screenRect.size.width*.45,40)];
        [DropBtn setTitle:@"Preschool Name" forState:UIControlStateNormal];
        [DropBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
        [DropBtn setBackgroundColor:[UIColor clearColor]];
        DropBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        UIFont *customFontdr = [UIFont fontWithName:@"OpenSans-Bold" size:screenRect.size.width*0.035];
        [DropBtn.titleLabel setFont:customFontdr];
        [DropBtn addTarget:self action:@selector(dropdownViewAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:DropBtn];
        
        
        DropBtn1 = [UIButton buttonWithType:UIButtonTypeSystem];
        [DropBtn1 setFrame:CGRectMake(screenRect.size.width*0.65, 15,40,30)];
        [DropBtn1 setTitle:@"\uf0dd" forState:UIControlStateNormal];
        [DropBtn1 setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
        [DropBtn1.titleLabel setFont:customFontdregs];
        [DropBtn1 setBackgroundColor:[UIColor clearColor]];
        [DropBtn1 addTarget:self action:@selector(dropdownViewAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:DropBtn1];

        int width=screenRect.size.width/4;

        messageBtn=[[UIButton alloc]initWithFrame:CGRectMake((width-30)/2,screenRect.size.height*.92,30,25)];
        messageLbl=[[UILabel alloc]initWithFrame:CGRectMake(0,screenRect.size.height*.90+35,width,30)];
        eventBtn=[[UIButton alloc]initWithFrame:CGRectMake(width+((width-30)/2),screenRect.size.height*.91,30,30)];
        eventLbl=[[UILabel alloc]initWithFrame:CGRectMake(width,screenRect.size.height*.90+35,width,25)];
        attendanceBtn=[[UIButton alloc]initWithFrame:CGRectMake((width*2)+((width-30)/2),screenRect.size.height*.91,30,30)];
        attendanceLbl=[[UILabel alloc]initWithFrame:CGRectMake(width*2,screenRect.size.height*.90+35,width,25)];
        
        //activity button
        activtyBtn=[[UIButton alloc]initWithFrame:CGRectMake((width*3)+((width-30)/2),screenRect.size.height*.91,30,30)];
        [activtyBtn addTarget:self action:@selector(ActivityAction) forControlEvents:UIControlEventTouchUpInside];
//        [activtyBtn setBackgroundImage:[UIImage imageNamed:@"material-icons_3-0-1_graphic-eq_48_0_808080_none.png"]forState:UIControlStateNormal];
//        [activtyBtn setBackgroundImage:[UIImage imageNamed:@"material-icons_3-0-1_graphic-eq_48_0_404040_none.png"]forState:UIControlStateHighlighted];

        [activtyBtn setTitle:@"\uE1B8" forState:UIControlStateNormal];
        [activtyBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [activtyBtn.titleLabel setFont:customFont];
        [activtyBtn setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:activtyBtn];
        
        activtyLbl=[[UILabel alloc]initWithFrame:CGRectMake(width*3,screenRect.size.height*.90+35,width,25)];
        activtyLbl.textAlignment = NSTextAlignmentCenter;
        activtyLbl.text=@"ACTIVITY";
        activtyLbl.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
        [activtyLbl setBackgroundColor:[UIColor clearColor]];
        activtyLbl.font=[UIFont fontWithName:@"Open Sans" size:12.0f];
        [self.view addSubview:activtyLbl];

        currentRoomID=[[NSString alloc]init];
        [self GetRoomList];
    }else{
        searchBtn.hidden=YES;
        UIFont *customFont = [UIFont fontWithName:@"MaterialIcons-Regular" size:25];
        notificationBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.80,25,screenRect.size.width*.10,screenRect.size.height*.035)];
        //    [notificationBtn addTarget:self action:@selector(CancelAction:) forControlEvents:UIControlEventTouchUpInside];
        [notificationBtn setTitle:@"\uE7F4" forState:UIControlStateNormal];
        [notificationBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
        [notificationBtn.titleLabel setFont:customFont];
        [notificationBtn setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:notificationBtn];
        
        int width=screenRect.size.width/4;
        
        homeBtn=[[UIButton alloc]initWithFrame:CGRectMake((width-30)/2,screenRect.size.height*.92,30,25)];
        homeLbl=[[UILabel alloc]initWithFrame:CGRectMake(0,screenRect.size.height*.90+35,width,30)];

        messageBtn=[[UIButton alloc]initWithFrame:CGRectMake((width-30)/2,screenRect.size.height*.92,30,25)];
        messageLbl=[[UILabel alloc]initWithFrame:CGRectMake(0,screenRect.size.height*.90+35,width,30)];
        messageBtn=[[UIButton alloc]initWithFrame:CGRectMake(width+((width-30)/2),screenRect.size.height*.91,30,30)];
        messageLbl=[[UILabel alloc]initWithFrame:CGRectMake(width,screenRect.size.height*.90+35,width,25)];
        eventBtn=[[UIButton alloc]initWithFrame:CGRectMake((width*2)+((width-30)/2),screenRect.size.height*.91,30,30)];
        eventLbl=[[UILabel alloc]initWithFrame:CGRectMake(width*2,screenRect.size.height*.90+35,width,25)];
        
        activtyBtn=[[UIButton alloc]initWithFrame:CGRectMake((width*3)+((width-30)/2),screenRect.size.height*.91,30,30)];
        [activtyBtn addTarget:self action:@selector(ActivityAction) forControlEvents:UIControlEventTouchUpInside];
        [activtyBtn setTitle:@"\uE87B" forState:UIControlStateNormal];
        [activtyBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [activtyBtn.titleLabel setFont:customFont];
        [activtyBtn setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:activtyBtn];
        
        activtyLbl=[[UILabel alloc]initWithFrame:CGRectMake(width*3,screenRect.size.height*.90+35,width,25)];
        activtyLbl.textAlignment = NSTextAlignmentCenter;
        activtyLbl.text=@"LEARNINIG";
        activtyLbl.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
        [activtyLbl setBackgroundColor:[UIColor clearColor]];
        activtyLbl.font=[UIFont fontWithName:@"Open Sans" size:12.0f];
        [self.view addSubview:activtyLbl];

    }
    
    [homeBtn addTarget:self action:@selector(homeAction) forControlEvents:UIControlEventTouchUpInside];
    [homeBtn setTitle:@"\uE88A" forState:UIControlStateNormal];
    [homeBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [homeBtn.titleLabel setFont:customFont];
    [homeBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:homeBtn];
    
    homeLbl.textAlignment = NSTextAlignmentCenter;
    homeLbl.text=@"HOME";
    homeLbl.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
    [homeLbl setBackgroundColor:[UIColor clearColor]];
    homeLbl.font=[UIFont fontWithName:@"Open Sans" size:12.0f];
    [self.view addSubview:homeLbl];

    //message button
    [messageBtn addTarget:self action:@selector(MessageAction) forControlEvents:UIControlEventTouchUpInside];
    [messageBtn setTitle:@"\uE0C9" forState:UIControlStateNormal];
    [messageBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [messageBtn.titleLabel setFont:customFont];
    [messageBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:messageBtn];

     messageLbl.textAlignment = NSTextAlignmentCenter;
    messageLbl.text=@"MESSAGES";
    messageLbl.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
    [messageLbl setBackgroundColor:[UIColor clearColor]];
    messageLbl.font=[UIFont fontWithName:@"Open Sans" size:12.0f];
    [self.view addSubview:messageLbl];

    //event button
    [eventBtn addTarget:self action:@selector(EventAction) forControlEvents:UIControlEventTouchUpInside];
    [eventBtn setTitle:@"\uE878" forState:UIControlStateNormal];
    [eventBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [eventBtn.titleLabel setFont:customFont];
    [eventBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:eventBtn];

    eventLbl.textAlignment = NSTextAlignmentCenter;
    eventLbl.text=@"EVENTS";
    eventLbl.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
    [eventLbl setBackgroundColor:[UIColor clearColor]];
    eventLbl.font=[UIFont fontWithName:@"Open Sans" size:12.0f];
    [self.view addSubview:eventLbl];

    //attendance button
    [attendanceBtn addTarget:self action:@selector(AttendanceAction) forControlEvents:UIControlEventTouchUpInside];
    [attendanceBtn setTitle:@"\uE862" forState:UIControlStateNormal];
    [attendanceBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [attendanceBtn.titleLabel setFont:customFont];
    [attendanceBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:attendanceBtn];
    
    
    attendanceLbl.textAlignment = NSTextAlignmentCenter;
    attendanceLbl.text=@"ATTENDANCE";
    attendanceLbl.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
    [attendanceLbl setBackgroundColor:[UIColor clearColor]];
    attendanceLbl.font=[UIFont fontWithName:@"Open Sans" size:12.0f];
    [self.view addSubview:attendanceLbl];



    //message tableview
    
    eventSelectArray=[[NSMutableArray alloc]init];
    attendSelectArray=[[NSMutableArray alloc]init];
    appDelegate.tabStr=[[NSString alloc]init];
    appDelegate.tabStr=@"MAIN";
    
    if ([appDelegate.userRole isEqualToString:@"Teacher"]) {
        //plus button
        plusBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.82,screenRect.size.height*.80,screenRect.size.width*.13,screenRect.size.width*.13)];
        plusBtn.layer.cornerRadius = screenRect.size.width*.065f;
        [plusBtn setTitle:@"+" forState:UIControlStateNormal];
        [plusBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        plusBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        plusBtn.titleLabel.font= [UIFont fontWithName:@"OpenSans-Bold" size:30];
        //[plusBtn setBackgroundImage:[UIImage imageNamed:@"Button-ayarlar.png"]forState:UIControlStateNormal];
        [plusBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
        //[addContent addTarget:self action:@selector(menuView:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:plusBtn];

    [messageView removeFromSuperview];
    messageView=[[UIView alloc]init];
    messageView.frame=CGRectMake(0,screenRect.size.height*.10,screenRect.size.width,screenRect.size.height*.70);
    [messageView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:messageView];
    
    [tableViewMain removeFromSuperview];
    tableViewMain=[[UITableView alloc]init];
    tableViewMain.frame=CGRectMake(0,0,screenRect.size.width,screenRect.size.height*.70);
    tableViewMain.dataSource = self;
    tableViewMain.delegate = self;
    [tableViewMain setBackgroundColor:[UIColor clearColor]];
    self.tableViewMain.separatorColor = [UIColor clearColor];
    tableViewMain.separatorInset = UIEdgeInsetsZero;
    tableViewMain.layoutMargins = UIEdgeInsetsZero;
    [messageView addSubview:tableViewMain];

    }else{
        [messageView removeFromSuperview];
        messageView=[[UIView alloc]init];
        messageView.frame=CGRectMake(0,screenRect.size.height*.10,screenRect.size.width,screenRect.size.height*.80);
        [messageView setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:messageView];
        
        UIImageView *  logoImg=[[UIImageView alloc]initWithFrame:CGRectMake(screenRect.size.width*.35,screenRect.size.height*.01,screenRect.size.width*.30,screenRect.size.width*.30)];
        [logoImg setImage:[UIImage imageNamed:@"boy.jpg"]];
        logoImg.layer.cornerRadius = logoImg.frame.size.width / 2;
        logoImg.layer.masksToBounds=YES;
        [messageView addSubview:logoImg];

        UILabel *usernameLabel =[[UILabel alloc]initWithFrame:CGRectMake(0,screenRect.size.height*.19,screenRect.size.width, screenRect.size.height*.04)];
        usernameLabel.textAlignment = NSTextAlignmentCenter;
        //[usernameLabel setText:[NSString stringWithFormat:@"%@",[homepage objectForKey:@"username"]]];
        //    usernameLabel.text=@"Somnath Shinde";
        //    usernameLabel.font = [UIFont fontWithName:@"OpenSans-Bold" size:18];
        usernameLabel.textColor=[UIColor whiteColor];
        usernameLabel.lineBreakMode = NSLineBreakByWordWrapping;
        usernameLabel.numberOfLines = 0;
        usernameLabel.textAlignment = NSTextAlignmentCenter;
        usernameLabel.text=@"Somnath Shinde";
        [messageView addSubview:usernameLabel];

        
        UIView *bgView=[[UIView alloc]init];
        bgView.frame=CGRectMake(0,screenRect.size.height*.23,screenRect.size.width,screenRect.size.height*.07);
        [bgView setBackgroundColor:[UIColor colorWithHexString:@"f7f7f7"]];
        [messageView addSubview:bgView];
        
        DropBtn2 = [UIButton buttonWithType:UIButtonTypeSystem];
        [DropBtn2 setFrame:CGRectMake(screenRect.size.width*0.05, screenRect.size.height*0.23,screenRect.size.width*.35,40)];
        [DropBtn2 setTitle:@"All Activities" forState:UIControlStateNormal];
        [DropBtn2 setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
        [DropBtn2 setBackgroundColor:[UIColor clearColor]];
        DropBtn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        UIFont *customFontdr = [UIFont fontWithName:@"Open Sans" size:screenRect.size.width*0.04];
        [DropBtn2.titleLabel setFont:customFontdr];
        [DropBtn2 addTarget:self action:@selector(ActivitydropdownAction) forControlEvents:UIControlEventTouchUpInside];
        [messageView addSubview:DropBtn2];
        
        UIButton *DropBtn3 = [UIButton buttonWithType:UIButtonTypeSystem];
        [DropBtn3 setFrame:CGRectMake(screenRect.size.width*0.50, screenRect.size.height*0.23,40,30)];
        [DropBtn3 setTitle:@"\uf0dd" forState:UIControlStateNormal];
        [DropBtn3 setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
        [DropBtn3.titleLabel setFont:customFontdregs];
        [DropBtn3 setBackgroundColor:[UIColor clearColor]];
            [DropBtn3 addTarget:self action:@selector(ActivitydropdownAction) forControlEvents:UIControlEventTouchUpInside];
        [messageView addSubview:DropBtn3];

        StudentArray=[[NSMutableArray alloc]initWithObjects:@"Kudos",@"Learning",@"Photos",@"Notes", nil];
        acitivtyDDStr=[[NSString alloc]init];
        acitivtyDDStr=@"All Activities";
        
        UILabel *linelabel=[[UILabel alloc] initWithFrame:CGRectMake(24.5,screenRect.size.height*0.30, 1, screenRect.size.height*0.50)];
        [linelabel setBackgroundColor:[UIColor grayColor]];
        [messageView addSubview:linelabel];

        [tableViewMain removeFromSuperview];
        tableViewMain=[[UITableView alloc]init];
        tableViewMain.frame=CGRectMake(0,screenRect.size.height*.30,screenRect.size.width,screenRect.size.height*.50);
        tableViewMain.dataSource = self;
        tableViewMain.delegate = self;
        [tableViewMain setBackgroundColor:[UIColor clearColor]];
        self.tableViewMain.separatorColor = [UIColor clearColor];
        tableViewMain.separatorInset = UIEdgeInsetsZero;
        tableViewMain.layoutMargins = UIEdgeInsetsZero;
        [messageView addSubview:tableViewMain];
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

-(void)GetRoomList{
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    NSURL *url;
    NSMutableString *httpBodyString;
    NSString *urlString;
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    httpBodyString=[[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"user_id=%@",@"2"]];
    urlString = [[NSString alloc]initWithFormat:@"%@roomlist",[prefs objectForKey:@"Link"]];
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
    if ([content isEqualToString:@""]) {
        [activityIndicator stopAnimating];

    }else{
        roomListArray=[[NSMutableArray alloc]init];
        NSDictionary *userDict=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSString *result = [[NSString alloc]init];
        result =[userDict objectForKey:@"status"];
        NSString *message = [[NSString alloc]init];
        message = [userDict objectForKey:@"msg"];
        int boolValue =[result intValue];
        if (boolValue==0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [activityIndicator stopAnimating];
        }
        else if (boolValue==1){
            NSArray *userArray=[userDict objectForKey:@"data"];
            for (int count=0; count<[userArray count]; count++) {
                NSDictionary *activityData=[userArray objectAtIndex:count];

            RoomListVO *roomvo=[[RoomListVO alloc] init];
            roomvo.room_id=[[NSString alloc] init];
            roomvo.room_name=[[NSString alloc] init];
            roomvo.room_address=[[NSString alloc] init];
            roomvo.user_id=[[NSString alloc] init];
            roomvo.school_id=[[NSString alloc] init];
            roomvo.status=[[NSString alloc] init];
            roomvo.created=[[NSString alloc] init];

            if ([activityData objectForKey:@"room_id"] != [NSNull null])
                roomvo.room_id=[activityData objectForKey:@"room_id"];
            
            if ([activityData objectForKey:@"room_name"] != [NSNull null])
                roomvo.room_name=[activityData objectForKey:@"room_name"];
            
            if ([activityData objectForKey:@"room_address"] != [NSNull null])
                roomvo.room_address=[activityData objectForKey:@"room_address"];
            
            if ([activityData objectForKey:@"user_id"] != [NSNull null])
                roomvo.user_id=[activityData objectForKey:@"user_id"];

            if ([activityData objectForKey:@"school_id"] != [NSNull null])
                roomvo.school_id=[activityData objectForKey:@"school_id"];
            
            if ([activityData objectForKey:@"status"] != [NSNull null])
                roomvo.status=[activityData objectForKey:@"status"];
            
            if ([activityData objectForKey:@"created"] != [NSNull null])
                roomvo.created=[activityData objectForKey:@"created"];

                [roomListArray addObject:roomvo];
            }
            if ([roomListArray count]>0) {
                RoomListVO *roomvo=[[RoomListVO alloc] init];
                roomvo=[roomListArray objectAtIndex:0];
                currentRoomID=roomvo.room_id;
                [DropBtn setTitle:roomvo.room_name forState:UIControlStateNormal];
                [self GetStudentList];
            }

            [activityIndicator stopAnimating];
            }
            }
        }
    }];
}
-(void)GetStudentList{
    [activityIndicator stopAnimating];
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    NSURL *url;
    NSMutableString *httpBodyString;
    NSString *urlString;
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    httpBodyString=[[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"room_id=%@",currentRoomID]];
    urlString = [[NSString alloc]initWithFormat:@"%@studentlist",[prefs objectForKey:@"Link"]];
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
            if ([content isEqualToString:@""]) {
                [activityIndicator stopAnimating];
                
            }else{

            StudentArray=[[NSMutableArray alloc]init];
        NSDictionary *userDict=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSString *result = [[NSString alloc]init];
        result =[userDict objectForKey:@"status"];
        NSString *message = [[NSString alloc]init];
        message = [userDict objectForKey:@"msg"];
        int boolValue =[result intValue];
        if (boolValue==0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"KinderApp" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [activityIndicator stopAnimating];
        }
        else if (boolValue==1){
            NSArray *userArray=[userDict objectForKey:@"data"];
            for (int count=0; count<[userArray count]; count++) {
                NSDictionary *activityData=[userArray objectAtIndex:count];
                
                StudentVO *studentvo=[[StudentVO alloc] init];
                studentvo.student_id=[[NSString alloc] init];
                studentvo.room_id=[[NSString alloc] init];
                studentvo.first_name=[[NSString alloc] init];
                studentvo.last_name=[[NSString alloc] init];
                studentvo.birthdate=[[NSString alloc] init];
                studentvo.health=[[NSString alloc] init];
                studentvo.notes=[[NSString alloc] init];
                studentvo.parent_id=[[NSString alloc] init];
                studentvo.gurdian_id=[[NSString alloc] init];
                studentvo.contact=[[NSString alloc] init];
                studentvo.photo=[[NSString alloc] init];
                studentvo.status=[[NSString alloc] init];
                studentvo.created=[[NSString alloc] init];

                if ([activityData objectForKey:@"student_id"] != [NSNull null])
                    studentvo.student_id=[activityData objectForKey:@"student_id"];
                
                if ([activityData objectForKey:@"room_id"] != [NSNull null])
                    studentvo.room_id=[activityData objectForKey:@"room_id"];
                
                if ([activityData objectForKey:@"first_name"] != [NSNull null])
                    studentvo.first_name=[activityData objectForKey:@"first_name"];
                
                if ([activityData objectForKey:@"last_name"] != [NSNull null])
                    studentvo.last_name=[activityData objectForKey:@"last_name"];
                
                if ([activityData objectForKey:@"birthdate"] != [NSNull null])
                    studentvo.birthdate=[activityData objectForKey:@"birthdate"];
                
                if ([activityData objectForKey:@"health"] != [NSNull null])
                    studentvo.health=[activityData objectForKey:@"health"];
                
                if ([activityData objectForKey:@"notes"] != [NSNull null])
                    studentvo.notes=[activityData objectForKey:@"notes"];
                
                if ([activityData objectForKey:@"parent_id"] != [NSNull null])
                    studentvo.parent_id=[activityData objectForKey:@"parent_id"];
                
                if ([activityData objectForKey:@"gurdian_id"] != [NSNull null])
                    studentvo.gurdian_id=[activityData objectForKey:@"gurdian_id"];
                
                if ([activityData objectForKey:@"contact"] != [NSNull null])
                    studentvo.contact=[activityData objectForKey:@"contact"];
                
                if ([activityData objectForKey:@"photo"] != [NSNull null])
                    studentvo.photo=[activityData objectForKey:@"photo"];
                
                if ([activityData objectForKey:@"status"] != [NSNull null])
                    studentvo.status=[activityData objectForKey:@"status"];
                
                if ([activityData objectForKey:@"created"] != [NSNull null])
                    studentvo.created=[activityData objectForKey:@"created"];

                [StudentArray addObject:studentvo];
            }
            [tableViewMain reloadData];
            [activityIndicator stopAnimating];
                    }
                }
            }
        }];
}

-(void)homeAction{
    MainViewController *mainvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    appDelegate.index=0;
    [self.navigationController pushViewController:mainvc animated:YES];

}
-(void)ActivitydropdownAction{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    activityDropdownV=[[UIView alloc]init];
    activitydropdownArray=[NSMutableArray arrayWithObjects:@"All Activities",@"Notes",@"Learning",@"Kudos",@"Photos", nil];

    activityDropdownV.frame=CGRectMake(screenRect.size.width*.05,screenRect.size.height*.33,screenRect.size.width*.50,screenRect.size.height*.31);
    [activityDropdownV setBackgroundColor:[UIColor whiteColor]];
    activityDropdownV.layer.borderWidth=2.f;
    activityDropdownV.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    int height=5;
    for (int count=1; count<[activitydropdownArray count]+1; count++){
        NSString *titleStr=[activitydropdownArray objectAtIndex:count-1];
        activityDDBtn=[[UIButton alloc] initWithFrame:CGRectMake(screenRect.size.width*0.05, height+1,screenRect.size.width*0.45, screenRect.size.height*0.06)];
        [activityDDBtn setBackgroundColor:[UIColor clearColor]];
        activityDDBtn.tag=count;
        [activityDDBtn setTitle:titleStr forState:UIControlStateNormal];
        [activityDDBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
        activityDDBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [activityDDBtn addTarget:self action:@selector(ActivityBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [activityDropdownV addSubview:activityDDBtn];
        
        height=height+screenRect.size.height*0.06;
        
        UILabel *lineLbl=[[UILabel alloc] initWithFrame:CGRectMake(0, height, screenRect.size.width*0.50,1)];
        [lineLbl setBackgroundColor:[UIColor colorWithHexString:@"a6ccc6"]];
        [activityDropdownV addSubview:lineLbl];
        
    }

    [self.view addSubview:activityDropdownV];
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnView:)];
    [self.view addGestureRecognizer:tap];

}
-(void)dropdownViewAction{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
     dropdownView=[[UIView alloc]init];
    int viehieght;
    if ([roomListArray count]>6) {
         viehieght=screenRect.size.height*.40;
    }else{
         viehieght=roomListArray.count *screenRect.size.height*.07;
    }
    dropdownView.frame=CGRectMake(screenRect.size.width*.15,screenRect.size.height*.08,screenRect.size.width*.60,viehieght);
    [dropdownView setBackgroundColor:[UIColor whiteColor]];
    dropdownView.layer.borderWidth=2.f;
    dropdownView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0, screenRect.size.width*.60, viehieght)];
    [scrollView setBackgroundColor:[UIColor clearColor]];
    int height=5;
    for (int count=1; count<[roomListArray count]+1; count++){
        RoomListVO *roomvo=[[RoomListVO alloc] init];
        roomvo=[roomListArray objectAtIndex:count-1];

        dropdownMenuBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, height+1,screenRect.size.width*0.60, screenRect.size.height*0.06)];
        [dropdownMenuBtn setBackgroundColor:[UIColor clearColor]];
        dropdownMenuBtn.tag=count;
        [dropdownMenuBtn setTitle:roomvo.room_name forState:UIControlStateNormal];
        [dropdownMenuBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
        [dropdownMenuBtn addTarget:self action:@selector(menuBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:dropdownMenuBtn];
        
        height=height+screenRect.size.height*0.06;

        UILabel *lineLbl=[[UILabel alloc] initWithFrame:CGRectMake(0, height, screenRect.size.width*0.60,1)];
        [lineLbl setBackgroundColor:[UIColor colorWithHexString:@"a6ccc6"]];
        [scrollView addSubview:lineLbl];

    }
    [dropdownView addSubview:scrollView];
    scrollView.contentSize=CGSizeMake(screenRect.size.width*.60,height+50);
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromBottom;
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [dropdownView.layer addAnimation:transition forKey:nil];

    [self.view addSubview:dropdownView];
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnView:)];
    [self.view addGestureRecognizer:tap];

}
-(void)menuBtnAction:(UIButton *)btn{
    RoomListVO *roomvo=[[RoomListVO alloc] init];
    roomvo=[roomListArray objectAtIndex:btn.tag-1];
    currentRoomID=roomvo.room_id;
    [DropBtn setTitle:roomvo.room_name forState:UIControlStateNormal];
    [dropdownView removeFromSuperview];
    [self GetStudentList];
}
-(void)ActivityBtnAction:(UIButton *)btn{
    acitivtyDDStr=[activitydropdownArray objectAtIndex:btn.tag-1];
    [DropBtn2 setTitle:acitivtyDDStr forState:UIControlStateNormal];
    [activityDropdownV removeFromSuperview];
    if ([acitivtyDDStr isEqualToString:@"All Activities"]) {
        StudentArray=[[NSMutableArray alloc]initWithObjects:@"Kudos",@"Learning",@"Photos",@"Notes", nil];
    }else if ([acitivtyDDStr isEqualToString:@"Kudos"]){
        StudentArray=[[NSMutableArray alloc]initWithObjects:@"Kudos", nil];
    }else if ([acitivtyDDStr isEqualToString:@"Learning"]){
        StudentArray=[[NSMutableArray alloc]initWithObjects:@"Learning", nil];
    }else if ([acitivtyDDStr isEqualToString:@"Photos"]){
        StudentArray=[[NSMutableArray alloc]initWithObjects:@"Photos", nil];
    }else if ([acitivtyDDStr isEqualToString:@"Notes"]){
        StudentArray=[[NSMutableArray alloc]initWithObjects:@"Notes", nil];
    }
    [tableViewMain reloadData];
}

-(void)MessageAction{
    [dropdownView removeFromSuperview];
    [eventnavBtn removeFromSuperview];
    notificationBtn.hidden=YES;
    DropBtn.hidden=YES;
    DropBtn1.hidden=YES;
    plusBtn.hidden=NO;
    searchBtn.hidden=NO;
//    [plusBtn setTitle:@"\uf086" forState:UIControlStateNormal];
//    plusBtn.titleLabel.font= [UIFont fontWithName:@"FontAwesome" size:25];
    
    
    [homeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [messageBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [eventBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [attendanceBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [activtyBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];

    
    [activityView removeFromSuperview];
    titlelable.text=@"MESSAGES";
    appDelegate.tabStr=@"MESSAGES";
    CGRect screenRect = [[UIScreen mainScreen] bounds];

    [messageView removeFromSuperview];
    messageView=[[UIView alloc]init];
    messageView.frame=CGRectMake(0,screenRect.size.height*.10,screenRect.size.width,screenRect.size.height*.70);
    [messageView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:messageView];
    
    MessageArray=[[NSMutableArray alloc]initWithObjects:@"Somnath",@"Ravi",@"Rahul",@"Amit",@"Amit", nil];
    [tableViewMain removeFromSuperview];
    tableViewMain=[[UITableView alloc]init];
    tableViewMain.frame=CGRectMake(0,0,screenRect.size.width,screenRect.size.height*.70);
    tableViewMain.dataSource = self;
    tableViewMain.delegate = self;
    [tableViewMain setBackgroundColor:[UIColor clearColor]];
    self.tableViewMain.separatorColor = [UIColor clearColor];
    tableViewMain.separatorInset = UIEdgeInsetsZero;
    tableViewMain.layoutMargins = UIEdgeInsetsZero;
    [messageView addSubview:tableViewMain];
 
}

-(void)EventAction{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    [dropdownView removeFromSuperview];
    [eventnavBtn removeFromSuperview];
    notificationBtn.hidden=YES;
    DropBtn.hidden=YES;
    DropBtn1.hidden=YES;

    if ([appDelegate.userRole isEqualToString:@"Teacher"]){
        plusBtn.hidden=NO;
        searchBtn.hidden=NO;
    }
    else{
        searchBtn.hidden=YES;
        plusBtn.hidden=YES;
        
        //navigation event button
        eventnavBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.82,22,23,23)];
        //    [eventnavBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [eventnavBtn setBackgroundImage:[UIImage imageNamed:@"material-icons_3-0-1_event_48_0_404040_none.png"]forState:UIControlStateNormal];
        [eventnavBtn setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:eventnavBtn];

    }
   
//    [plusBtn setTitle:@"\uf272" forState:UIControlStateNormal];
//    plusBtn.titleLabel.font= [UIFont fontWithName:@"FontAwesome" size:25];

    [homeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [messageBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [eventBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [attendanceBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [activtyBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];

    [activityView removeFromSuperview];
    titlelable.text=@"EVENTS";
    appDelegate.tabStr=@"EVENTS";

    [messageView removeFromSuperview];
    messageView=[[UIView alloc]init];
    messageView.frame=CGRectMake(0,screenRect.size.height*.10,screenRect.size.width,screenRect.size.height*.70);
    [messageView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:messageView];
    
    EventArray=[[NSMutableArray alloc]initWithObjects:@"Somnath",@"Ravi",@"Rahul",@"Amit",@"Amit", nil];
    [tableViewMain removeFromSuperview];
    tableViewMain=[[UITableView alloc]init];
    tableViewMain.frame=CGRectMake(0,0,screenRect.size.width,screenRect.size.height*.70);
    tableViewMain.dataSource = self;
    tableViewMain.delegate = self;
    [tableViewMain setBackgroundColor:[UIColor clearColor]];
    self.tableViewMain.separatorColor = [UIColor clearColor];
    tableViewMain.separatorInset = UIEdgeInsetsZero;
    tableViewMain.layoutMargins = UIEdgeInsetsZero;
    [messageView addSubview:tableViewMain];

}

-(void)AttendanceAction{
    [dropdownView removeFromSuperview];
    [eventnavBtn removeFromSuperview];
    DropBtn.hidden=YES;
    DropBtn1.hidden=YES;
    plusBtn.hidden=YES;
    notificationBtn.hidden=YES;


    [homeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [messageBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [eventBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [attendanceBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [activtyBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];

    [activityView removeFromSuperview];
    titlelable.text=@"ATTENDANCE";
    appDelegate.tabStr=@"ATTENDANCE";
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    
    AttendanceArray=[[NSMutableArray alloc]initWithObjects:@"Yesterday",@"April 10",@"April 09",@"April 08",@"April 07", nil];

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    [messageView removeFromSuperview];
    messageView=[[UIView alloc]init];
    messageView.frame=CGRectMake(0,screenRect.size.height*.10,screenRect.size.width,screenRect.size.height*.70);
    [messageView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:messageView];
    
    if ([appDelegate.userRole isEqualToString:@"Teacher"])
    {
//    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width,screenRect.size.height*0.80) collectionViewLayout:layout];
//    [_collectionView setDataSource:self];
//    [_collectionView setDelegate:self];
//    
//    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
//    [_collectionView setBackgroundColor:[UIColor clearColor]];
//    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
//    [messageView addSubview:_collectionView];
        
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width,screenRect.size.height*0.80) collectionViewLayout:layout];
        [_collectionView setDataSource:self];
        [_collectionView setDelegate:self];
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        
        [messageView addSubview:_collectionView];

    }else{
        searchBtn.hidden=YES;
        [tableViewMain removeFromSuperview];
        tableViewMain=[[UITableView alloc]init];
        tableViewMain.frame=CGRectMake(0,0,screenRect.size.width,screenRect.size.height*.70);
        tableViewMain.dataSource = self;
        tableViewMain.delegate = self;
        [tableViewMain setBackgroundColor:[UIColor clearColor]];
        self.tableViewMain.separatorColor = [UIColor clearColor];
        tableViewMain.separatorInset = UIEdgeInsetsZero;
        tableViewMain.layoutMargins = UIEdgeInsetsZero;
        [messageView addSubview:tableViewMain];

        UIFont *customFontdregs = [UIFont fontWithName:@"OpenSans-Bold" size:screenRect.size.width*0.035];
        UIButton *CheckINBtn=[[UIButton alloc]initWithFrame:CGRectMake(0,screenRect.size.height*0.73,screenRect.size.width,screenRect.size.height*0.07)];
        [CheckINBtn setTitle:@"Check In" forState:UIControlStateNormal];
        [CheckINBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        CheckINBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [CheckINBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
        [CheckINBtn.titleLabel setFont:customFontdregs];
//        [CheckINBtn addTarget:self action:@selector(LoginAction) forControlEvents:UIControlEventTouchUpInside];
        [messageView addSubview:CheckINBtn];

}
}
-(void)ActivityAction{
    [dropdownView removeFromSuperview];
    [eventnavBtn removeFromSuperview];
    DropBtn.hidden=YES;
    DropBtn1.hidden=YES;

    plusBtn.hidden=YES;

    [homeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [messageBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [eventBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [attendanceBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [activtyBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];

//    titlelable.text=@"ACTIVITY";
//    appDelegate.tabStr=@"ACTIVITY";
    CGRect screenRect = [[UIScreen mainScreen] bounds];

    [activityView removeFromSuperview];
    if ([appDelegate.userRole isEqualToString:@"Parent"]) {
        [activityView removeFromSuperview];
        titlelable.text=@"LEARNING";
        appDelegate.tabStr=@"LEARNING";
        
        [messageView removeFromSuperview];
        messageView=[[UIView alloc]init];
        messageView.frame=CGRectMake(0,screenRect.size.height*.10,screenRect.size.width,screenRect.size.height*.70);
        [messageView setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:messageView];
        
        LearningArray=[[NSMutableArray alloc]initWithObjects:@"Somnath",@"Ravi",@"Rahul",@"Amit",@"Amit", nil];
        [tableViewMain removeFromSuperview];
        tableViewMain=[[UITableView alloc]init];
        tableViewMain.frame=CGRectMake(0,0,screenRect.size.width,screenRect.size.height*.70);
        tableViewMain.dataSource = self;
        tableViewMain.delegate = self;
        [tableViewMain setBackgroundColor:[UIColor clearColor]];
        self.tableViewMain.separatorColor = [UIColor clearColor];
        tableViewMain.separatorInset = UIEdgeInsetsZero;
        tableViewMain.layoutMargins = UIEdgeInsetsZero;
        [messageView addSubview:tableViewMain];

    }else{
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnView:)];
    [self.view addGestureRecognizer:tap];

    activityView=[[UIView alloc]init];
    activityView.frame=CGRectMake(0,0,screenRect.size.width,screenRect.size.height*.90);
    [activityView setBackgroundColor:[UIColor blackColor]];
    [activityView setBackgroundColor:[[UIColor clearColor] colorWithAlphaComponent:0.7]];
    [self.view addSubview:activityView];

    UILabel*activitylable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.20,15,screenRect.size.width*.60,40)];
    activitylable.textAlignment = NSTextAlignmentCenter;
    activitylable.text=@"ACTIVITY";
    activitylable.textColor=[UIColor whiteColor];
    [activitylable setBackgroundColor:[UIColor clearColor]];
    activitylable.font=[UIFont fontWithName:@"Open Sans" size:18.0f];
    [activityView addSubview:activitylable];

    UIFont *customFontdregs = [UIFont fontWithName:@"FontAwesome" size:25];
    UIButton *closeBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.90,15,40,40)];
    [closeBtn addTarget:self action:@selector(CloseAction) forControlEvents:UIControlEventTouchUpInside];
    [closeBtn setTitle:@"\uf00d" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [closeBtn.titleLabel setFont:customFontdregs];
    [closeBtn setBackgroundColor:[UIColor clearColor]];
    [activityView addSubview:closeBtn];

    
    UIFont *customFontdreg = [UIFont fontWithName:@"FontAwesome" size:24];
    UILabel *kudosbackLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.17,screenRect.size.height*.40,screenRect.size.width*.15,screenRect.size.width*.15)];
    kudosbackLbl.layer.cornerRadius = screenRect.size.width*.075f;
    kudosbackLbl.layer.masksToBounds=YES;
    [kudosbackLbl setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    [activityView addSubview:kudosbackLbl];

    
    UIButton *kudosBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.195,screenRect.size.height*.41,screenRect.size.width*.10,screenRect.size.width*.10)];
    [kudosBtn setBackgroundImage:[UIImage imageNamed:@"material-icons_3-0-1_star_48_0_ffffff_none.png"]forState:UIControlStateNormal];
    [kudosBtn setBackgroundColor:[UIColor clearColor]];
    //[kudosBtn addTarget:self action:@selector(menuView:) forControlEvents:UIControlEventTouchUpInside];
    [activityView addSubview:kudosBtn];

    UILabel*kudosLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.145,screenRect.size.height*.40+screenRect.size.width*.16,screenRect.size.width*.20,30)];
    kudosLbl.textAlignment = NSTextAlignmentCenter;
    kudosLbl.text=@"KUDOS";
    kudosLbl.textColor=[UIColor whiteColor];
    [kudosLbl setBackgroundColor:[UIColor clearColor]];
    kudosLbl.font=[UIFont fontWithName:@"Open Sans" size:16.0f];
    [activityView addSubview:kudosLbl];

    
    UILabel *photobackLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.425,screenRect.size.height*.26,screenRect.size.width*.15,screenRect.size.width*.15)];
    photobackLbl.layer.cornerRadius = screenRect.size.width*.075f;
    photobackLbl.layer.masksToBounds=YES;
    [photobackLbl setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    [activityView addSubview:photobackLbl];

    UIButton *photoBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.45,screenRect.size.height*.27,screenRect.size.width*.10,screenRect.size.width*.10)];
    [photoBtn setBackgroundImage:[UIImage imageNamed:@"material-icons_3-0-1_camera-alt_48_0_ffffff_none.png"]forState:UIControlStateNormal];
    [photoBtn setBackgroundColor:[UIColor clearColor]];
    //[photoBtn addTarget:self action:@selector(menuView:) forControlEvents:UIControlEventTouchUpInside];
    [activityView addSubview:photoBtn];

    UILabel*photoLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.40,screenRect.size.height*.26+screenRect.size.width*.16,screenRect.size.width*.20,30)];
    photoLbl.textAlignment = NSTextAlignmentCenter;
    photoLbl.text=@"PHOTO";
    photoLbl.textColor=[UIColor whiteColor];
    [photoLbl setBackgroundColor:[UIColor clearColor]];
    photoLbl.font=[UIFont fontWithName:@"Open Sans" size:16.0f];
    [activityView addSubview:photoLbl];

    UILabel *learingbackLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.425,screenRect.size.height*.54,screenRect.size.width*.15,screenRect.size.width*.15)];
    learingbackLbl.layer.cornerRadius = screenRect.size.width*.075f;
    learingbackLbl.layer.masksToBounds=YES;
    [learingbackLbl setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    [activityView addSubview:learingbackLbl];

    UIButton *learingBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.45,screenRect.size.height*.55,screenRect.size.width*.10,screenRect.size.width*.10)];
    [learingBtn setBackgroundImage:[UIImage imageNamed:@"font-awesome_4-7-0_graduation-cap_48_0_ffffff_none.png"]forState:UIControlStateNormal];
    [learingBtn setBackgroundColor:[UIColor clearColor]];
    [learingBtn addTarget:self action:@selector(LearningAction) forControlEvents:UIControlEventTouchUpInside];
    [activityView addSubview:learingBtn];

    UILabel *learingLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.385,screenRect.size.height*.54+screenRect.size.width*.16,screenRect.size.width*.25,30)];
    learingLbl.textAlignment = NSTextAlignmentCenter;
    learingLbl.text=@"LEARNING";
    learingLbl.textColor=[UIColor whiteColor];
    [learingLbl setBackgroundColor:[UIColor clearColor]];
    learingLbl.font=[UIFont fontWithName:@"Open Sans" size:16.0f];
    [activityView addSubview:learingLbl];

    UILabel *notebackLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.68,screenRect.size.height*.40,screenRect.size.width*.15,screenRect.size.width*.15)];
    notebackLbl.layer.cornerRadius = screenRect.size.width*.075f;
    notebackLbl.layer.masksToBounds=YES;
    [notebackLbl setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    [activityView addSubview:notebackLbl];

    UIButton *noteBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.705,screenRect.size.height*.41,screenRect.size.width*.10,screenRect.size.width*.10)];
    [noteBtn setBackgroundImage:[UIImage imageNamed:@"material-icons_3-0-1_assignment-turned-in_48_0_ffffff_none.png"]forState:UIControlStateNormal];
    [noteBtn setBackgroundColor:[UIColor clearColor]];
    //[addContent addTarget:self action:@selector(menuView:) forControlEvents:UIControlEventTouchUpInside];
    [activityView addSubview:noteBtn];

    UILabel*noteLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.68,screenRect.size.height*.40+screenRect.size.width*.16,screenRect.size.width*.15,30)];
    noteLbl.textAlignment = NSTextAlignmentCenter;
    noteLbl.text=@"NOTE";
    noteLbl.textColor=[UIColor whiteColor];
    [noteLbl setBackgroundColor:[UIColor clearColor]];
    noteLbl.font=[UIFont fontWithName:@"Open Sans" size:16.0f];
    [activityView addSubview:noteLbl];

    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [activityView.layer addAnimation:transition forKey:nil];
    }
}
-(void)LearningAction{
    LearningViewController *learning=[[LearningViewController alloc] initWithNibName:@"LearningViewController" bundle:nil];
    [self.navigationController pushViewController:learning animated:NO];
}

-(void)CloseAction{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    [UIView animateWithDuration:0.5
                          delay:0.5
                        options: UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.activityView.frame = CGRectMake(screenRect.size.width,screenRect.size.height, 0, 0);
                     }
                     completion:^(BOOL finished){
                         if (finished)
                             [self.activityView removeFromSuperview];
                     }];
    tap.enabled = NO;
}
- (void)tapOnView:(UITapGestureRecognizer *)sender
{
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    [UIView animateWithDuration:0.5
//                          delay:0.5
//                        options: UIViewAnimationOptionTransitionCrossDissolve
//                     animations:^{
//                         self.activityView.frame = CGRectMake(screenRect.size.width,screenRect.size.height, 0, 0);
//                     }
//                     completion:^(BOOL finished){
//                         if (finished)
//                             [self.activityView removeFromSuperview];
//                     }];
    sender.enabled = NO;
    [dropdownView removeFromSuperview];
    [activityDropdownV removeFromSuperview];

}

#pragma marl - UITableView Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    if (![appDelegate.userRole isEqualToString:@"Teacher"] && [appDelegate.tabStr isEqualToString:@"ATTENDANCE"])
        return [AttendanceArray count];
    else
    return 1;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (![appDelegate.userRole isEqualToString:@"A"] && [appDelegate.tabStr isEqualToString:@"ATTENDANCE"])
//        return [AttendanceArray objectAtIndex:section];
//    else
//    return nil;
//}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:
                                 CGRectMake(20, 0, tableView.frame.size.width, 35.0)];
    
    [sectionHeaderView setBackgroundColor:[UIColor clearColor]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(10,5,sectionHeaderView.frame.size.width-90,25)];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.font = [UIFont fontWithName:@"Open Sans" size:15];
    headerLabel.textColor=[UIColor grayColor];
    NSString *  personname;
    personname= [AttendanceArray objectAtIndex:section];
    headerLabel.text=personname;
    headerLabel.textAlignment = NSTextAlignmentLeft;
    [sectionHeaderView addSubview:headerLabel];
    
    
    if (![appDelegate.userRole isEqualToString:@"Teacher"] && [appDelegate.tabStr isEqualToString:@"ATTENDANCE"])
        return sectionHeaderView;
    else
        return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    int height=35;
    
    if (![appDelegate.userRole isEqualToString:@"Teacher"] && [appDelegate.tabStr isEqualToString:@"ATTENDANCE"])
        return height;
    else
        return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([appDelegate.tabStr isEqualToString:@"MAIN"]) {
        return [StudentArray count];
    }else if ([appDelegate.tabStr isEqualToString:@"MESSAGES"]) {
        return [MessageArray count];
    }else if ([appDelegate.tabStr isEqualToString:@"EVENTS"]) {
        return [EventArray count];
    }else if ([appDelegate.tabStr isEqualToString:@"LEARNING"]) {
        return [LearningArray count];
    }else if ([appDelegate.tabStr isEqualToString:@"ATTENDANCE"]) {
        return 2;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    if ([appDelegate.tabStr isEqualToString:@"MAIN"]) {
        if ([appDelegate.userRole isEqualToString:@"Teacher"]) {
        return screenRect.size.height*0.12;
        }else{
            NSString *titleStr=[StudentArray objectAtIndex:indexPath.row];
            if ([titleStr isEqualToString:@"Notes"]) {
                return screenRect.size.height*0.18;
            }else if ([titleStr isEqualToString:@"Learning"]) {
                return screenRect.size.height*0.18;
            }else if ([titleStr isEqualToString:@"Kudos"]) {
                return screenRect.size.height*0.18;
            }else if ([titleStr isEqualToString:@"Photos"]) {
                return screenRect.size.height*0.30;
            }
        }
    }else if ([appDelegate.tabStr isEqualToString:@"MESSAGES"]) {
        return screenRect.size.height*0.15;
    }else if ([appDelegate.tabStr isEqualToString:@"EVENTS"]) {
        if ([eventSelectArray containsObject:indexPath])
        {
        return screenRect.size.height*0.16;
        }else{
            return screenRect.size.height*0.12;
          }
    }else if ([appDelegate.tabStr isEqualToString:@"ATTENDANCE"]) {
        return screenRect.size.height*0.12;
    }
    else if ([appDelegate.tabStr isEqualToString:@"LEARNING"]) {
        return screenRect.size.height*0.12;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UILabel *lineLbl;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    UIFont * font1 =[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*.04];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    cell.textLabel.textColor=[UIColor whiteColor];
    
    UIImageView *  logoImg=[[UIImageView alloc]initWithFrame:CGRectMake(screenRect.size.width*.03,screenRect.size.height*.025,screenRect.size.width*.12,screenRect.size.height*.07)];
    [logoImg setImage:[UIImage imageNamed:@"upload_Picture.png"]];
    logoImg.layer.cornerRadius = logoImg.frame.size.width / 2;
    //[cell.contentView addSubview:logoImg];
    
    AsyncImageView *studentProfile=[[AsyncImageView alloc] initWithFrame:CGRectMake(screenRect.size.width*.03,screenRect.size.height*.025,screenRect.size.width*.12,screenRect.size.height*.07)];
    [studentProfile setBackgroundColor:[UIColor clearColor]];
    [studentProfile.layer setMasksToBounds:YES];
    studentProfile.clipsToBounds=YES;
    studentProfile.layer.cornerRadius = studentProfile.frame.size.width / 2;
    studentProfile.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"upload_Picture.png"]];
    [cell.contentView addSubview:studentProfile];
    
    UILabel *nameLbl;
    if ([appDelegate.tabStr isEqualToString:@"MAIN"]) {
        if ([appDelegate.userRole isEqualToString:@"Teacher"]) {
            StudentVO *studentvo=[[StudentVO alloc] init];
            studentvo=[StudentArray objectAtIndex:indexPath.row];
            [studentProfile loadImageFromURL:[NSURL URLWithString:studentvo.photo]];

//            NSURL *url = [NSURL URLWithString:studentvo.photo];
//            NSData *data = [NSData dataWithContentsOfURL:url];
//            UIImage *image = [UIImage imageWithData:data];
//            logoImg.image=image;
            
        nameLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.20,0, screenRect.size.width*.80,screenRect.size.height*0.12)];
        [nameLbl setText:[NSString stringWithFormat:@"%@ %@",studentvo.first_name,studentvo.last_name]];
        nameLbl.font=font1;
        [nameLbl setTextColor:[UIColor colorWithHexString:appDelegate.textfieldColor]];
        [cell.contentView addSubview:nameLbl];
        
        lineLbl=[[UILabel alloc] initWithFrame:CGRectMake(screenRect.size.width*0.05, screenRect.size.height*0.115, screenRect.size.width*0.90,1)];
        }else{
        [studentProfile removeFromSuperview];
        UILabel *dotlabel=[[UILabel alloc] initWithFrame:CGRectMake(20,12.5,10, 10)];
        [dotlabel setBackgroundColor:[UIColor whiteColor]];
        dotlabel.layer.cornerRadius = 5.0f;
        [dotlabel setClipsToBounds:YES];
        dotlabel.layer.borderWidth = 2.0f;
        dotlabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [cell.contentView addSubview:dotlabel];
        
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:
                                CGRectMake(40,5,100,25)];
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.font = [UIFont fontWithName:@"Open Sans" size:12];
        headerLabel.textColor=[UIColor grayColor];
        headerLabel.text=@"1 JAN";
        headerLabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:headerLabel];
            
        UILabel *nameLbl;
        nameLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.30,05, screenRect.size.width*.20,25)];
        [nameLbl setText:[NSString stringWithFormat:@"%@",[StudentArray objectAtIndex:indexPath.row]]];
        nameLbl.font=font1;
        nameLbl.textAlignment = NSTextAlignmentLeft;
        [nameLbl setTextColor:[UIColor colorWithHexString:appDelegate.textfieldColor]];
        [cell.contentView addSubview:nameLbl];
            
        UILabel *titleLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.30,screenRect.size.height*0.04, screenRect.size.width*.68,screenRect.size.height*0.08)];
        [titleLbl setText:[NSString stringWithFormat:@"Lorem Ipsum is simply dummy text of the printing anf typeseting industry. Lorem Ipsum has been the lorem Ipsum is simply dummy text of the printing anf typeseting industry. Lorem Ipsum has been the lorem Ipsum is simply dummy text of the printing anf typeseting industry. Lorem Ipsum has been the lorem Ipsum is simply dummy text of the printing anf typeseting industry."]];
        titleLbl.font=[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*.03];
        [titleLbl setTextColor:[UIColor grayColor]];
        titleLbl.lineBreakMode = NSLineBreakByWordWrapping;
        titleLbl.numberOfLines = 0;
        titleLbl.textAlignment = NSTextAlignmentLeft;
            
            if ([nameLbl.text isEqualToString:@"Notes"]) {
                [cell.contentView addSubview:titleLbl];
            }
            else if ([nameLbl.text isEqualToString:@"Learning"]) {
                [cell.contentView addSubview:titleLbl];
            }else if ([nameLbl.text isEqualToString:@"Kudos"]) {
                [cell.contentView addSubview:titleLbl];
            }else if ([nameLbl.text isEqualToString:@"Photos"]) {
                UIImageView *  logoImg=[[UIImageView alloc]initWithFrame:CGRectMake(screenRect.size.width*0.30,screenRect.size.height*0.05,screenRect.size.width*.60,screenRect.size.width*.36)];
                [logoImg setImage:[UIImage imageNamed:@"Gerbera-Color-Meaning.jpg"]];
                logoImg.layer.cornerRadius = 4.f;
                logoImg.layer.masksToBounds=YES;
                [cell.contentView addSubview:logoImg];
            }
        }
    }else if ([appDelegate.tabStr isEqualToString:@"MESSAGES"]) {
        nameLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.20,0, screenRect.size.width*.70,screenRect.size.height*0.04)];
        [nameLbl setText:[NSString stringWithFormat:@"On Leave"]];
        nameLbl.font=font1;
        [nameLbl setTextColor:[UIColor grayColor]];
        [cell.contentView addSubview:nameLbl];
        
        
        UILabel *titleLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.19,screenRect.size.height*0.04, screenRect.size.width*.80,screenRect.size.height*0.08)];
        [titleLbl setText:[NSString stringWithFormat:@"Lorem Ipsum is simply dummy text of the printing anf typeseting industry. Lorem Ipsum has been the lorem Ipsum is simply dummy text of the printing anf typeseting industry. Lorem Ipsum has been the lorem Ipsum is simply dummy text of the printing anf typeseting industry. Lorem Ipsum has been the lorem Ipsum is simply dummy text of the printing anf typeseting industry."]];
        titleLbl.font=[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*.03];
        [titleLbl setTextColor:[UIColor grayColor]];
        titleLbl.lineBreakMode = NSLineBreakByWordWrapping;
        titleLbl.numberOfLines = 0;
        [cell.contentView addSubview:titleLbl];

        UILabel *timeLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.20,screenRect.size.height*0.12, screenRect.size.width*.14,screenRect.size.height*0.03)];
        [timeLbl setText:[NSString stringWithFormat:@"Mon"]];
        timeLbl.font=[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*.025];
        [timeLbl setTextColor:[UIColor grayColor]];
        [cell.contentView addSubview:timeLbl];

        UIFont *customFontdregs = [UIFont fontWithName:@"FontAwesome" size:15];
        UIButton *replayBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.90,0,40,40)];
        //    [replayBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [replayBtn setTitle:@"\uf112" forState:UIControlStateNormal];
        [replayBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
        [replayBtn.titleLabel setFont:customFontdregs];
        [replayBtn setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:replayBtn];

        lineLbl=[[UILabel alloc] initWithFrame:CGRectMake(screenRect.size.width*0.05, screenRect.size.height*0.145, screenRect.size.width*0.90,1)];

    }else if ([appDelegate.tabStr isEqualToString:@"EVENTS"]) {
        nameLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.20,0, screenRect.size.width*.55,screenRect.size.height*0.04)];
        [nameLbl setText:[NSString stringWithFormat:@"lorem ipsum dolor"]];
        nameLbl.font=font1;
        [nameLbl setTextColor:[UIColor blackColor]];
        [cell.contentView addSubview:nameLbl];
        
        UILabel *timeLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.20,screenRect.size.height*0.04, screenRect.size.width*.55,screenRect.size.height*0.03)];
        [timeLbl setText:[NSString stringWithFormat:@"17 Dec 2017"]];
        timeLbl.font=[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*.025];
        [timeLbl setTextColor:[UIColor grayColor]];
        [cell.contentView addSubview:timeLbl];
        
        UIButton *ArrowBtn;
        if ([appDelegate.userRole isEqualToString:@"Teacher"]) {
        UIFont *customFontdregs = [UIFont fontWithName:@"FontAwesome" size:15];
        ArrowBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.90,0,40,40)];
        //    [replayBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [ArrowBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
        [ArrowBtn.titleLabel setFont:customFontdregs];
        [ArrowBtn setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:ArrowBtn];

        if ([eventSelectArray containsObject:indexPath])
        {
            [ArrowBtn setTitle:@"\uf078" forState:UIControlStateNormal];
           UIButton* acceptedBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.20,screenRect.size.height*.08,screenRect.size.width*.08,screenRect.size.width*.08)];
            acceptedBtn.layer.cornerRadius = screenRect.size.width*.04f;
            [acceptedBtn setTitle:@"5" forState:UIControlStateNormal];
            [acceptedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            acceptedBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            acceptedBtn.titleLabel.font= [UIFont fontWithName:@"OpenSans-Bold" size:15];
            [acceptedBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
            //[addContent addTarget:self action:@selector(menuView:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:acceptedBtn];

            UILabel*acceptedlable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.30,screenRect.size.height*.08,screenRect.size.width*.28,screenRect.size.width*.08)];
            acceptedlable.textAlignment = NSTextAlignmentLeft;
            acceptedlable.text=@"Accepted";
            acceptedlable.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
            [acceptedlable setBackgroundColor:[UIColor clearColor]];
            acceptedlable.font=[UIFont fontWithName:@"Open Sans" size:18.0f];
            [cell.contentView addSubview:acceptedlable];

            UIButton* declinedBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.60,screenRect.size.height*.08,screenRect.size.width*.08,screenRect.size.width*.08)];
            declinedBtn.layer.cornerRadius = screenRect.size.width*.04f;
            [declinedBtn setTitle:@"2" forState:UIControlStateNormal];
            [declinedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            declinedBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            declinedBtn.titleLabel.font= [UIFont fontWithName:@"OpenSans-Bold" size:15];
            [declinedBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
            //[addContent addTarget:self action:@selector(menuView:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:declinedBtn];

            UILabel*declinedlable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.70,screenRect.size.height*.08,screenRect.size.width*.28,screenRect.size.width*.08)];
            declinedlable.textAlignment = NSTextAlignmentLeft;
            declinedlable.text=@"Declined";
            declinedlable.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
            [declinedlable setBackgroundColor:[UIColor clearColor]];
            declinedlable.font=[UIFont fontWithName:@"Open Sans" size:18.0f];
            [cell.contentView addSubview:declinedlable];

        lineLbl=[[UILabel alloc] initWithFrame:CGRectMake(screenRect.size.width*0.05, screenRect.size.height*0.155, screenRect.size.width*0.90,1)];
        }else{
            [ArrowBtn setTitle:@"\uf077" forState:UIControlStateNormal];
            lineLbl=[[UILabel alloc] initWithFrame:CGRectMake(screenRect.size.width*0.05, screenRect.size.height*0.115, screenRect.size.width*0.90,1)];
        }
        }else{
            UIFont *customFontdregs = [UIFont fontWithName:@"FontAwesome" size:15];
            UIButton* acceptedBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.75,screenRect.size.height*.02,screenRect.size.width*.08,screenRect.size.width*.08)];
            acceptedBtn.layer.cornerRadius = screenRect.size.width*.04f;
            [acceptedBtn setTitle:@"\uf00c" forState:UIControlStateNormal];
            [acceptedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            acceptedBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            acceptedBtn.titleLabel.font= customFontdregs;
            [acceptedBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
            //[addContent addTarget:self action:@selector(menuView:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:acceptedBtn];
            
            UILabel*acceptedlable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.75,screenRect.size.height*.08,screenRect.size.width*.28,screenRect.size.width*.06)];
            acceptedlable.textAlignment = NSTextAlignmentLeft;
            acceptedlable.text=@"Accepted";
            acceptedlable.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
            [acceptedlable setBackgroundColor:[UIColor clearColor]];
            acceptedlable.font=[UIFont fontWithName:@"Open Sans" size:10.0f];
            [cell.contentView addSubview:acceptedlable];
            
            UIButton* declinedBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.875,screenRect.size.height*.02,screenRect.size.width*.08,screenRect.size.width*.08)];
            declinedBtn.layer.cornerRadius = screenRect.size.width*.04f;
            [declinedBtn setTitle:@"\uf00d" forState:UIControlStateNormal];
            [declinedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            declinedBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            declinedBtn.titleLabel.font= customFontdregs;
            [declinedBtn setBackgroundColor:[UIColor lightGrayColor]];
            //[addContent addTarget:self action:@selector(menuView:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:declinedBtn];
            
            UILabel*declinedlable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.875,screenRect.size.height*.08,screenRect.size.width*.28,screenRect.size.width*.06)];
            declinedlable.textAlignment = NSTextAlignmentLeft;
            declinedlable.text=@"Declined";
            declinedlable.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
            [declinedlable setBackgroundColor:[UIColor clearColor]];
            declinedlable.font=[UIFont fontWithName:@"Open Sans" size:10.0f];
            [cell.contentView addSubview:declinedlable];
            lineLbl=[[UILabel alloc] initWithFrame:CGRectMake(screenRect.size.width*0.05, screenRect.size.height*0.115, screenRect.size.width*0.90,1)];
        }
    }else if ([appDelegate.tabStr isEqualToString:@"LEARNING"]) {
        nameLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.20,0, screenRect.size.width*.55,screenRect.size.height*0.04)];
        [nameLbl setText:[NSString stringWithFormat:@"lorem ipsum dolor"]];
        nameLbl.font=font1;
        [nameLbl setTextColor:[UIColor blackColor]];
        [cell.contentView addSubview:nameLbl];
        
        UILabel *timeLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.25,screenRect.size.height*0.04, screenRect.size.width*.55,screenRect.size.height*0.03)];
        [timeLbl setText:[NSString stringWithFormat:@"17 Dec 2017"]];
        timeLbl.font=[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*.025];
        [timeLbl setTextColor:[UIColor grayColor]];
        [cell.contentView addSubview:timeLbl];

        UIFont *customFont = [UIFont fontWithName:@"MaterialIcons-Regular" size:15];
        UIButton *eventBtns=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.20,screenRect.size.height*.04,20,20)];
//        [eventBtns addTarget:self action:@selector(EventAction) forControlEvents:UIControlEventTouchUpInside];
        [eventBtns setTitle:@"\uE878" forState:UIControlStateNormal];
        [eventBtns setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [eventBtns.titleLabel setFont:customFont];
        [eventBtns setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:eventBtns];

        lineLbl=[[UILabel alloc] initWithFrame:CGRectMake(screenRect.size.width*0.05, screenRect.size.height*0.115, screenRect.size.width*0.90,1)];

    }else    if ([appDelegate.tabStr isEqualToString:@"ATTENDANCE"]) {
        UIFont * font1 =[UIFont fontWithName:@"OpenSans-Bold" size:screenRect.size.width*.04];
        UIFont * font2 =[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*.03];

        if (indexPath.row==0) {
            
           UILabel* CheckInLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.20,screenRect.size.height*0.01, screenRect.size.width*.60,screenRect.size.height*0.05)];
            [CheckInLbl setText:@"Check In"];
            CheckInLbl.font=font1;
            [CheckInLbl setTextColor:[UIColor colorWithHexString:appDelegate.textfieldColor]];
            CheckInLbl.textAlignment = NSTextAlignmentLeft;
            [cell.contentView addSubview:CheckInLbl];

        UILabel *CheckOutLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.20,screenRect.size.height*0.065, screenRect.size.width*.60,screenRect.size.height*0.04)];
        [CheckOutLbl setText:@"PlaySchool"];
        CheckOutLbl.font=font2;
        [CheckOutLbl setTextColor:[UIColor lightGrayColor]];
            CheckOutLbl.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:CheckOutLbl];
        }else{
            UILabel* CheckInLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.20,screenRect.size.height*0.01, screenRect.size.width*.60,screenRect.size.height*0.05)];
            [CheckInLbl setText:@"Check Out"];
            CheckInLbl.font=font1;
            [CheckInLbl setTextColor:[UIColor colorWithHexString:appDelegate.textfieldColor]];
            CheckInLbl.textAlignment = NSTextAlignmentLeft;
            [cell.contentView addSubview:CheckInLbl];
            
            UILabel *CheckOutLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.20,screenRect.size.height*0.065, screenRect.size.width*.60,screenRect.size.height*0.04)];
            [CheckOutLbl setText:@"PlaySchool"];
            CheckOutLbl.font=font2;
            [CheckOutLbl setTextColor:[UIColor lightGrayColor]];
            CheckOutLbl.textAlignment = NSTextAlignmentLeft;
            [cell.contentView addSubview:CheckOutLbl];
        }
        
        UILabel* timeLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.80,screenRect.size.height*0.01, screenRect.size.width*.15,screenRect.size.height*0.05)];
        [timeLbl setText:@"5:00 PM"];
        timeLbl.font=[UIFont fontWithName:@"OpenSans-Bold" size:screenRect.size.width*.03];
        [timeLbl setTextColor:[UIColor colorWithHexString:appDelegate.textfieldColor]];
        timeLbl.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:timeLbl];

        lineLbl=[[UILabel alloc] initWithFrame:CGRectMake(screenRect.size.width*0.05, screenRect.size.height*0.115, screenRect.size.width*0.90,1)];
    }

    [lineLbl setBackgroundColor:[UIColor colorWithHexString:@"a6ccc6"]];
    [cell.contentView addSubview:lineLbl];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.backgroundColor=[UIColor clearColor];
    [cell setBackgroundColor:[UIColor clearColor]];
    //Your main thread code goes in here
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([appDelegate.tabStr isEqualToString:@"MAIN"]) {
        if ([appDelegate.userRole isEqualToString:@"Teacher"]) {
        ActivityDetalisViewController *detalis=[[ActivityDetalisViewController alloc] initWithNibName:@"ActivityDetalisViewController" bundle:nil];
        [self.navigationController pushViewController:detalis animated:YES];
        }
    }
    if ([appDelegate.tabStr isEqualToString:@"MESSAGES"]) {
        MessageViewController *chat=[[MessageViewController alloc] initWithNibName:@"MessageViewController" bundle:nil];
        [self.navigationController pushViewController:chat animated:YES];
    }
    if ([appDelegate.tabStr isEqualToString:@"EVENTS"]) {
        if ([appDelegate.userRole isEqualToString:@"Teacher"]) {
        if ([eventSelectArray containsObject:indexPath])
        {
            [eventSelectArray removeObject:indexPath];
        }else{
            [eventSelectArray addObject:indexPath];
        }
        [tableViewMain reloadData];
        }
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return AttendanceArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    UIImageView *mainView;
    [mainView removeFromSuperview];
    mainView=[[UIImageView alloc]initWithFrame:CGRectMake(5,0,screenRect.size.width*.20,screenRect.size.height*.12)];
    [mainView setImage:[UIImage imageNamed:@"user.png"]];
    mainView.layer.cornerRadius=5;
    mainView.clipsToBounds = YES;
    [cell.contentView addSubview:mainView];
    
    if ([attendSelectArray containsObject:indexPath])
    {
        UIFont *customFontdregs = [UIFont fontWithName:@"MaterialIcons-Regular" size:40];
        UILabel*acceptedlable=[[UILabel alloc]initWithFrame:CGRectMake(5,0,screenRect.size.width*.20,screenRect.size.height*.12)];
        [acceptedlable removeFromSuperview];
        acceptedlable.textAlignment = NSTextAlignmentCenter;
        acceptedlable.layer.cornerRadius=screenRect.size.height*.06;
        acceptedlable.clipsToBounds = YES;
        acceptedlable.text=@"\uE876";
        acceptedlable.textColor=[UIColor whiteColor];
        [acceptedlable setBackgroundColor:[UIColor clearColor]];
        acceptedlable.font=customFontdregs;
        [cell.contentView addSubview:acceptedlable];
    }
    UIFont * font1 =[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*.04];
    UILabel *nameLbl=[[UILabel alloc]initWithFrame:CGRectMake(5,screenRect.size.height*.12, screenRect.size.width*.20,screenRect.size.height*0.03)];
    [nameLbl removeFromSuperview];
    [nameLbl setText:[NSString stringWithFormat:@"%@",[AttendanceArray objectAtIndex:indexPath.row]]];
    nameLbl.font=font1;
    nameLbl.textAlignment = NSTextAlignmentCenter;
    [nameLbl setTextColor:[UIColor colorWithHexString:appDelegate.textfieldColor]];
    [cell.contentView addSubview:nameLbl];

    cell.backgroundColor=[UIColor clearColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return CGSizeMake(screenRect.size.width*.22, screenRect.size.height*.17);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select section %ld select intex  %ld",(long)indexPath.section,(long)indexPath.row);
    if ([appDelegate.userRole isEqualToString:@"Teacher"]) {
        if ([attendSelectArray containsObject:indexPath])
        {
            [attendSelectArray removeObject:indexPath];
        }else{
            [attendSelectArray addObject:indexPath];
        }
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        [_collectionView removeFromSuperview];
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width,screenRect.size.height*0.80) collectionViewLayout:layout];
        [_collectionView setDataSource:self];
        [_collectionView setDelegate:self];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        [messageView addSubview:_collectionView];
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0,0,0,0); // top, left, bottom, right
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
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
