//
//  RomeConverter.m
//  rometoarab
//
//  Created by Zabolotnyy S. on 7/12/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "RomeConverter.h"

typedef enum : NSUInteger {
    M = 'M',
    D = 'D',
    C = 'C',
    L = 'L',
    X = 'X',
    V = 'V',
    I = 'I'
} RomeDigit;

typedef enum : NSUInteger {
    MVal = 1000,
    DVal = 500,
    CVal = 100,
    LVal = 50,
    XVal = 10,
    VVal = 5,
    IVal = 1
} RomeDigitValues;

@implementation RomeConverter


- (NSInteger) rometoarab:(NSString*)rome
{
    NSInteger arab = 0;
    NSArray* romeDigits = @[@(M), @(D), @(C), @(L), @(X), @(V), @(I)];
    NSArray* romeSpecialDigits = @[@(C), @(X), @(I)];
    NSArray* arabValues = @[@(MVal), @(DVal), @(CVal), @(LVal), @(XVal), @(VVal), @(IVal)];

    for (int i = 0; i < rome.length; ++i)
    {
        char rChar = [rome characterAtIndex:i];

        if (![romeDigits containsObject:@(rChar)])
        {
            return -1;
        }

        NSUInteger index = [romeDigits indexOfObject:@(rChar)];
        NSUInteger value = [[arabValues objectAtIndex:index] integerValue];
        NSInteger nextIndex = i + 1;
        arab += value;
        if ([romeSpecialDigits containsObject:@(rChar)] && nextIndex < rome.length)
        {
            char nextChar = [rome characterAtIndex:nextIndex];
            arab += (nextChar == [[romeDigits objectAtIndex:index - 1] integerValue]
                     || nextChar == [[romeDigits objectAtIndex:index - 2] integerValue])? -2*value:0;

        }
    }
    
    return arab;
}

@end
