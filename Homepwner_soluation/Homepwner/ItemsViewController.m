//
//  ItemsViewController.m
//  Homepwner
//
//  Created by chenchun on 7/8/15.
//  Copyright (c) 2015 xckoo. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemStore.h"
#import "Item.h"

@interface ItemsViewController()

@end

@implementation ItemsViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self)
    {
        for (int i = 0; i < 10; i++) {
            [[ItemStore sharedStore] createItem];
        }
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Section 1: More Than $50";
    }
    else
    {
        return @"Section 2: Less Than $50";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [[[ItemStore sharedStore] morethan50Items] count] + 1;
    }
    else
    {
        return [[[ItemStore sharedStore] under50Items] count] + 1;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row != [[[ItemStore sharedStore] morethan50Items] count]) {
            return 60.0;
        }
        else
        {
            return 40.0;
        }
    }
    else
    {
        if (indexPath.row != [[[ItemStore sharedStore] under50Items] count]) {
            return 60.0;
        }
        else
        {
            return 40.0;
        }
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
   
    NSArray *items = nil;
    Item *item = nil;
    if (indexPath.section == 0) {
        items = [[ItemStore sharedStore] morethan50Items];
        if ([[[ItemStore sharedStore] morethan50Items] count] != indexPath.row){
            item = items[indexPath.row];
            cell.textLabel.text = [item description];
            cell.textLabel.font = [UIFont systemFontOfSize:20.0];
        }
        else
        {
            cell.textLabel.text = @"No More Items";
        }
    }
    else
    {
        items = [[ItemStore sharedStore] under50Items];
        if ([[[ItemStore sharedStore] under50Items] count] != indexPath.row) {
            item = items[indexPath.row];
            cell.textLabel.text = [item description];
            cell.textLabel.font = [UIFont systemFontOfSize:20.0];
        }
        else
        {
            cell.textLabel.text = @"No More Items";
        }
    }
    
    //kNSString *tmpStr = [item description];
    //cell.textLabel.text = tmpStr;
    
    return cell;
}

@end
