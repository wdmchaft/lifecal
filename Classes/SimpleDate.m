// -*-  Mode:ObjC; c-basic-offset:4; tab-width:8; indent-tabs-mode:nil -*-

// SimpleDate.m

#import "SimpleDate.h"

@implementation SimpleDate

@synthesize year, month, day;

- (id)init
{
    self = [super init];
    year = 1900;
    month = 1;
    day = 1;
    
    return self;
}

@end