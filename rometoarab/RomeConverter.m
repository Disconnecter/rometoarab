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

    for (int i = 0; i < rome.length; ++i)
    {
        char rChar = [rome characterAtIndex:i];

        NSArray* romeDigits = @[@(M), @(D), @(C), @(L), @(X), @(V), @(I)];
        NSArray* arabValues = @[@(MVal), @(DVal), @(CVal), @(LVal), @(XVal), @(VVal), @(IVal)];

        switch (rChar)
        {
            case M:
            case D:
            case L:
            case V:
            {
                NSUInteger index = [romeDigits indexOfObject:@(rChar)];
                arab += [[arabValues objectAtIndex:index] integerValue];
                break;
            }

            case C:
            case I:
            case X:
            {
                NSUInteger index = [romeDigits indexOfObject:@(rChar)];
                NSInteger nextIndex = i + 1;
                NSUInteger value = [[arabValues objectAtIndex:index] integerValue];
                if (nextIndex < rome.length)
                {
                    char nextChar = [rome characterAtIndex:nextIndex];
                    arab += (nextChar == [[romeDigits objectAtIndex:index - 1] integerValue]
                             || nextChar == [[romeDigits objectAtIndex:index - 2] integerValue])? -value:value;
                }
                else
                {
                    arab += value;
                }
                break;
            }

            default:
                return -1;
                break;
        }
    }
    
    return arab;
}

@end
