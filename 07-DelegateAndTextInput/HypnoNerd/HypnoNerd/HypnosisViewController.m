//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by chenchun on 7/3/15.
//  Copyright (c) 2015 Heath. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@interface HypnosisViewController() <UITextFieldDelegate>

@end

@implementation HypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Hypno";
        self.tabBarItem.image = [UIImage imageNamed:@"Hypno"];
    }
    return self;
}

- (void)loadView
{
    // Create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *backgroundView = [[HypnosisView alloc] initWithFrame:frame];
    
    CGRect textFieldRect = CGRectMake(60, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    //textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    //textField.enablesReturnKeyAutomatically = NO;
    //textField.keyboardType = UIKeyboardTypeURL;
    //textField.secureTextEntry = YES;
    
    textField.delegate = self;
    [backgroundView addSubview:textField];
    
    // set it as *the* view of this view controller
    self.view = backgroundView;
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (void)drawHypnoticMessage:(NSString*) message
{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        messageLabel.backgroundColor = [UIColor blueColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        [messageLabel sizeToFit];
        
        int width = (int)(self.view.bounds.size.width - messageLabel.frame.size.width);
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        
        int x = arc4random() % width;
        int y = arc4random() % height;
        
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
    }
}
@end
