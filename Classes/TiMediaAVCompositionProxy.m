//
//  TiMediaAVCompositionProxy.m
//  timedia
//
//  Created by Uri Shaked on 8/26/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#import "TiMediaAVCompositionProxy.h"
#import "TiMediaAVCompositionTrackProxy.h"

@implementation TiMediaAVCompositionProxy

@synthesize composition = _composition;

- (id)initWithComposition: (AVMutableComposition*)composition
{
    self = [super initWithAsset:composition];
    if (self) {
        self.composition = composition;
    }
    
    return self;
}

- (id)createAudioTrack:(id)args {
    AVMutableCompositionTrack *track = [self.composition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];
    return [[[TiMediaAVCompositionTrackProxy alloc] initWithTrack: track] autorelease];
}

- (id)createVideoTrack:(id)args {
    AVMutableCompositionTrack *track = [self.composition addMutableTrackWithMediaType:AVMediaTypeVideo preferredTrackID:kCMPersistentTrackID_Invalid];
    return [[[TiMediaAVCompositionTrackProxy alloc] initWithTrack: track] autorelease];
}

- (void)dealloc{
    self.composition = nil;
    [super dealloc];
}

@end
