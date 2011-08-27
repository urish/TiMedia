//
//  TiMediaCMTimeProxy.h
//  timedia
//
//  Created by Uri Shaked on 8/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TiProxy.h"
#include <CoreMedia/CoreMedia.h>

@interface TiMediaCMTimeProxy : TiProxy
{
    CMTime _time;
}

- (id)initWithTime: (CMTime)value;

@property CMTime time;

@end
