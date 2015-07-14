//
//  ItemStore.m
//  Homepwner
//
//  Created by chenchun on 7/9/15.
//  Copyright (c) 2015 xckoo. All rights reserved.
//

#import "Item.h"
#import "ItemStore.h"

@interface ItemStore ()

@property(nonatomic) NSMutableArray *privateItems;

@end

@implementation ItemStore

+ (instancetype)sharedStore
{
    static ItemStore *itemStore = nil;
    if(!itemStore)
    {
        itemStore = [[ItemStore alloc] initPrivate];
    }
    return itemStore;
    
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[ItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self)
    {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (Item*) createItem
{
    Item *item = [Item randomItem];
    
    [self.privateItems addObject:item];
   
    return item;
}

- (void) removeItem:(Item *)item
{
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void) moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    Item *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectIdenticalTo:item];
    [self.privateItems insertObject:item atIndex:toIndex];
}

- (NSArray*) allItems
{
    return self.privateItems;
}
@end
