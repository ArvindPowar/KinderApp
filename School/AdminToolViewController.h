//
//  AdminToolViewController.h
//  School
//
//  Created by Infinitum on 24/05/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface AdminToolViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain) AppDelegate * appDelegate;
@property(nonatomic,retain) NSMutableArray *mainArray;
@property(nonatomic,retain) IBOutlet UITableView *tableViewMain;

@end
