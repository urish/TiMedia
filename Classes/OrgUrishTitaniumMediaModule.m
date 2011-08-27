/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "OrgUrishTitaniumMediaModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiMediaAVCompositionProxy.h"
#import "TiMediaCMTimeProxy.h"
#import "TiMediaCMTimeRangeProxy.h"
#import "TiMediaAVURLAssetProxy.h"
#import "TiMediaAVAssetExportSession.h"

@implementation OrgUrishTitaniumMediaModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"7b64cc62-7375-4df6-b55c-7a265ba4e123";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"org.urish.titanium.media";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Consts
-(id)AVAssetExportPresetLowQuality {
    return AVAssetExportPresetLowQuality;
}
-(id)AVAssetExportPresetMediumQuality {
    return AVAssetExportPresetMediumQuality;
}
-(id)AVAssetExportPresetHighestQuality {
    return AVAssetExportPresetHighestQuality;
}
-(id)AVAssetExportPreset640x480 {
    return AVAssetExportPreset640x480;
}
-(id)AVAssetExportPreset960x540 {
    return AVAssetExportPreset960x540;
}
-(id)AVAssetExportPreset1280x720 {
    return AVAssetExportPreset1280x720;
}
-(id)AVAssetExportPresetAppleM4A {
    return AVAssetExportPresetAppleM4A;
}
-(id)AVAssetExportPresetPassthrough {
    return AVAssetExportPresetPassthrough;
}

#pragma Public APIs

-(id)createAVComposition:(id)args
{
	return [[[TiMediaAVCompositionProxy alloc] initWithComposition:[AVMutableComposition composition]] autorelease];
}

-(id)createAVURLAsset:(id)args
{
    NSString *url = [args objectAtIndex:0];
    NSURL *urlUrl = [NSURL URLWithString:url];
    return [[[TiMediaAVURLAssetProxy alloc] initWithAsset:[AVURLAsset URLAssetWithURL:urlUrl options:nil]] autorelease];
}

-(id)createAVAssetExportSession:(id)args 
{
    TiMediaAVAssetProxy *assetProxy = [args objectAtIndex:0];
    NSString *presetName = [args objectAtIndex:1];
    
    AVAssetExportSession *exportSession = [[AVAssetExportSession alloc] initWithAsset: assetProxy.asset presetName:presetName];
    return [[[TiMediaAVAssetExportSession alloc] initWithExportSession: exportSession] autorelease];
}

-(id)zeroTime
{
	return [[[TiMediaCMTimeProxy alloc] initWithTime: kCMTimeZero] autorelease];
}

-(id)makeCMTime:(id)args
{
    int value = [[args objectAtIndex:0] intValue];
    int timescale = [[args objectAtIndex:1] intValue];
    return [[[TiMediaCMTimeProxy alloc] initWithTime: CMTimeMake(value, timescale)] autorelease];
}

-(id)makeCMTimeRange:(id)args
{
    CMTime start = ((TiMediaCMTimeProxy*)[args objectAtIndex:0]).time;
    CMTime duration = ((TiMediaCMTimeProxy*)[args objectAtIndex:1]).time;
    return [[[TiMediaCMTimeRangeProxy alloc] initWithTimeRange: CMTimeRangeMake(start, duration)] autorelease];
}

@end
