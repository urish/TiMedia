//
//  TiMediaAVAssetExportSession.m
//  timedia
//
//  Created by Uri Shaked on 8/27/11.
//  Copyright 2011 Uri Shaked. All rights reserved.
//

#import "TiMediaAVAssetExportSession.h"
#import "TiMediaCMTimeProxy.h"
#import "TiMediaAVAudioMixProxy.h"
#import "TiUtils.h"

@implementation TiMediaAVAssetExportSession

@synthesize exportSession = _exportSession;

- (id)initWithExportSession:(AVAssetExportSession *)exportSession
{
    self = [super init];
    if (self) {
        self.exportSession = exportSession;
    }
    
    return self;
}

- (id)audioMix {
    if (self.exportSession.audioMix) {
        return [[[TiMediaAVAudioMixProxy alloc] initWithAudioMix:self.exportSession.audioMix] autorelease];
    } else {
        return nil;
    }
}

- (void)setAudioMix:(id)value {
    self.exportSession.audioMix = value ? ((TiMediaAVAudioMixProxy*)value).audioMix : nil;
}

- (id)error {
    return self.exportSession.error;
}

- (id)fileLengthLimit {
    return NUMLONGLONG(self.exportSession.fileLengthLimit);
}

- (void)setFileLengthLimit: (id)value {
    self.exportSession.fileLengthLimit = [TiUtils intValue:value];
}

- (id)maxDuration {
    return [[[TiMediaCMTimeProxy alloc] initWithTime:self.exportSession.maxDuration] autorelease];
}

- (id)outputURL {
    return self.exportSession.outputURL.absoluteString;
}

- (void)setOutputURL: (id)value {
    self.exportSession.outputURL = [NSURL URLWithString:[TiUtils stringValue: value]];
}

- (id)outputFileType {
    return self.exportSession.outputFileType;
}

- (void)setOutputFileType: (id)value {
    self.exportSession.outputFileType = [TiUtils stringValue: value];
}

- (id)progress {
    return NUMFLOAT(self.exportSession.progress);
}

- (id)shouldOptimizeForNetworkUse {
    return NUMFLOAT(self.exportSession.shouldOptimizeForNetworkUse);
}

- (void)setShouldOptimizeForNetworkUse: (id)value {
    self.exportSession.shouldOptimizeForNetworkUse = [TiUtils boolValue:value];
}

- (id)status {
    switch (self.exportSession.status) {
        case AVAssetExportSessionStatusCancelled:
            return @"cancelled";
        case AVAssetExportSessionStatusCompleted:
            return @"completed";
        case AVAssetExportSessionStatusExporting:
            return @"exporting";
        case AVAssetExportSessionStatusFailed:
            return @"failed";
        case AVAssetExportSessionStatusUnknown:
            return @"unknown";
        case AVAssetExportSessionStatusWaiting:
            return @"waiting";
        default:
            return @"unknown";
    }
}

- (id)cancelExport: (id)args {
    [self.exportSession cancelExport];
    return nil;
}

- (id)start:(id)args {
    [self.exportSession retain];
    NSLog(@"Starting export session (outputURL=%@, outputFileType=%@)", self.exportSession.outputURL, self.exportSession.outputFileType);
    [self.exportSession exportAsynchronouslyWithCompletionHandler: ^{
        NSLog(@"Media export completed, status=%@", [self status]);
        NSString *status = [self status];
        NSDictionary * params = [NSMutableDictionary dictionary];
        [params setValue: status forKey: @"status"];
        [params setValue: self.exportSession.error.description forKey: @"error"];
        [params setValue: NUMINT((self.exportSession.error != nil ? self.exportSession.error.code : 0)) forKey: @"errorCode"];
        [self fireEvent:@"complete" withObject:params];
        [self.exportSession autorelease];
    }];
    return nil;
}

- (void)dealloc {
    self.exportSession = nil;
    [super dealloc];
}

@end
