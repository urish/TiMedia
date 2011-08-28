//
//  TiMediaAVAudioMixInputParameters.h
//  timedia
//
//  Created by Uri Shaked on 8/28/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#import "TiProxy.h"
#import <AVFoundation/AVFoundation.h>

@interface TiMediaAVAudioMixInputParametersProxy : TiProxy
{
    @private
    AVAudioMixInputParameters *_inputParameters;
}

- (id)initWithInputParameters: (AVAudioMixInputParameters*)inputParameters;

@property (nonatomic, retain) AVAudioMixInputParameters* inputParameters;

@end
