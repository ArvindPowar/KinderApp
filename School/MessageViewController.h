//
//  MessageViewController.h
//  School
//
//  Created by Infinitum on 26/04/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface MessageViewController : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain) AppDelegate * appDelegate;
@property(nonatomic,retain) IBOutlet UITableView *chatTableView;
@property(nonatomic,retain) NSMutableArray *msgListArray;
@property(nonatomic,retain) IBOutlet UITextField *msgText;
@property(nonatomic,retain) IBOutlet UIButton *sendBtn,*attachmentBtn;@end
