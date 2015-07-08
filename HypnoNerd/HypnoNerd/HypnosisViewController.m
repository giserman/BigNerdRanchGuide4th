//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by chenchun on 7/3/15.
//  Copyright (c) 2015 Heath. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

- (void)loadView
{
    // Create a view
    HypnosisView *backgroundView = [[HypnosisView alloc] init];
    
    // set it as *the* view of this view controller
    self.view = backgroundView;
    CGRect shape1 = CGRectMake(50, 50, 300, 50);
    //UISegmentedControl *uiSegmentControl = [[UISegmentedControl alloc] initWithFrame:shape1];
    UISegmentedControl *uiSegmentControl = [[UISegmentedControl alloc] initWithItems:@[@"red",@"green",@"blue"]];
    uiSegmentControl.frame = shape1;
    [uiSegmentControl addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:uiSegmentControl];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Hypno";
        self.tabBarItem.image = [UIImage imageNamed:@"Hypno"];
    }
    return self;
}

- (void)selectAction:(id)sender{
    UISegmentedControl *tmpObj = sender;
    HypnosisView *tmpView = (HypnosisView*)self.view;
    switch (tmpObj.selectedSegmentIndex) {
        case 0:
            tmpView.circleColor = [UIColor redColor];
            break;
        case 1:
            tmpView.circleColor = [UIColor greenColor];
            break;
        case 2:
            tmpView.circleColor = [UIColor blueColor];
            break;
        default:
            break;
    }
}
@end
