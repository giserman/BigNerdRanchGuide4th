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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[ItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items = [[ItemStore sharedStore] allItems];
    Item *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}

@end
