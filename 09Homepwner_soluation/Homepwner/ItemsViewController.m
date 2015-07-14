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

@property (nonatomic, strong) IBOutlet UIView *headerView;

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
        //for (int i = 0; i < 10; i++) {
        //    [[ItemStore sharedStore] createItem];
        //}
    }
    return self;
    
}

- (UIView*) headerView
{
    if (!_headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return _headerView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    //[self.tableView setTableHeaderView:self.headerView];
    self.tableView.tableHeaderView = self.headerView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[ItemStore sharedStore] allItems] count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    if (indexPath.row != [[[ItemStore sharedStore] allItems] count]) {
        NSArray *items = [[ItemStore sharedStore] allItems];
        Item *item = items[indexPath.row];
        cell.textLabel.text = [item description];
    }else{
        cell.textLabel.text = @"No More Items";
    }
    
    return cell;
}

- (IBAction)toggleEditingMode:(id)sender {
    if (self.isEditing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    } else{
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

- (IBAction)addNewItem:(id)sender {
    Item *item = [[ItemStore sharedStore] createItem];
    NSInteger lastRow = [[[ItemStore sharedStore] allItems] indexOfObject:item];
    //NSInteger lastRow = [self.tableView numberOfRowsInSection:0];
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[lastIndexPath] withRowAnimation:UITableViewRowAnimationTop];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[ItemStore sharedStore] allItems];
        Item *item = items[indexPath.row];
        
        [[ItemStore sharedStore] removeItem:item];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if (destinationIndexPath.row == [[[ItemStore sharedStore] allItems] count]) {
        return;
    }
    [[ItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

- (NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Remove";
}


-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (proposedDestinationIndexPath.row == [[[ItemStore sharedStore] allItems] count]) {
        return sourceIndexPath;
    }else{
        return proposedDestinationIndexPath;
    }
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row != [[[ItemStore sharedStore] allItems] count];
}
@end
