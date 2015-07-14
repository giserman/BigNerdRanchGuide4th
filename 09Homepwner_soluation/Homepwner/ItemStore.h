//
//  ItemStore.h
//  Homepwner
//
//  Created by chenchun on 7/9/15.
//  Copyright (c) 2015 xckoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface ItemStore : NSObject

@property (nonatomic, readonly)NSArray *allItems;

+ (instancetype)sharedStore;
- (Item*)createItem;
- (void)removeItem:(Item *) item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
