// -*-  Mode:ObjC; c-basic-offset:4; tab-width:8; indent-tabs-mode:nil -*-

// PersonManager

#import "PersonManager.h"
#import "EventManager.h"

@implementation PersonManager

+ (PersonManager *)sharedInstance
{
    static PersonManager *theManager = nil;

    if (theManager == nil) {
        theManager = [[PersonManager alloc] init];
    }
    return theManager;
}

- (id)init
{
    self = [super init];

    persons = [[NSMutableArray alloc] init];

    // test data
    Person *p;
    p = [[[Person alloc] init] autorelease];
    p.name = @"作者";
    [p setDate:[[[SimpleDate alloc] initWithYear:1970 month:1 day:1] autorelease] type:EV_AGE];
    [p setDate:[[[SimpleDate alloc] initWithYear:2005 month:1 day:1] autorelease] type:EV_MARRIAGE];
    [persons addObject:p];

    p = [[[Person alloc] init] autorelease];
    p.name = @"父";
    [p setDate:[[[SimpleDate alloc] initWithYear:1944 month:1 day:1] autorelease] type:EV_AGE];
    [p setDate:[[[SimpleDate alloc] initWithYear:1970 month:1 day:1] autorelease] type:EV_MARRIAGE];
    [p setDate:[[[SimpleDate alloc] initWithYear:1990 month:1 day:1] autorelease] type:EV_DEATH];
    [persons addObject:p];

    return self;
}

// 全員分のイベントを収集する
- (NSMutableArray *)matchEvent:(int)year
{
    NSMutableArray *ary = [[[NSMutableArray alloc] init] autorelease];
    
    for (Person *person in persons) {
        [person matchEvent:year array:ary];
    }
    return ary;
}

@end
