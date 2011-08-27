//
//  TiMediaAVCompositionProxy.h
//  timedia
//
//  Created by Uri Shaked on 8/26/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#include <AVFoundation/AVFoundation.h>
#import "TiProxy.h"
#import "TiMediaAVAssetProxy.h"

@interface TiMediaAVCompositionProxy : TiMediaAVAssetProxy
{
    AVMutableComposition * _composition;
}

- (id)initWithComposition: (AVMutableComposition*)composition;

@property (nonatomic,retain) AVMutableComposition *composition;

@end
