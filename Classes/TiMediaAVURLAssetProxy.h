//
//  TiMediaAVURLAssetProxy.h
//  timedia
//
//  Created by Uri Shaked on 8/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TiProxy.h"
#import <AVFoundation/AVFoundation.h>
#import "TiMediaAVAssetProxy.h"

@interface TiMediaAVURLAssetProxy : TiMediaAVAssetProxy
{
    AVURLAsset * _urlAsset;
}

- (id)initWithUrlAsset: (AVURLAsset*)urlAsset;

@property (nonatomic, retain) AVURLAsset * urlAsset;

@end
