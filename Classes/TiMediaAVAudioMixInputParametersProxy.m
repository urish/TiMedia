//
//  TiMediaAVAudioMixInputParameters.m
//  timedia
//
//  Created by Uri Shaked on 8/28/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#import "TiMediaAVAudioMixInputParametersProxy.h"
#import "TiUtils.h"
#import "TiMediaCMTimeProxy.h"
#import "TiMediaCMTimeRangeProxy.h"

@implementation TiMediaAVAudioMixInputParametersProxy

@synthesize inputParameters = _inputParameters;

- (id)initWithInputParameters: (AVAudioMixInputParameters*)inputParameters
{
    self = [super init];
    if (self) {
        self.inputParameters = inputParameters;
    }
    
    return self;
}

- (AVMutableAudioMixInputParameters*)mutableInputParameters {
    return (AVMutableAudioMixInputParameters*)self.inputParameters;
}

- (id)trackID {
    return NUMINT(self.inputParameters.trackID);
}

- (void)setTrackID: (id)value {
    self.mutableInputParameters.trackID = [TiUtils intValue:value];
}

- (id)setVolume: (id)args {
    float volume = [TiUtils floatValue:[args objectAtIndex:0]];
    CMTime cmTime = ((TiMediaCMTimeProxy*)[args objectAtIndex:1]).time;
    [self.mutableInputParameters setVolume:volume atTime:cmTime];
    return nil;
}

- (id)setVolumeRange: (id)args {
    float startVolume = [TiUtils floatValue:[args objectAtIndex:0]];
    float endVolume = [TiUtils floatValue:[args objectAtIndex:1]];
    CMTimeRange timeRange = ((TiMediaCMTimeRangeProxy*)[args objectAtIndex:2]).timeRange;
    [self.mutableInputParameters setVolumeRampFromStartVolume:startVolume toEndVolume:endVolume timeRange:timeRange];
    return nil;
}

- (void)dealloc {
    self.inputParameters = nil;
    [super dealloc];
}

@end
