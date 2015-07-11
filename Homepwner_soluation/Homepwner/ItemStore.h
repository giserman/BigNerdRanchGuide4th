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
@property (nonatomic, readonly)NSArray *morethan50Items;
@property (nonatomic, readonly)NSArray *under50Items;


+ (instancetype)sharedStore;
- (void)createItem;

@end
