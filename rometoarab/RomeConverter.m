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

        switch (rChar)
        {
            case M:
            {
                arab += MVal;
                break;
            }

            case D:
            {
                arab += DVal;
                break;
            }

            case C:
            {
                NSInteger nextIndex = i + 1;
                if (nextIndex < rome.length)
                {
                    char nextChar = [rome characterAtIndex:nextIndex];
                    arab += (nextChar == D || nextChar == M) ? -CVal:CVal;
                }
                else
                {
                    arab += CVal;
                }
                break;
            }

            case L:
            {
                arab += LVal;
                break;
            }

            case X:
            {
                NSInteger nextIndex = i + 1;
                if (nextIndex < rome.length)
                {
                    char nextChar = [rome characterAtIndex:nextIndex];
                    arab += (nextChar == L || nextChar == C) ? -XVal:XVal;
                }
                else
                {
                    arab += XVal;
                }

                break;
            }

            case V:
            {
                arab += VVal;
                break;
            }

            case I:
            {
                NSInteger nextIndex = i + 1;
                if (nextIndex < rome.length)
                {
                    char nextChar = [rome characterAtIndex:nextIndex];
                    arab += (nextChar == V || nextChar == X) ? -IVal:IVal;
                }
                else
                {
                    arab += IVal;
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
