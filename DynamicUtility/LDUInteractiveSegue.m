//
//  LDUInteractiveSegue.m
//  DynamicUtility
//
//  Created by Louis Franco on 9/29/13.
//  Copyright (c) 2013 Lou Franco. All rights reserved.
//

#import "LDUInteractiveSegue.h"

@implementation LDUInteractiveSegue

- (void)perform
{
    [self.sourceViewController presentViewController:self.destinationViewController animated:YES completion:nil];
}

@end
