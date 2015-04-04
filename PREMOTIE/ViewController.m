//
//  ViewController.m
//  PREMOTIE
//
//  Created by Marcel Borsten on 04-04-15.
//  Copyright (c) 2015 D66. All rights reserved.
//

#import "ViewController.h"
#import "DraggableView.h"
#import "DraggableViewBackground.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:self.view.frame];
    [self.view addSubview:draggableBackground];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
