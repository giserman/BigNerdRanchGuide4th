//
//  ReminderViewController.m
//  HypnoNerd
//
//  Created by chenchun on 7/4/15.
//  Copyright (c) 2015 Heath. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end



@implementation ReminderViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Reminder";
        self.tabBarItem.image = [UIImage imageNamed:@"Time"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    
}

@end
