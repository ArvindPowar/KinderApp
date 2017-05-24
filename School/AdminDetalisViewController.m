//
//  AdminDetalisViewController.m
//  School
//
//  Created by Infinitum on 24/05/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import "AdminDetalisViewController.h"
#import "UIColor+Expanded.h"

@interface AdminDetalisViewController ()

@end

@implementation AdminDetalisViewController
@synthesize appDelegate,mainArray,tableViewMain;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    appDelegate=[[UIApplication sharedApplication] delegate];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *titlelable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.18,15,screenRect.size.width*.60,40)];
    titlelable.textAlignment = NSTextAlignmentLeft;
    titlelable.text=@"Rooms";
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
    
    UIButton * rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.85,25,screenRect.size.width*.13,screenRect.size.height*.035)];
//    [rightBtn addTarget:self action:@selector(CancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:@"\uE145" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [rightBtn.titleLabel setFont:customFont];
    [rightBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:rightBtn];

    mainArray=[[NSMutableArray alloc]initWithObjects:@"Room Check",@"Room Check",@"Room Check",@"Room Check", nil];
    [tableViewMain removeFromSuperview];
    tableViewMain=[[UITableView alloc]init];
    tableViewMain.frame=CGRectMake(0,screenRect.size.height*.12,screenRect.size.width,screenRect.size.height*.88);
    tableViewMain.dataSource = self;
    tableViewMain.delegate = self;
    [tableViewMain setBackgroundColor:[UIColor clearColor]];
    self.tableViewMain.separatorColor = [UIColor clearColor];
    tableViewMain.separatorInset = UIEdgeInsetsZero;
    tableViewMain.layoutMargins = UIEdgeInsetsZero;
    [self.view addSubview:tableViewMain];

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
    
    
    UILabel *nameLbl;
    nameLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.10,0, screenRect.size.width*.60,screenRect.size.height*0.07)];
    [nameLbl setText:[NSString stringWithFormat:@"%@",[mainArray objectAtIndex:indexPath.row]]];
    nameLbl.font=font1;
    [nameLbl setTextColor:[UIColor colorWithHexString:appDelegate.textfieldColor]];
    [cell.contentView addSubview:nameLbl];
    
    UIFont *customFont = [UIFont fontWithName:@"MaterialIcons-Regular" size:25];
    UIButton * editBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.75,0,40,40)];
//    [editBtn addTarget:self action:@selector(CancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [editBtn setTitle:@"\uE150" forState:UIControlStateNormal];
    [editBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [editBtn.titleLabel setFont:customFont];
    [editBtn setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:editBtn];

    UIButton * deleteBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.85,0,40,40)];
//    [deleteBtn addTarget:self action:@selector(CancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [deleteBtn setTitle:@"\uE872" forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [deleteBtn.titleLabel setFont:customFont];
    [deleteBtn setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:deleteBtn];

    lineLbl=[[UILabel alloc] initWithFrame:CGRectMake(screenRect.size.width*0.05, screenRect.size.height*0.065, screenRect.size.width*0.90,1)];
    [lineLbl setBackgroundColor:[UIColor colorWithHexString:@"a6ccc6"]];
    [cell.contentView addSubview:lineLbl];

    tableView.backgroundColor=[UIColor clearColor];
    [cell setBackgroundColor:[UIColor clearColor]];
    //Your main thread code goes in here
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)CancelAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
