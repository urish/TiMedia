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

- (id)initWithTrack:(AVMutableCompositionTrack *)track
{
    self = [super init];
    if (self) {
        self.track = track;
    }
    
    return self;
}

- (id)insertAudio:(id)args {
    TiMediaCMTimeProxy *targetTime = [args objectAtIndex:0];
    TiMediaAVURLAssetProxy *source = [args objectAtIndex:1];
    TiMediaCMTimeRangeProxy *sourceRange = [args objectAtIndex:2];
    AVCompositionTrack *sourceTrack = [[source.urlAsset tracksWithMediaType:AVMediaTypeAudio] objectAtIndex: 0];
    [self.track insertTimeRange:sourceRange.timeRange ofTrack:sourceTrack atTime:targetTime.time error:nil];
    return nil;
}

- (id)insertVideo:(id)args {
    TiMediaCMTimeProxy *targetTime = [args objectAtIndex:0];
    TiMediaAVURLAssetProxy *source = [args objectAtIndex:1];
    TiMediaCMTimeRangeProxy *sourceRange = [args objectAtIndex:2];
    AVCompositionTrack *sourceTrack = [[source.urlAsset tracksWithMediaType:AVMediaTypeVideo] objectAtIndex: 0];
    [self.track insertTimeRange:sourceRange.timeRange ofTrack:sourceTrack atTime:targetTime.time error:nil];
    return nil;
}

- (id)insertTrack:(id)args {
    TiMediaCMTimeProxy *targetTime = [args objectAtIndex:0];
    TiMediaAVCompositionTrackProxy *source = [args objectAtIndex:1];
    TiMediaCMTimeRangeProxy *sourceRange = [args objectAtIndex:2];
    [self.track insertTimeRange:sourceRange.timeRange ofTrack:source.track atTime:targetTime.time error:nil];
    return nil;
}

- (void)dealloc {
    self.track = nil;
    [super dealloc];
}

@end
