//
//  HomeViewController.h
//  School
//
//  Created by Infinitum on 28/04/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface HomeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView * _collectionView;
}

@property(nonatomic,retain)AppDelegate * appDelegate;
@property(nonatomic,retain)UITapGestureRecognizer *tap;
@property(nonatomic,retain)UILabel *titlelable;
@property(nonatomic,retain)UIButton *MenuleftBtn,*searchBtn,*dotBtn,*messageBtn,*eventBtn,*attendanceBtn,*activtyBtn,*plusBtn,*notificationBtn,*homeBtn;
@property(nonatomic,retain)UILabel *messageLbl,*eventLbl,*attendanceLbl,*activtyLbl,*homeLbl;
//message tableview
@property(nonatomic,retain)NSMutableArray *MessageArray,*EventArray,*AttendanceArray,*StudentArray,*eventSelectArray,*attendSelectArray,*LearningArray;
@property(nonatomic,retain)IBOutlet UITableView *tableViewMain;
@property(nonatomic,retain)UIView *messageView,*eventView,*activityView,*dropdownView,*activityDropdownV;
@property(nonatomic,retain)UIButton *DropBtn,*DropBtn1,*dropdownMenuBtn,*eventnavBtn,*activityDDBtn,*DropBtn2;
@property(nonatomic,retain)UIScrollView *scrollView;
@property(nonatomic,retain)NSMutableArray *roomListArray,*activitydropdownArray;
@property(nonatomic,retain)NSString * acitivtyDDStr,*currentRoomID;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
