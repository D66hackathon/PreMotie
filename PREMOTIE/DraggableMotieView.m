//
//  DraggableMotieView.m
//  PREMOTIE
//
//  Created by Marcel Borsten on 04-04-15.
//  Copyright (c) 2015 D66. All rights reserved.
//

#import "DraggableMotieView.h"

#define TITLE_HEIGHT 100
#define ADVICE_VIEW_HEIGHT 100

@interface DraggableMotieView ()
@property (nonatomic, strong) UILabel *information;
@property (nonatomic, strong) UIView *adviceContainerView;
@property (nonatomic, strong) UILabel *adviceLabel;
@property (nonatomic) BOOL adviceVisible;
@end

@implementation DraggableMotieView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {

        self.information = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, TITLE_HEIGHT)];
        self.information.text = @"no info given";
        self.information.font = [UIFont systemFontOfSize:22];
        self.information.numberOfLines = 0;
        self.information.textColor = [UIColor blackColor];
        [self.information setTextAlignment:NSTextAlignmentCenter];

        [self addSubview:self.information];

        self.adviceContainerView = [self newAdviceContainerView];
        [self addSubview:self.adviceContainerView];

    }
    return self;
}

-(UIView *)newAdviceContainerView
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.2];

    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"up"]];

    UITapGestureRecognizer *t = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(adviceContainerViewTapped:)];
    [view addGestureRecognizer:t];

    CGRect rect = CGRectMake(0, self.frame.size.height - 25, self.frame.size.width, ADVICE_VIEW_HEIGHT);
    view.frame = rect;

    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 25, rect.size.width, rect.size.height);
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];

    self.adviceLabel = label;

    CGRect arrowRect = CGRectMake((rect.size.width - image.bounds.size.width) / 2, 0, image.bounds.size.width, image.bounds.size.height);
    image.frame = arrowRect;
    [view addSubview:image];

    return view;
}

-(void)adviceContainerViewTapped:(UITapGestureRecognizer *)tap
{

    CGRect rect;

    if(self.adviceVisible) {
        self.adviceVisible = false;
        rect = CGRectMake(0, self.frame.size.height - 20, self.frame.size.width, ADVICE_VIEW_HEIGHT);


    } else {
        self.adviceVisible = true;
        rect = CGRectMake(0, self.frame.size.height - ADVICE_VIEW_HEIGHT, self.frame.size.width, ADVICE_VIEW_HEIGHT);

    }
    [UIView animateWithDuration:.4 animations:^{
        self.adviceContainerView.frame = rect;
    }];
}

-(void)setMotie:(Motie *)motie
{
    _motie = motie;

    self.information.text = _motie.title;
    self.adviceLabel.text = _motie.advice;
}

@end
