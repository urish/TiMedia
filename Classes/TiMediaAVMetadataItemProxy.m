//
//  TiMediaAVMetadataItemProxy.m
//  timedia
//
//  Created by Uri Shaked on 8/29/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#import "TiMediaAVMetadataItemProxy.h"
#import "TiMediaCMTimeProxy.h"
#import "TiUtils.h"

@implementation TiMediaAVMetadataItemProxy

@synthesize metadataItem = _metadataItem;

-(id) initWithMetadataItem: (AVMetadataItem*) metadataItem
{
    self = [super init];
    if (self) {
        self.metadataItem = metadataItem;
    }
    
    return self;
}

-(AVMutableMetadataItem*)mutableMetadataItem {
    return (AVMutableMetadataItem*)self.metadataItem;
}

-(id)description {
    return self.metadataItem.description;
}

-(id)duration {
    return [[[TiMediaCMTimeProxy alloc] initWithTime:self.metadataItem.duration] autorelease];
}

-(void)setDuration:(id)value {
    TiMediaCMTimeProxy *timeProxy = value;
    self.mutableMetadataItem.duration = timeProxy.time;
}

-(id)key {
    return self.metadataItem.key;
}

-(void)setKey:(id)value {
    self.mutableMetadataItem.key = value;
}

-(id)keySpace {
    return self.metadataItem.keySpace;
}

-(void)setKeySpace:(id)value {
    self.mutableMetadataItem.keySpace = [TiUtils stringValue: value];
}

-(id)time {
    return [[[TiMediaCMTimeProxy alloc] initWithTime:self.metadataItem.time] autorelease];
}

-(void)setTime:(id)value {
    TiMediaCMTimeProxy *timeProxy = value;
    self.mutableMetadataItem.time = timeProxy.time;
}

-(id)value {
    return self.metadataItem.value;
}

-(void)setValue:(id)value {
    self.mutableMetadataItem.value = value;
}

-(void) dealloc {
    self.metadataItem = nil;
    [super dealloc];
}

@end
