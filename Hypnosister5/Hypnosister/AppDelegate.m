//
//  AppDelegate.m
//  Hypnosister
//
//  Created by chenchun on 1/9/15.
//  Copyright (c) 2015 Heath. All rights reserved.
//

#import "AppDelegate.h"
#import "HypnosisView.h"

@interface AppDelegate () <UIScrollViewDelegate>

@property (nonatomic, strong) HypnosisView* hypnosisView;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    CGRect firstframe = [self.window bounds];
    
    
    
    //firstview.backgroundColor = [UIColor whiteColor];
    //[self.window addSubview:firstview];
    //CGRect firstframe = CGRectMake(50, 50, 100, 150);
    /*
    HypnosisView *pView = [[HypnosisView alloc] initWithFrame:firstframe];
    [pView setBackgroundColor:[UIColor redColor]];
    
    [self.window addSubview:pView];
    
    
    HypnosisView *secondView = [[HypnosisView alloc] initWithFrame:CGRectMake(20, 30, 50, 50)];
    secondView.backgroundColor = [UIColor blueColor];
    
    [pView addSubview:secondView];
    */
    
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:[self.window bounds]];
    //firstframe.size.height *= 2;
   
    /*
    CGRect screenRect = firstframe;
    HypnosisView *firstview  = [[HypnosisView alloc] initWithFrame:screenRect];
    screenRect.origin.x = screenRect.size.width;
    HypnosisView *secondview = [[HypnosisView alloc] initWithFrame:screenRect];
    
    [scrollview addSubview:firstview];
    [scrollview addSubview:secondview];
    
    firstframe.size.width *= 2;
    
    scrollview.contentSize =  firstframe.size;
    
    scrollview.pagingEnabled = true;
    */
    self.hypnosisView = [[HypnosisView alloc] initWithFrame:firstframe];
    [scrollview addSubview:self.hypnosisView];
    scrollview.delegate = self;
    scrollview.minimumZoomScale = 1.0;
    scrollview.maximumZoomScale = 5.0;
    [self.window addSubview:scrollview];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.hypnosisView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"contentOffset.y = %f",scrollView.contentOffset.y);
    if(scrollView.contentOffset.y <= -35)
    {
        //scrollView.contentInset = UIEdgeInsetsMake(30, 0, 0, 0);
    }
    NSLog(@"11contentoffset.y = %f, %f, %f, %f", scrollView.contentSize.height, scrollView.contentSize.width);
    
}

@end
