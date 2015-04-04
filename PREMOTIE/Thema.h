//
//  Thema.h
//  PREMOTIE
//
//  Created by Marcel Borsten on 04-04-15.
//  Copyright (c) 2015 D66. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Thema : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSArray *moties;

+(Thema *)themaWithName:(NSString *)name andImage:(UIImage *)image;

@end
