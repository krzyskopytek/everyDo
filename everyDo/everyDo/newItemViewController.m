//
//  newItemViewController.m
//  everyDo
//
//  Created by Krzysztof Kopytek on 2016-05-17.
//  Copyright © 2016 Krzysztof Kopytek. All rights reserved.
//

#import "newItemViewController.h"

@interface newItemViewController ()

@end

@implementation newItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(sendDataBack) userInfo:nil repeats:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)sendDataBack {
    
    [self.navigationController popViewControllerAnimated:true];
    [self.delegate passDataBackward:@"Hey I am data from view Controller B"];
    
}

@end
