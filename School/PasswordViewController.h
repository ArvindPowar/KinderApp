//
//  PasswordViewController.h
//  School
//
//  Created by Infinitum on 16/05/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPFloatingPlaceholderTextField.h"
#import "RPFloatingPlaceholderTextView.h"

@interface PasswordViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic,retain)RPFloatingPlaceholderTextField *firstnameTxt,*lastnameTxt,*emailTxt,*mobileNoTxt,*choosepassTxt,*passwordTxt;
@property(nonatomic,retain)UIButton *startedBtn,*forgotBtn;
@property(nonatomic,retain)UIView *views,*view1,*view2;
@property(nonatomic,readwrite)int countInx;
@property (nonatomic,retain) UIToolbar * numberToolbar;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
