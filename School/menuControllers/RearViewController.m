
/*

 Copyright (c) 2013 Joan Lluch <joan.lluch@sweetwilliamsl.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 Original code:
 Copyright (c) 2011, Philip Kluz (Philip.Kluz@zuui.org)
 
*/
#import "RearViewController.h"
#import "UIColor+Expanded.h"
#import "SWRevealViewController.h"
#import "MainViewController.h"
#import "ViewController.h"
#import "MainNavigationController.h"
#import "UIImage+FontAwesome.h"
#import "NSString+FontAwesome.h"

@interface RearViewController()

@end

@implementation RearViewController

@synthesize rearTableView = _rearTableView;
@synthesize appDelegate,usernameLabel;

#pragma mark - View lifecycle


- (void)viewDidLoad
{
	[super viewDidLoad];
    appDelegate=[[UIApplication sharedApplication] delegate];
    self.view.backgroundColor=[UIColor colorWithHexString:@"03687F"];
	self.rearTableView.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBarHidden=YES;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UIImageView *  bgback=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,screenRect.size.width, 135)];
    [bgback setImage:[UIImage imageNamed:@"nav_menu_header_bg.jpg"]];
    [self.view addSubview:bgback];

    UIImageView *  logoImg=[[UIImageView alloc]initWithFrame:CGRectMake(20,20, 45,45)];
    [logoImg setImage:[UIImage imageNamed:@"upload_Picture.png"]];
    [self.view addSubview:logoImg];

    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *name=[prefs objectForKey:@"name"];
    NSString *email=[prefs objectForKey:@"email"];
    NSString *comStr=[NSString stringWithFormat:@"%@\n%@",name,email];
    NSMutableAttributedString* string = [[NSMutableAttributedString alloc]initWithString:comStr];
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Open Sans" size:16] range:NSMakeRange(0, name.length)];
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Open Sans" size:12] range:NSMakeRange(name.length, email.length+1)];

    usernameLabel =[[UILabel alloc]initWithFrame:CGRectMake(20,70,200, 55)];
    usernameLabel.textAlignment = NSTextAlignmentCenter;
    usernameLabel.textColor=[UIColor whiteColor];
    usernameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    usernameLabel.numberOfLines = 0;
    usernameLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:usernameLabel];
    [usernameLabel setAttributedText: string];


    UIFont *customFontdregs = [UIFont fontWithName:@"Open Sans" size:screenRect.size.width*0.03];
    UIButton *editBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.55,25,screenRect.size.width*.20,screenRect.size.height*.04)];
//    [editBtn addTarget:self action:@selector(EditAction:) forControlEvents:UIControlEventTouchUpInside];
    [editBtn setTitle:@"Edit Profile" forState:UIControlStateNormal];
    [editBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [editBtn.titleLabel setFont:customFontdregs];
    [self.view addSubview:editBtn];

    NSString * appVersionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSLog(@"appVersionString:-%@",appVersionString);
    
    UILabel *versionLbl = [[UILabel alloc] init];
    [versionLbl setFrame:CGRectMake(screenRect.size.width*0.01,screenRect.size.height*0.95,screenRect.size.width*0.40,screenRect.size.height*0.05)];
    versionLbl.textAlignment = NSTextAlignmentLeft;
    [versionLbl setText:[NSString stringWithFormat:@"V %@",appVersionString]];
    [versionLbl setTextColor: [self colorFromHexString:@"#03687f"]];
    UIFont * font11 =[UIFont fontWithName:@"OpenSans-ExtraBold" size:12.0f];
    versionLbl.font=font11;
    //[self.view addSubview:versionLbl];
}
- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
- (BOOL)shouldAutorotate
{
    return YES;
}


#pragma marl - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSInteger row = indexPath.row;
	
	if (nil == cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.textLabel.textColor=[UIColor whiteColor];
	}
    
    UIImageView *menuItemImageView=[[UIImageView alloc] initWithFrame:CGRectMake(10,10,35,35)];
    UILabel *pictureLbl=[[UILabel alloc]initWithFrame:CGRectMake(10,10,35,35)];
    pictureLbl.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
    UIFont *customFontdregs = [UIFont fontWithName:@"MaterialIcons-Regular" size:30];
    pictureLbl.font =customFontdregs;

    UILabel *menuItemTextLabel=[[UILabel alloc] initWithFrame:CGRectMake(60, 5, 250, 45)];
    menuItemTextLabel.font = [UIFont fontWithName:@"Open Sans" size:16];
    menuItemTextLabel.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
    cell.backgroundColor=[UIColor clearColor];
    if (row == 0)
    {
        menuItemImageView.image=[UIImage imageNamed:@"ionicons_2-0-1_android-compass_40_4_404040_none.png"];
        pictureLbl.text = @"\uE88A";
        menuItemTextLabel.text = @"Home";
    }else if (row == 1)
	{
        menuItemImageView.image=[UIImage imageNamed:@"ionicons_2-0-1_android-compass_40_4_404040_none.png"];
        pictureLbl.text = @"\uE87A";
        if ([appDelegate.userRole isEqualToString:@"Teacher"]) {
		menuItemTextLabel.text = @"Admin Tools";
        }else{
            menuItemTextLabel.text = @"Getting Started";
        }
    }
	else if (row == 2)
	{
        menuItemImageView.image=[UIImage imageNamed:@"ionicons_2-0-1_android-settings_40_4_404040_none.png"];
        pictureLbl.text = @"\uE8B8";
        menuItemTextLabel.text = @"Settings";
    }else if (row == 3)
    {
        menuItemImageView.image=[UIImage imageNamed:@"ionicons_2-0-1_help-circled_40_4_404040_none.png"];
        pictureLbl.text = @"\uE887";
        menuItemTextLabel.text = @"Help";
    }else if (row == 4)
    {
        menuItemImageView.image=[UIImage imageNamed:@"material-icons_3-0-1_rate-review_40_4_404040_none.png"];
        pictureLbl.text = @"\uE560";
        menuItemTextLabel.text = @"Send Feedback";
    }else if (row == 5)
    {
        UIFont *customFontdregs = [UIFont fontWithName:@"FontAwesome" size:30];
        pictureLbl.font =customFontdregs;
        menuItemImageView.image=[UIImage imageNamed:@"log_out.png"];
        pictureLbl.text = @"\uf090";
        menuItemTextLabel.text = @"Sign Out";
    }
//    [cell.contentView addSubview:menuItemImageView];
    [cell.contentView addSubview:menuItemTextLabel];
    [cell.contentView addSubview:pictureLbl];

	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Grab a handle to the reveal controller, as if you'd do with a navigtion controller via self.navigationController.
    NSInteger row = indexPath.row;
    MainViewController *mainvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    appDelegate.index=(int)row;
    MainNavigationController *navController = [[MainNavigationController alloc] initWithRootViewController:mainvc];
    navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [[[UIApplication sharedApplication] delegate] window].rootViewController=navController;
    [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog( @"%@: REAR", NSStringFromSelector(_cmd));
    [_rearTableView reloadData];
}

@end
