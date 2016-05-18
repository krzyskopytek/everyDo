//
//  Todo.m
//  everyDo
//
//  Created by Krzysztof Kopytek on 2016-05-17.
//  Copyright © 2016 Krzysztof Kopytek. All rights reserved.
//

#import "Todo.h"

@implementation Todo


-(instancetype) initWithTitle:(NSString *)title Description:(NSString *)description Priority:(int)priority {
    self = [super init];
    if (self) {
        _title = title;
        _desc = description;
        _priorityNumber = priority;
        _isCompletedIndicator = NO;
    }
    return self;
}


@end
