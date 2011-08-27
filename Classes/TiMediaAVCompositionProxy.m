//
//  TiMediaAVCompositionProxy.m
//  timedia
//
//  Created by Uri Shaked on 8/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TiMediaAVCompositionProxy.h"

@implementation TiMediaAVCompositionProxy

@synthesize composition = _composition;

- (id)init
{
    self = [super init];
    if (self) {
        self.composition = [[AVMutableComposition composition] retain];
    }
    
    return self;
}

- (id)createAudioTrack {
    AVMutableCompositionTrack *track = [self.composition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];
    return [[[TiMediaAVCompositionTrackProxy alloc] initWithTrack: track] autorelease];
}

- (id)createVideoTrack {
    AVMutableCompositionTrack *track = [self.composition addMutableTrackWithMediaType:AVMediaTypeVideo preferredTrackID:kCMPersistentTrackID_Invalid];
    return [[[TiMediaAVCompositionTrackProxy alloc] initWithTrack: track] autorelease];
}

- (void)dealloc{
    self.composition = nil;
    [super dealloc];
}

@end
