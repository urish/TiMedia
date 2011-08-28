//
//  TiMediaAVAudioMixProxy.h
//  timedia
//
//  Created by Uri Shaked on 8/28/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#import "TiProxy.h"
#import <AVFoundation/AVFoundation.h>

@interface TiMediaAVAudioMixProxy : TiProxy
{
    AVAudioMix *_audioMix;
}

- (id)initWithAudioMix: (AVAudioMix*)audioMix;

@property (nonatomic, retain) AVAudioMix * audioMix;

@end
