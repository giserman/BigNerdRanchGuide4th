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
@property(nonatomic) NSMutableArray *privateMoreThan50Items;
@property(nonatomic) NSMutableArray *privateUnder50Items;

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
        _privateMoreThan50Items = [[NSMutableArray alloc] init];
        _privateUnder50Items = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void)createItem
{
    Item *item = [Item randomItem];
    
    [self.privateItems addObject:item];
    
    if (item.valueInDollars > 50) {
        [self.privateMoreThan50Items addObject:item];
    }
    else
    {
        [self.privateUnder50Items addObject:item];
    }        
}

- (NSArray*) allItems
{
    return self.privateItems;
}

-(NSArray*) morethan50Items
{
    return self.privateMoreThan50Items;
}

-(NSArray*) under50Items
{
    return self.privateUnder50Items;
}

@end
