//
//  TiMediaCMTimeRangeProxy.m
//  timedia
//
//  Created by Uri Shaked on 8/27/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#import "TiMediaCMTimeRangeProxy.h"
#import "TiMediaCMTimeProxy.h"

@implementation TiMediaCMTimeRangeProxy

@synthesize timeRange = _timeRange;

- (id)initWithTimeRange: (CMTimeRange)value
{
    self = [super init];
    if (self) {
        self.timeRange = value;
    }
    
    return self;
}

- (id)start {
    return [[[TiMediaCMTimeProxy alloc] initWithTime:self.timeRange.start] autorelease];
}

- (id)duration {
    return [[[TiMediaCMTimeProxy alloc] initWithTime:self.timeRange.duration] autorelease];
}

@end
