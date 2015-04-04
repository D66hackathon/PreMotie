//
//  Thema.m
//  PREMOTIE
//
//  Created by Marcel Borsten on 04-04-15.
//  Copyright (c) 2015 D66. All rights reserved.
//

#import "Thema.h"
#import "Motie.h"

@implementation Thema

+(Thema *)themaWithName:(NSString *)name andImage:(UIImage *)image {

    Thema *thema = [[Thema alloc] init];
    thema.image = image;
    thema.title = name;
    thema.moties = [thema motiesForThema:name];

    return thema;

}

-(NSArray *)motiesForThema:(NSString *)themaName
{

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"moties" ofType:@"json"];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    NSArray *result = [NSJSONSerialization JSONObjectWithData:data
                                                      options:kNilOptions
                                                        error:&error];

    NSMutableArray *t = [NSMutableArray array];

    for(NSDictionary *d in result) {
        Motie *m = [[Motie alloc] init];
        m.title = d[@"Titel"];
        m.fullText = d[@"Dictum"];
        m.advice = d[@"Bestuursadvies"];

        [t addObject:m];
    }
    
    return t;
}

@end
