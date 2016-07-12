//
//  main.m
//  rometoarab
//
//  Created by Zabolotnyy S. on 7/12/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RomeConverter.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        RomeConverter* r2aConverter = [RomeConverter new];

        assert( @"error" &&  [r2aConverter rometoarab:(@"M")] == 1000);
        assert( @"error" &&  [r2aConverter rometoarab:(@"D")] == 500);
        assert( @"error" &&  [r2aConverter rometoarab:(@"C")] == 100);
        assert( @"error" &&  [r2aConverter rometoarab:(@"L")] == 50);
        assert( @"error" &&  [r2aConverter rometoarab:(@"X")] == 10);
        assert( @"error" &&  [r2aConverter rometoarab:(@"V")] == 5);
        assert( @"error" &&  [r2aConverter rometoarab:(@"I")] == 1);
        assert( @"error" &&  [r2aConverter rometoarab:(@"i")] == -1);
        assert( @"error" &&  [r2aConverter rometoarab:(@"IiI")] == -1);
        assert( @"error" &&  [r2aConverter rometoarab:(@"DLXXXIII")] == 583);
        assert( @"error" &&  [r2aConverter rometoarab:(@"XLVI")] == 46);
        assert( @"error" &&  [r2aConverter rometoarab:(@"DCCCLXXXVIII")] == 888);
        assert( @"error" &&  [r2aConverter rometoarab:(@"MCMLXXXIX")] == 1989);

    }
    return 0;
}
