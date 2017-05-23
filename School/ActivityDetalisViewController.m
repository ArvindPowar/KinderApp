//
//  ActivityDetalisViewController.m
//  School
//
//  Created by Infinitum on 05/05/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import "ActivityDetalisViewController.h"
#import "UIColor+Expanded.h"
#import "UIImage+FontAwesome.h"
#import "NSString+FontAwesome.h"

@interface ActivityDetalisViewController ()

@end

@implementation ActivityDetalisViewController
@synthesize appDelegate,DetalisArray,tableViewMain,activityDropdownV,activitydropdownArray,activityDDBtn,tap,acitivtyDDStr,DropBtn;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    appDelegate=[[UIApplication sharedApplication] delegate];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];

    UILabel *titlelable=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*.18,15,screenRect.size.width*.60,40)];
    titlelable.textAlignment = NSTextAlignmentLeft;
    titlelable.text=@"Student Activity";
    titlelable.textColor=[UIColor colorWithHexString:appDelegate.textfieldColor];
    [titlelable setBackgroundColor:[UIColor clearColor]];
    titlelable.font=[UIFont fontWithName:@"Open Sans" size:18.0f];
    [self.view addSubview:titlelable];

    UIFont *customFontdregs = [UIFont fontWithName:@"FontAwesome" size:20];
    UIFont *customFont = [UIFont fontWithName:@"MaterialIcons-Regular" size:25];

    UIButton * leftBackBtn=[[UIButton alloc]initWithFrame:CGRectMake(10,25,screenRect.size.width*.13,screenRect.size.height*.035)];
    [leftBackBtn addTarget:self action:@selector(CancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftBackBtn setTitle:@"\uE5C4" forState:UIControlStateNormal];
    [leftBackBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [leftBackBtn.titleLabel setFont:customFont];
    [leftBackBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:leftBackBtn];
    
    UIButton * notificationBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*.90,25,screenRect.size.width*.10,screenRect.size.height*.035)];
//    [notificationBtn addTarget:self action:@selector(CancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [notificationBtn setTitle:@"\uE7F4" forState:UIControlStateNormal];
    [notificationBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [notificationBtn.titleLabel setFont:customFont];
    [notificationBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:notificationBtn];

    UIView *bgView=[[UIView alloc]init];
    bgView.frame=CGRectMake(0,screenRect.size.height*.10,screenRect.size.width,screenRect.size.height*.07);
    [bgView setBackgroundColor:[UIColor colorWithHexString:@"f7f7f7"]];
    [self.view addSubview:bgView];

    DropBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [DropBtn setFrame:CGRectMake(screenRect.size.width*0.05, screenRect.size.height*0.10,screenRect.size.width*.35,40)];
    [DropBtn setTitle:@"All Activities" forState:UIControlStateNormal];
    [DropBtn setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [DropBtn setBackgroundColor:[UIColor clearColor]];
    DropBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIFont *customFontdr = [UIFont fontWithName:@"Open Sans" size:screenRect.size.width*0.04];
    [DropBtn.titleLabel setFont:customFontdr];
    [DropBtn addTarget:self action:@selector(ActivitydropdownAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:DropBtn];
    
    UIButton *DropBtn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [DropBtn1 setFrame:CGRectMake(screenRect.size.width*0.50, screenRect.size.height*0.10,40,30)];
    [DropBtn1 setTitle:@"\uf0dd" forState:UIControlStateNormal];
    [DropBtn1 setTitleColor:[UIColor colorWithHexString:appDelegate.textfieldColor] forState:UIControlStateNormal];
    [DropBtn1.titleLabel setFont:customFontdregs];
    [DropBtn1 setBackgroundColor:[UIColor clearColor]];
    [DropBtn1 addTarget:self action:@selector(ActivitydropdownAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:DropBtn1];

    UILabel *linelabel=[[UILabel alloc] initWithFrame:CGRectMake(24.5,screenRect.size.height*0.17, 1, screenRect.size.height*0.83)];
    [linelabel setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:linelabel];

    DetalisArray=[[NSMutableArray alloc]initWithObjects:@"Kudos",@"Learning",@"Photos",@"Notes", nil];
    acitivtyDDStr=[[NSString alloc]init];
    acitivtyDDStr=@"All Activities";
    [tableViewMain removeFromSuperview];
    tableViewMain=[[UITableView alloc]init];
    tableViewMain.frame=CGRectMake(0,screenRect.size.height*.17,screenRect.size.width,screenRect.size.height*.83);
    tableViewMain.dataSource = self;
    tableViewMain.delegate = self;
    [tableViewMain setBackgroundColor:[UIColor clearColor]];
    self.tableViewMain.separatorColor = [UIColor clearColor];
    tableViewMain.separatorInset = UIEdgeInsetsZero;
    tableViewMain.layoutMargins = UIEdgeInsetsZero;
    [self.view addSubview:tableViewMain];


}
-(void)ActivitydropdownAction{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    activityDropdownV=[[UIView alloc]init];
    activitydropdownArray=[NSMutableArray arrayWithObjects:@"All Activities",@"Notes",@"Learning",@"Kudos",@"Photos", nil];
    
    activityDropdownV.frame=CGRectMake(screenRect.size.width*.05,screenRect.size.height*.10,screenRect.size.width*.50,screenRect.size.height*.31);
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
- (void)tapOnView:(UITapGestureRecognizer *)sender
{
    sender.enabled = NO;
    [activityDropdownV removeFromSuperview];
}
-(void)ActivityBtnAction:(UIButton *)btn{
    acitivtyDDStr=[activitydropdownArray objectAtIndex:btn.tag-1];
    [DropBtn setTitle:acitivtyDDStr forState:UIControlStateNormal];
    [activityDropdownV removeFromSuperview];
    if ([acitivtyDDStr isEqualToString:@"All Activities"]) {
        DetalisArray=[[NSMutableArray alloc]initWithObjects:@"Kudos",@"Learning",@"Photos",@"Notes", nil];
    }else if ([acitivtyDDStr isEqualToString:@"Kudos"]){
        DetalisArray=[[NSMutableArray alloc]initWithObjects:@"Kudos", nil];
    }else if ([acitivtyDDStr isEqualToString:@"Learning"]){
        DetalisArray=[[NSMutableArray alloc]initWithObjects:@"Learning", nil];
    }else if ([acitivtyDDStr isEqualToString:@"Photos"]){
        DetalisArray=[[NSMutableArray alloc]initWithObjects:@"Photos", nil];
    }else if ([acitivtyDDStr isEqualToString:@"Notes"]){
        DetalisArray=[[NSMutableArray alloc]initWithObjects:@"Notes", nil];
    }
    [tableViewMain reloadData];
}

#pragma marl - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [DetalisArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    NSString *titleStr=[DetalisArray objectAtIndex:indexPath.row];
    if ([titleStr isEqualToString:@"Notes"]) {
        return screenRect.size.height*0.18;
    }else if ([titleStr isEqualToString:@"Learning"]) {
            return screenRect.size.height*0.18;
        }else if ([titleStr isEqualToString:@"Kudos"]) {
            return screenRect.size.height*0.18;
        }else if ([titleStr isEqualToString:@"Photos"]) {
            return screenRect.size.height*0.30;
        }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    UIFont * font1 =[UIFont fontWithName:@"OpenSans-Bold" size:screenRect.size.width*.04];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    cell.textLabel.textColor=[UIColor whiteColor];
    
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
    NSString *  personname;
    personname= [DetalisArray objectAtIndex:indexPath.row];
    headerLabel.text=@"1 JAN";
    headerLabel.textAlignment = NSTextAlignmentLeft;
    [cell.contentView addSubview:headerLabel];

    UIImageView *  logoImg=[[UIImageView alloc]initWithFrame:CGRectMake(screenRect.size.width*.03,screenRect.size.height*.035,screenRect.size.width*.12,screenRect.size.height*.07)];
    [logoImg setImage:[UIImage imageNamed:@"upload_Picture.png"]];
    logoImg.layer.cornerRadius = logoImg.frame.size.width / 2;
   // [cell.contentView addSubview:logoImg];
    
    UILabel *nameLbl;
    nameLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.30,05, screenRect.size.width*.20,25)];
    [nameLbl setText:[NSString stringWithFormat:@"%@",[DetalisArray objectAtIndex:indexPath.row]]];
    nameLbl.font=font1;
    nameLbl.textAlignment = NSTextAlignmentLeft;
    [nameLbl setTextColor:[UIColor colorWithHexString:appDelegate.textfieldColor]];
    [cell.contentView addSubview:nameLbl];
    
    UILabel *titleLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.30,screenRect.size.height*0.04, screenRect.size.width*.70,screenRect.size.height*0.08)];
    [titleLbl setText:[NSString stringWithFormat:@"Lorem Ipsum is simply dummy text of the printing anf typeseting industry. Lorem Ipsum has been the lorem Ipsum is simply dummy text of the printing anf typeseting industry. Lorem Ipsum has been the lorem Ipsum is simply dummy text of the printing anf typeseting industry. Lorem Ipsum has been the lorem Ipsum is simply dummy text of the printing anf typeseting industry."]];
    titleLbl.font=[UIFont fontWithName:@"Open Sans" size:screenRect.size.width*.03];
    [titleLbl setTextColor:[UIColor grayColor]];
    titleLbl.lineBreakMode = NSLineBreakByWordWrapping;
    titleLbl.numberOfLines = 0;
    titleLbl.textAlignment = NSTextAlignmentLeft;

    UILabel *kudosIconLbl=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.52,5,25,25)];
    kudosIconLbl.textColor=[UIColor lightGrayColor];
    
    if ([nameLbl.text isEqualToString:@"Notes"]) {
        [cell.contentView addSubview:titleLbl];
        kudosIconLbl.text = @"\uf133";
    }
    else if ([nameLbl.text isEqualToString:@"Learning"]) {
        [cell.contentView addSubview:titleLbl];
        kudosIconLbl.text = @"\uf19d";
        
        int width=screenRect.size.width*0.30;
        for (int count=0; count<5; count++) {
            UIImageView *  logoImg=[[UIImageView alloc]initWithFrame:CGRectMake(width,screenRect.size.height*.13,screenRect.size.width*.07,screenRect.size.width*.07)];
            [logoImg setImage:[UIImage imageNamed:@"boy.jpg"]];
            logoImg.layer.cornerRadius = logoImg.frame.size.width / 2;
            logoImg.layer.masksToBounds=YES;
            [cell.contentView addSubview:logoImg];
            width=width+screenRect.size.width*.09;
        }
    }else if ([nameLbl.text isEqualToString:@"Kudos"]) {
        [cell.contentView addSubview:titleLbl];
        kudosIconLbl.text = @"\uf005";
        
        int width=screenRect.size.width*0.30;
        for (int count=0; count<5; count++) {
            UIImageView *  logoImg=[[UIImageView alloc]initWithFrame:CGRectMake(width,screenRect.size.height*.13,screenRect.size.width*.07,screenRect.size.width*.07)];
            [logoImg setImage:[UIImage imageNamed:@"boy.jpg"]];
            logoImg.layer.cornerRadius = logoImg.frame.size.width / 2;
            logoImg.layer.masksToBounds=YES;
            [cell.contentView addSubview:logoImg];
            width=width+screenRect.size.width*.09;
        }

    }else if ([nameLbl.text isEqualToString:@"Photos"]) {
        kudosIconLbl.text = @"\uf030";
        int width=screenRect.size.width*0.30;
        int height=screenRect.size.height*0.05;
        
        for (int count=0; count<4; count++) {
            UIImageView *  logoImg=[[UIImageView alloc]initWithFrame:CGRectMake(width,height,screenRect.size.width*.25,screenRect.size.width*.18)];
            [logoImg setImage:[UIImage imageNamed:@"Gerbera-Color-Meaning.jpg"]];
            logoImg.layer.cornerRadius = 4.f;
            logoImg.layer.masksToBounds=YES;
            [cell.contentView addSubview:logoImg];
            width=width+screenRect.size.width*.28;
            BOOL isOdd = count % 2;
            if (isOdd) {
                height=height+screenRect.size.width*.21;
                width=screenRect.size.width*0.30;
            }
        }
    }
    UIFont *customFontdreg = [UIFont fontWithName:@"FontAwesome" size:17];
    kudosIconLbl.font=customFontdreg;
    [cell.contentView addSubview:kudosIconLbl];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.backgroundColor=[UIColor clearColor];
    [cell setBackgroundColor:[UIColor clearColor]];
    //Your main thread code goes in here
    
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
