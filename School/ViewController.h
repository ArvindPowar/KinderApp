//
//  ViewController.h
//  School
//
//  Created by Infinitum on 26/04/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPFloatingPlaceholderTextField.h"
#import "RPFloatingPlaceholderTextView.h"

@interface ViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic,retain)RPFloatingPlaceholderTextField *usernameTxt,*passwordTxt;
@property(nonatomic,retain)UIButton *logintBtn,*forgotBtn;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

