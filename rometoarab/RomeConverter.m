//
//  RomeConverter.m
//  rometoarab
//
//  Created by Zabolotnyy S. on 7/12/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "RomeConverter.h"

@implementation RomeConverter


- (NSInteger) rometoarab:(NSString*)rome
{
    NSInteger arab = 0;

    NSDictionary* dict = @{@('M'):@(1000),
                           @('D'):@(500),
                           @('C'):@(100),
                           @('L'):@(50),
                           @('X'):@(10),
                           @('V'):@(5),
                           @('I'):@(1)};
    int prev = 0;
    int countRep = 0;

    for (int i = (int)rome.length - 1; i >= 0; --i)
    {
        int val = [[dict objectForKey:@([rome characterAtIndex:i])] intValue];

        if (val == 0)
        {
            return -1;
        }

        arab += prev > val? -val:val;
        if (prev == val)
        {
            countRep++;
        }
        else
        {
            countRep = 0;
        }

        if (countRep > 3)
        {
            return -1;
        }

        prev = val;
    }
    
    return arab;
}

@end
