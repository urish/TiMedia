//
//  TiMediaAVAssetProxy.h
//  timedia
//
//  Created by Uri Shaked on 8/27/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#import "TiProxy.h"
#include <AVFoundation/AVFoundation.h>

@interface TiMediaAVAssetProxy : TiProxy
{
    AVAsset *_asset;
}

- (id)initWithAsset: (AVAsset*)asset;

@property (nonatomic, retain) AVAsset * asset;

@end
