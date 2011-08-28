//
//  TiMediaAVMetadataItemProxy.h
//  timedia
//
//  Created by Uri Shaked on 8/29/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#import "TiProxy.h"
#import <AVFoundation/AVFoundation.h>

@interface TiMediaAVMetadataItemProxy : TiProxy
{
    AVMetadataItem *_metadataItem;
}

-(id) initWithMetadataItem: (AVMetadataItem*) metadataItem;

@property (nonatomic, retain) AVMetadataItem * metadataItem;

@end
