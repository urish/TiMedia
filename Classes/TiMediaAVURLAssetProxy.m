//
//  TiMediaAVURLAssetProxy.m
//  timedia
//
//  Created by Uri Shaked on 8/27/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#import "TiMediaAVURLAssetProxy.h"

@implementation TiMediaAVURLAssetProxy

@synthesize urlAsset = _urlAsset;

- (id)initWithUrlAsset: (AVURLAsset*)urlAsset
{
    self = [super initWithAsset: urlAsset];
    if (self) {
        self.urlAsset = urlAsset;
    }
    
    return self;
}

- (void)dealloc {
    self.urlAsset = nil;
    [super dealloc];
}

@end
