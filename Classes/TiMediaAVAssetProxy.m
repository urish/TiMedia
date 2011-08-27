//
//  TiMediaAVAssetProxy.m
//  timedia
//
//  Created by Uri Shaked on 8/27/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#import "TiMediaAVAssetProxy.h"
#import "TiMediaCMTimeProxy.h"
#import "TiMediaAVCompositionTrackProxy.h"

@implementation TiMediaAVAssetProxy

@synthesize asset = _asset;

- (id)initWithAsset: (AVAsset*)asset
{
    self = [super init];
    if (self) {
        self.asset = asset;
    }
    
    return self;
}

- (id)duration {
    return [[[TiMediaCMTimeProxy alloc] initWithTime:self.asset.duration] autorelease];
}

- (id)descritpion {
    return self.asset.description;
}

- (id)exportable {
    return NUMBOOL(self.asset.exportable);
}

- (id)lyrics {
    return self.asset.lyrics;
}

- (id)naturalSize {
    return [NSDictionary dictionaryWithObjectsAndKeys:NUMFLOAT(self.asset.naturalSize.width), "@width", NUMFLOAT(self.asset.naturalSize.height), "@height", nil];
}

- (id)playable {
    return NUMBOOL(self.asset.isPlayable);
}

- (id)tracks {
    NSMutableArray *tracks = [NSMutableArray arrayWithCapacity:self.asset.tracks.count];
    for (AVCompositionTrack *track in self.asset.tracks) {
        [tracks addObject:[[[TiMediaAVCompositionTrackProxy alloc] initWithTrack:track] autorelease]];
    }
    return tracks;
}

- (void)dealloc {
    self.asset = nil;
    [super dealloc];
}

@end
