//
//  TiMediaAVCompositionTrackProxy.h
//  timedia
//
//  Created by Uri Shaked on 8/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TiProxy.h"
#include <AVFoundation/AVFoundation.h>

@interface TiMediaAVCompositionTrackProxy : TiProxy
{
    AVCompositionTrack *_track;
}

-(id)initWithTrack: (AVCompositionTrack*)track;

@property (nonatomic, retain) AVCompositionTrack *track;

@end
