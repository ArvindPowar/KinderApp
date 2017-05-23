   //
//  LearningViewController.m
//  School
//
//  Created by Infinitum on 29/04/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import "LearningViewController.h"
#import "UIColor+Expanded.h"
@interface LearningViewController ()

@end

@implementation LearningViewController
@synthesize appDelegate,menuArray,sidemenuView,menunameBtn,mainArray,tableViewMain,categorySelectArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    appDelegate=[[UIApplication sharedApplication] delegate];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setFrame:CGRectMake(screenRect.size.width*.18,25,screenRect.size.width*.60, screenRect.size.height*0.04)];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.text=@"Learning";
    [titleLabel setTextColor: [UIColor blackColor]];
    UIFont * font1s =[UIFont fontWithName:@"OpenSans-Bold" size:16.0f];
    titleLabel.font=font1s;
    [self.view addSubview:titleLabel];
    
    UIFont *customFontdregs = [UIFont fontWithName:@"FontAwesome" size:20];
    UIFont *customFont = [UIFont fontWithName:@"MaterialIcons-Regular" size:25];
    
    UIButton * leftBackBtn=[[UIButton alloc]initWithFrame:CGRectMake(10,25,screenRect.size.width*.13,screenRect.size.height*.035)];
    [leftBackBtn addTarget:self action:@selector(CancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftBackBtn setTitle:@"\uE5C4" forState:UIControlStateNormal];
    [leftBackBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [leftBackBtn.titleLabel setFont:customFont];
    [leftBackBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:leftBackBtn];
    
    UIButton * resetBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.80,25,screenRect.size.width*.15,screenRect.size.height*.04)];
    //    [resetBtn addTarget:self action:@selector(CancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [resetBtn setTitle:@"Reset" forState:UIControlStateNormal];
    [resetBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [resetBtn.titleLabel setFont:[UIFont fontWithName:@"Open Sans" size:14.0f]];
    [resetBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:resetBtn];

    UIView *bgView=[[UIView alloc]init];
    bgView.frame=CGRectMake(0,screenRect.size.height*.10,screenRect.size.width,screenRect.size.height*.07);
    [bgView setBackgroundColor:[UIColor colorWithHexString:@"f7f7f7"]];
    [self.view addSubview:bgView];

    int width=screenRect.size.width*0.10;
    for (int count=0; count<5; count++) {
        UIImageView *  logoImg=[[UIImageView alloc]initWithFrame:CGRectMake(width,screenRect.size.height*.115,screenRect.size.width*.07,screenRect.size.width*.07)];
        [logoImg setImage:[UIImage imageNamed:@"boy.jpg"]];
        logoImg.layer.cornerRadius = logoImg.frame.size.width / 2;
        logoImg.layer.masksToBounds=YES;
        [self.view addSubview:logoImg];
        width=width+screenRect.size.width*.09;
    }

    UIButton * plusBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.90,screenRect.size.height*.12,screenRect.size.width*.07,screenRect.size.width*.07)];
    //    [plusBtn addTarget:self action:@selector(CancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [plusBtn setTitle:@"+" forState:UIControlStateNormal];
    [plusBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [plusBtn.titleLabel setFont:[UIFont fontWithName:@"OpenSans-Bold" size:16.0f]];
    [plusBtn setBackgroundColor:[UIColor lightGrayColor]];
    plusBtn.layer.cornerRadius = screenRect.size.width*.07 / 2;
    plusBtn.layer.masksToBounds=YES;
    [self.view addSubview:plusBtn];

    _selectIndex=1;
    [self sideMenuUI];
    categorySelectArray=[[NSMutableArray alloc]init];
    mainArray=[[NSMutableArray alloc]initWithObjects:@"Arts",@"Coding",@"Cognitive",@"Communication",@"Fine Motor", nil];
    [tableViewMain removeFromSuperview];
    tableViewMain=[[UITableView alloc]init];
    tableViewMain.frame=CGRectMake(screenRect.size.width*.32,screenRect.size.height*.20,screenRect.size.width*.68,screenRect.size.height*.80);
    tableViewMain.dataSource = self;
    tableViewMain.delegate = self;
    [tableViewMain setBackgroundColor:[UIColor clearColor]];
    self.tableViewMain.separatorColor = [UIColor clearColor];
    tableViewMain.separatorInset = UIEdgeInsetsZero;
    tableViewMain.layoutMargins = UIEdgeInsetsZero;
    [self.view addSubview:tableViewMain];

}

-(void)sideMenuUI{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
        menuArray=[NSMutableArray arrayWithObjects:@"       Category",@"       Scale",@"       Progress",@"       Staff Only",@"       Photo",@"       Notes", nil];
    [sidemenuView removeFromSuperview];
    sidemenuView=[[UIView alloc]initWithFrame:CGRectMake(0,screenRect.size.height*.20, screenRect.size.width*.32,screenRect.size.height*.80)];
    [sidemenuView setBackgroundColor:[UIColor colorWithHexString:@"f7f7f7"]];
    
    int height=0;
    for (int count=1; count<[menuArray count]+1; count++){
        NSString *titleStr=[menuArray objectAtIndex:count-1];
        
        menunameBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, height,screenRect.size.width*0.32, screenRect.size.height*0.07-1)];
        if (_selectIndex==count) {
            [menunameBtn setBackgroundColor:[UIColor whiteColor]];
        }else{
            [menunameBtn setBackgroundColor:[UIColor colorWithHexString:@"f7f7f7"]];
        }
        [menunameBtn setTitle:titleStr forState:UIControlStateNormal];
        menunameBtn.tag=count;
        [menunameBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
        [menunameBtn.titleLabel setFont:[UIFont fontWithName:@"Open Sans" size:14.0f]];
        [menunameBtn addTarget:self action:@selector(menuBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        menunameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [sidemenuView addSubview:menunameBtn];
        
        height=height+screenRect.size.height*0.07;

       UILabel* lineLbl=[[UILabel alloc] initWithFrame:CGRectMake(0, height-1, screenRect.size.width*0.30,1)];
        [lineLbl setBackgroundColor:[UIColor colorWithHexString:@"a6ccc6"]];
        [sidemenuView addSubview:lineLbl];

    }
    
    [self.view addSubview:sidemenuView];
}
-(IBAction)CancelAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)menuBtnAction:(UIButton *)btn{
    _selectIndex=btn.tag;
    [self sideMenuUI];
    
    categorySelectArray=[[NSMutableArray alloc]init];
    mainArray=[[NSMutableArray alloc]initWithObjects:@"Cognitive",@"Coding",@"Arts",@"Fine Motor",@"Communication", nil];
    [tableViewMain reloadData];
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
    
    UIFont *customFontdregs = [UIFont fontWithName:@"FontAwesome" size:15];
    UILabel *checkBtn=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.10,10,40,40)];
    [checkBtn setText:[NSString stringWithFormat:@"\uf00c"]];
    if ([categorySelectArray containsObject:indexPath])
    {
        [checkBtn setTextColor:[UIColor colorWithHexString:appDelegate.textfieldColor]];
    }else{
        [checkBtn setTextColor:[UIColor lightGrayColor]];
    }
    checkBtn.font=customFontdregs;
    [checkBtn setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:checkBtn];

    UILabel *nameLbl;
    nameLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.20,0, screenRect.size.width*.60,screenRect.size.height*0.07)];
    [nameLbl setText:[NSString stringWithFormat:@"%@",[mainArray objectAtIndex:indexPath.row]]];
    nameLbl.font=font1;
    [nameLbl setTextColor:[UIColor colorWithHexString:appDelegate.textfieldColor]];
    [cell.contentView addSubview:nameLbl];
        
    
    tableView.backgroundColor=[UIColor clearColor];
    [cell setBackgroundColor:[UIColor clearColor]];
    //Your main thread code goes in here
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        if ([categorySelectArray containsObject:indexPath])
        {
            [categorySelectArray removeObject:indexPath];
        }else{
            [categorySelectArray addObject:indexPath];
        }
        [tableViewMain reloadData];
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
