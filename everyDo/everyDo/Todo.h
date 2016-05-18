//
//  Todo.h
//  everyDo
//
//  Created by Krzysztof Kopytek on 2016-05-17.
//  Copyright © 2016 Krzysztof Kopytek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *desc;
@property (assign, nonatomic) int priorityNumber;
@property (assign, nonatomic) bool isCompletedIndicator;

-(instancetype) initWithTitle:(NSString *)title Description:(NSString *)description Priority:(int)priority;

@end
