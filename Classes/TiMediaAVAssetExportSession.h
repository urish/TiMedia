//
//  TiMediaAVAssetExportSession.h
//  timedia
//
//  Created by Uri Shaked on 8/27/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#import "TiProxy.h"
#import <AVFoundation/AVFoundation.h>

@interface TiMediaAVAssetExportSession : TiProxy
{
    AVAssetExportSession * _exportSession;
}

-(id)initWithExportSession: (AVAssetExportSession*)exportSession;

@property (nonatomic, retain) AVAssetExportSession* exportSession;

@end
