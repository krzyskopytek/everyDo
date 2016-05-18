//
//  newItemViewController.h
//  everyDo
//
//  Created by Krzysztof Kopytek on 2016-05-17.
//  Copyright © 2016 Krzysztof Kopytek. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol newItemViewControlerDelegate <NSObject>

- (void)passDataBackward:(NSString *)data;

@end

@interface newItemViewController : UIViewController

@property (nonatomic, weak) id <newItemViewControlerDelegate> delegate;

@end
