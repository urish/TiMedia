//
//  TiMediaCMTimeRangeProxy.h
//  timedia
//
//  Created by Uri Shaked on 8/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TiProxy.h"
#include <CoreMedia/CoreMedia.h>

@interface TiMediaCMTimeRangeProxy : TiProxy
{
    CMTimeRange _timeRange;
}

- (id)initWithTimeRange: (CMTimeRange)value;

@property CMTimeRange timeRange;


@end
