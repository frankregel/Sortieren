//
//  DataManipulationModel.m
//  BaseDataApp
//
//  Created by Frank on 06.02.14.
//  Copyright (c) 2014 Frank. All rights reserved.
//

#import "DataManipulationModel.h"

@interface DataManipulationModel()
@property NSMutableArray *sortedTimeArray;
@end


@implementation DataManipulationModel

-(id)init
{
    self = [super init];
    if (self)
    
    {
        [self sortTimeStampArray];
    }
    return self;
}

- (void)sortTimeStampArray
{
    _sortedTimeArray =[NSMutableArray new];
    NSMutableDictionary *sourceDict = [NSMutableDictionary dictionary];
    [sourceDict setObject:@"key2" forKey:@"12345"];
    [sourceDict setObject:@"key1" forKey:@"1234"];
    [sourceDict setObject:@"key3" forKey:@"123456"];
    
    
    for (NSString *timestamp in sourceDict.allKeys)
    {
        NSString *keyContent = [sourceDict objectForKey:timestamp];
        [_sortedTimeArray addObject:keyContent];
    }
    
    NSArray *finalArray = [self sortStringsWith:_sortedTimeArray];
    
    
    NSLog(@"%@", finalArray);
    
}

- (NSArray *)sortStringsWith:(NSArray *)unsortedStringArray
{
    
    NSArray *sortedArray = [unsortedStringArray sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    return sortedArray;
}

- (NSArray *)sortNumbersAscWith:(NSArray *)unsortedNumbersArray
{
    NSArray *sortedArray = [unsortedNumbersArray sortedArrayUsingSelector:@selector(compare:)];
    
    return sortedArray;
}

- (NSArray *)sortNumbersDescWith:(NSArray *)unsortedNumbersArray
{
    NSArray *sortDescArray = [unsortedNumbersArray sortedArrayUsingComparator:
                        ^NSComparisonResult(id number1, id number2)
    {
        if ([number1 intValue] > [number2 intValue])
        {
            return NSOrderedAscending;
        }
        else if ([number1 intValue] < [number2 intValue])
        {
            return NSOrderedDescending;
        }
        else
        {
            return NSOrderedSame;
        }
    }];
    return sortDescArray;
}

@end
