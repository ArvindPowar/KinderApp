//
//  LearningViewController.h
//  School
//
//  Created by Infinitum on 29/04/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface LearningViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain) AppDelegate * appDelegate;
@property(nonatomic,retain) NSMutableArray *menuArray;
@property(nonatomic,retain) UIView *sidemenuView;
@property(nonatomic,retain) UIButton *menunameBtn;
@property(nonatomic,readwrite) NSInteger selectIndex;
@property(nonatomic,retain) NSMutableArray *mainArray,*categorySelectArray;
@property(nonatomic,retain) IBOutlet UITableView *tableViewMain;

@end
