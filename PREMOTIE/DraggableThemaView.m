//
//  DraggableThemaView.m
//  PREMOTIE
//
//  Created by Marcel Borsten on 04-04-15.
//  Copyright (c) 2015 D66. All rights reserved.
//

#import "DraggableThemaView.h"

#define TITLE_HEIGHT 100

@interface DraggableThemaView ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation DraggableThemaView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {

        self.information = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, TITLE_HEIGHT)];
        self.information.text = @"no info given";
        self.information.font = [UIFont systemFontOfSize:22];
        self.information.numberOfLines = 0;
        self.information.textColor = [UIColor whiteColor];
        self.information.backgroundColor = [UIColor colorWithRed:0.628 green:0.768 blue:1.000 alpha:1.000];
        [self.information setTextAlignment:NSTextAlignmentCenter];

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, TITLE_HEIGHT, self.frame.size.width, self.frame.size.height - TITLE_HEIGHT)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:imageView];

        self.imageView = imageView;

        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width - 120)/2, self.frame.size.height - 120 - 10, 120, 40)];
        button.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
        [button setTitle:@"Overslaan" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.layer.cornerRadius = 20;
        button.layer.masksToBounds = YES;

        [self addSubview:button];

        [self addSubview:self.information];
    }
    return self;
}

-(void) setThema:(Thema *)thema {
    _thema = thema;

    self.information.text = thema.title;
    self.imageView.image = thema.image;
}

@end
