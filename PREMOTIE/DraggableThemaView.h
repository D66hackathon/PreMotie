//
//  DraggableThemaView.h
//  PREMOTIE
//
//  Created by Marcel Borsten on 04-04-15.
//  Copyright (c) 2015 D66. All rights reserved.
//

#import "DraggableView.h"
#import "Thema.h"

@interface DraggableThemaView : DraggableView


@property (nonatomic,strong)UILabel* information;
@property (nonatomic, strong) Thema *thema;

@end
