//
//  ActivityDetalisViewController.h
//  School
//
//  Created by Infinitum on 05/05/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface ActivityDetalisViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain) AppDelegate * appDelegate;
@property(nonatomic,retain) NSMutableArray *DetalisArray;
@property(nonatomic,retain) IBOutlet UITableView *tableViewMain;
@property(nonatomic,retain)UIView *activityDropdownV;
@property(nonatomic,retain)NSMutableArray *roomListArray,*activitydropdownArray;
@property(nonatomic,retain)UIButton *activityDDBtn,*DropBtn;
@property(nonatomic,retain)UITapGestureRecognizer *tap;
@property(nonatomic,retain)NSString * acitivtyDDStr,*currentRoomID;

@end
