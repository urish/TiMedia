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
    AVMutableCompositionTrack *_track;
}

-(id)initWithTrack: (AVMutableCompositionTrack*)track;

@property (nonatomic, retain) AVMutableCompositionTrack *track;

@end
