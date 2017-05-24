//
//  AdminToolViewController.m
//  School
//
//  Created by Infinitum on 24/05/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import "AdminToolViewController.h"
#import "UIColor+Expanded.h"
#import "MainViewController.h"
#import "AdminDetalisViewController.h"
@interface AdminToolViewController ()

@end

@implementation AdminToolViewController
@synthesize appDelegate,mainArray,tableViewMain;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    appDelegate=[[UIApplication sharedApplication] delegate];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *titlelable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.18,15,screenRect.size.width*.60,40)];
    titlelable.textAlignment = NSTextAlignmentLeft;
    titlelable.text=@"Admin Tools";
    titlelable.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
    [titlelable setBackgroundColor:[UIColor clearColor]];
    titlelable.font=[UIFont fontWithName:@"Open Sans" size:18.0f];
    [self.view addSubview:titlelable];
    
    UIFont *customFontdregs = [UIFont fontWithName:@"FontAwesome" size:20];
    UIFont *customFont = [UIFont fontWithName:@"MaterialIcons-Regular" size:25];
    UIFont *lblFont = [UIFont fontWithName:@"OpenSans-Bold" size:12];

    UIButton * leftBackBtn=[[UIButton alloc]initWithFrame:CGRectMake(10,25,screenRect.size.width*.13,screenRect.size.height*.035)];
    [leftBackBtn addTarget:self action:@selector(CancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftBackBtn setTitle:@"\uE5C4" forState:UIControlStateNormal];
    [leftBackBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [leftBackBtn.titleLabel setFont:customFont];
    [leftBackBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:leftBackBtn];
    
    
    UIButton *noteBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.096,screenRect.size.height*.12,screenRect.size.width*.13,screenRect.size.width*.13)];
    noteBtn.layer.cornerRadius = screenRect.size.width*.065f;
    [noteBtn setTitle:@"2" forState:UIControlStateNormal];
    [noteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    noteBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    noteBtn.titleLabel.font= [UIFont fontWithName:@"OpenSans-Bold" size:20];
    [noteBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    //[noteBtn addTarget:self action:@selector(menuView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:noteBtn];

    UILabel *notelable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.096,(screenRect.size.height*.12+screenRect.size.width*.14),screenRect.size.width*.13,screenRect.size.height*.05)];
    notelable.textAlignment = NSTextAlignmentLeft;
    notelable.text=@"NOTE";
    notelable.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
    [notelable setBackgroundColor:[UIColor clearColor]];
    notelable.font=lblFont;
    [self.view addSubview:notelable];

    UIButton *selectedBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.322,screenRect.size.height*.12,screenRect.size.width*.13,screenRect.size.width*.13)];
    selectedBtn.layer.cornerRadius = screenRect.size.width*.065f;
    [selectedBtn setTitle:@"8" forState:UIControlStateNormal];
    [selectedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    selectedBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    selectedBtn.titleLabel.font= [UIFont fontWithName:@"OpenSans-Bold" size:20];
    [selectedBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    //[selectedBtn addTarget:self action:@selector(menuView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectedBtn];

    UILabel *selectlable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.30,(screenRect.size.height*.12+screenRect.size.width*.14),screenRect.size.width*.18,screenRect.size.height*.05)];
    selectlable.textAlignment = NSTextAlignmentLeft;
    selectlable.text=@"SELECTED";
    selectlable.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
    [selectlable setBackgroundColor:[UIColor clearColor]];
    selectlable.font=lblFont;
    [self.view addSubview:selectlable];

    UIButton *parentsBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.548,screenRect.size.height*.12,screenRect.size.width*.13,screenRect.size.width*.13)];
    parentsBtn.layer.cornerRadius = screenRect.size.width*.065f;
    [parentsBtn setTitle:@"1" forState:UIControlStateNormal];
    [parentsBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    parentsBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    parentsBtn.titleLabel.font= [UIFont fontWithName:@"OpenSans-Bold" size:20];
    [parentsBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    //[parentsBtn addTarget:self action:@selector(menuView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:parentsBtn];

    UILabel *parentlable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.53,(screenRect.size.height*.12+screenRect.size.width*.14),screenRect.size.width*.18,screenRect.size.height*.05)];
    parentlable.textAlignment = NSTextAlignmentLeft;
    parentlable.text=@"PARENTS";
    parentlable.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
    [parentlable setBackgroundColor:[UIColor clearColor]];
    parentlable.font=lblFont;
    [self.view addSubview:parentlable];

    UIButton *staffBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.774,screenRect.size.height*.12,screenRect.size.width*.13,screenRect.size.width*.13)];
    staffBtn.layer.cornerRadius = screenRect.size.width*.065f;
    [staffBtn setTitle:@"2" forState:UIControlStateNormal];
    [staffBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    staffBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    staffBtn.titleLabel.font= [UIFont fontWithName:@"OpenSans-Bold" size:20];
    [staffBtn setBackgroundColor:[UIColor colorWithHexString:@"#252428"]];
    //[staffBtn addTarget:self action:@selector(menuView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:staffBtn];

    UILabel *satfflable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.78,(screenRect.size.height*.12+screenRect.size.width*.14),screenRect.size.width*.13,screenRect.size.height*.05)];
    satfflable.textAlignment = NSTextAlignmentLeft;
    satfflable.text=@"STAFF";
    satfflable.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
    [satfflable setBackgroundColor:[UIColor clearColor]];
    satfflable.font=lblFont;
    [self.view addSubview:satfflable];

    mainArray=[[NSMutableArray alloc]initWithObjects:@"Room Check",@"Room Check",@"Room Check",@"Room Check", nil];
    [tableViewMain removeFromSuperview];
    tableViewMain=[[UITableView alloc]init];
    tableViewMain.frame=CGRectMake(0,screenRect.size.height*.30,screenRect.size.width,screenRect.size.height*.70);
    tableViewMain.dataSource = self;
    tableViewMain.delegate = self;
    [tableViewMain setBackgroundColor:[UIColor clearColor]];
    self.tableViewMain.separatorColor = [UIColor clearColor];
    tableViewMain.separatorInset = UIEdgeInsetsZero;
    tableViewMain.layoutMargins = UIEdgeInsetsZero;
    [self.view addSubview:tableViewMain];

}
-(IBAction)CancelAction:(id)sender{
    MainViewController *mainvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    appDelegate.index=0;
    [self.navigationController pushViewController:mainvc animated:YES];
}
#pragma marl - UITableView Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mainArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.height*0.07;
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
    
    UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(screenRect.size.width*0.10,0,screenRect.size.width*0.80,screenRect.size.height*0.065)];
    [bgView setBackgroundColor:[UIColor colorWithHexString:appDelegate.textfieldColor]];
    bgView.layer.cornerRadius=15.f;
    bgView.layer.masksToBounds = YES;
    [cell.contentView addSubview:bgView];

    UIFont *customFont = [UIFont fontWithName:@"MaterialIcons-Regular" size:25];
    UILabel *checkBtn=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.15,0,40,40)];
    [checkBtn setText:[NSString stringWithFormat:@"\uE862"]];
    checkBtn.font=customFont;
    [checkBtn setBackgroundColor:[UIColor clearColor]];
    [checkBtn setTextColor:[UIColor whiteColor]];
    [cell.contentView addSubview:checkBtn];
    
    UILabel *nameLbl;
    nameLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.25,0, screenRect.size.width*.60,screenRect.size.height*0.07)];
    [nameLbl setText:[NSString stringWithFormat:@"%@",[mainArray objectAtIndex:indexPath.row]]];
    nameLbl.font=font1;
    [nameLbl setTextColor:[UIColor whiteColor]];
    [cell.contentView addSubview:nameLbl];
    
    
    tableView.backgroundColor=[UIColor clearColor];
    [cell setBackgroundColor:[UIColor clearColor]];
    //Your main thread code goes in here
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AdminDetalisViewController *Details=[[AdminDetalisViewController alloc] initWithNibName:@"AdminDetalisViewController" bundle:nil];
    [self.navigationController pushViewController:Details animated:YES];
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
