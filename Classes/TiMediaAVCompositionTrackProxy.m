//
//  TiMediaAVCompositionTrackProxy.m
//  timedia
//
//  Created by Uri Shaked on 8/27/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#import "TiMediaAVCompositionTrackProxy.h"
#import "TiMediaCMTimeProxy.h"
#import "TiMediaAVURLAssetProxy.h"
#import "TiMediaCMTimeRangeProxy.h"

@implementation TiMediaAVCompositionTrackProxy

@synthesize track = _track;

- (id)initWithTrack:(AVCompositionTrack *)track
{
    self = [super init];
    if (self) {
        self.track = track;
    }
    
    return self;
}

- (AVMutableCompositionTrack*) mutableTrack {
    return (AVMutableCompositionTrack*)self.track;
}

- (id)insertAudio:(id)args {
    TiMediaCMTimeProxy *targetTime = [args objectAtIndex:0];
    TiMediaAVAssetProxy *source = [args objectAtIndex:1];
    TiMediaCMTimeRangeProxy *sourceRange = [args objectAtIndex:2];
    AVCompositionTrack *sourceTrack = [[source.asset tracksWithMediaType:AVMediaTypeAudio] objectAtIndex: 0];
    [self.mutableTrack insertTimeRange:sourceRange.timeRange ofTrack:sourceTrack atTime:targetTime.time error:nil];
    return nil;
}

- (id)insertVideo:(id)args {
    TiMediaCMTimeProxy *targetTime = [args objectAtIndex:0];
    TiMediaAVAssetProxy *source = [args objectAtIndex:1];
    TiMediaCMTimeRangeProxy *sourceRange = [args objectAtIndex:2];
    AVCompositionTrack *sourceTrack = [[source.asset tracksWithMediaType:AVMediaTypeVideo] objectAtIndex: 0];
    [self.mutableTrack insertTimeRange:sourceRange.timeRange ofTrack:sourceTrack atTime:targetTime.time error:nil];
    return nil;
}

- (id)insertTrack:(id)args {
    TiMediaCMTimeProxy *targetTime = [args objectAtIndex:0];
    TiMediaAVCompositionTrackProxy *source = [args objectAtIndex:1];
    TiMediaCMTimeRangeProxy *sourceRange = [args objectAtIndex:2];
    [self.mutableTrack insertTimeRange:sourceRange.timeRange ofTrack:source.track atTime:targetTime.time error:nil];
    return nil;
}

- (void)dealloc {
    self.track = nil;
    [super dealloc];
}

@end
