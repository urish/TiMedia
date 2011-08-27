//
//  TiMediaCMTimeProxy.m
//  timedia
//
//  Created by Uri Shaked on 8/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TiMediaCMTimeProxy.h"

@implementation TiMediaCMTimeProxy

@synthesize time = _time;

- (id)initWithTime: (CMTime)value
{
    self = [super init];
    if (self) {
        self.time = value;
    }
    
    return self;
}

- (id)value {
    return NUMINT(_time.value);
}

- (id)timescale {
    return NUMINT(_time.timescale);
}

- (id)flags {
    return NUMINT(_time.flags);
}

- (id)epoch {
    return NUMINT(_time.epoch);
}

- (id)add:(id)args {
    TiMediaCMTimeProxy * other = [args objectAtIndex:0];
    return [[[TiMediaCMTimeProxy alloc] initWithTime: CMTimeAdd(self.time, other.time)] autorelease];
}

- (id)subtarct:(id)args {
    TiMediaCMTimeProxy * other = [args objectAtIndex:0];
    return [[[TiMediaCMTimeProxy alloc] initWithTime: CMTimeSubtract(self.time, other.time)] autorelease];
}

- (id)compare:(id)args {
    TiMediaCMTimeProxy * other = [args objectAtIndex:0];
    return NUMINT(CMTimeCompare(self.time, other.time));
}

@end
