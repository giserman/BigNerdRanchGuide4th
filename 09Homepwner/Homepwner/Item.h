//
//  Item.h
//  Homepwner
//
//  Created by chenchun on 7/9/15.
//  Copyright (c) 2015 xckoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property(nonatomic, copy) NSString *itemName;
@property(nonatomic, copy) NSString *serialNumber;
@property(nonatomic, assign) int valueInDollars;
@property(nonatomic, readonly) NSDate *dateCreated;

+ (instancetype)randomItem;

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

@end
