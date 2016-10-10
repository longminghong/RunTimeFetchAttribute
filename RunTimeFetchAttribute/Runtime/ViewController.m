//
//  ViewController.m
//  Runtime
//
//  Created by longminghong on 16/4/15.
//  Copyright © 2016年 Troncell. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+RunTime.h"
#import "Worker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib
    
    id properties = [NSArray getAllProperties:[Worker class]];
    
    NSLog(@"%@",properties);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
