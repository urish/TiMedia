//
//  TiMediaAVAudioMixProxy.m
//  timedia
//
//  Created by Uri Shaked on 8/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TiMediaAVAudioMixProxy.h"
#import "TiMediaAVAudioMixInputParametersProxy.h"

@implementation TiMediaAVAudioMixProxy

@synthesize audioMix = _audioMix;

- (id)initWithAudioMix: (AVAudioMix*)audioMix
{
    self = [super init];
    if (self) {
        self.audioMix = audioMix;
    }
    
    return self;
}

- (id)inputParameters {
    NSMutableArray * result = [NSMutableArray arrayWithCapacity:self.audioMix.inputParameters.count];
    for (AVAudioMixInputParameters *inputParams in self.audioMix.inputParameters) {
        [result addObject:[[[TiMediaAVAudioMixInputParametersProxy alloc] initWithInputParameters:inputParams] autorelease]];
    }
    return result;
}

- (void)setInputParameters: (id)value {
    NSArray *inputArray = (NSArray*)value;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:inputArray.count];
    for (TiMediaAVAudioMixInputParametersProxy *inputParamsProxy in inputArray) {
        [array addObject:inputParamsProxy.inputParameters];
    }
    ((AVMutableAudioMix*)self.audioMix).inputParameters = array;
}

- (void)dealloc {
    self.audioMix = nil;
    [super dealloc];
}

@end
