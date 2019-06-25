//
//  MRMyTrackerParams.h
//  myTrackerSDK 1.7.8
//
//  Created by Timur Voloshin on 17.06.16.
//  Copyright © 2016 Mail.ru Group. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MRTrackerParams;
typedef NS_ENUM(NSInteger, MRGender)
{
	MRGenderUnspecified=-1,
	MRGenderUnknown,
	MRGenderMale,
	MRGenderFemale
};

typedef NS_ENUM(NSUInteger, MRLocationTrackingMode)
{
	MRLocationTrackingModeNone,
	MRLocationTrackingModeCached,
	MRLocationTrackingModeActive
};

typedef NS_ENUM(NSUInteger, MRRegion)
{
    MRRegionNotSet = 0,
	MRRegionEu,
	MRRegionRu
};

@interface MRMyTrackerParams : NSObject

@property(nonatomic, readonly, copy, nullable) NSString *trackerId;
@property(nonatomic) BOOL trackLaunch;
@property(nonatomic) BOOL autotrackPurchase;
@property(nonatomic) NSTimeInterval launchTimeout;
@property(nonatomic) NSTimeInterval bufferingPeriod;
@property(nonatomic) NSTimeInterval forcingPeriod;
@property(nonatomic) MRLocationTrackingMode locationTrackingMode;
@property(nonatomic) BOOL trackEnvironment;
@property(nonatomic, copy, nullable) NSString *trackerHost DEPRECATED_MSG_ATTRIBUTE("Use `proxyHost` property instead.");
@property(nonatomic, copy, nullable) NSString *proxyHost;
@property(nonatomic) MRRegion region;

@property(nonatomic) MRGender gender;
@property(nonatomic, nullable) NSNumber *age;
@property(nonatomic, copy, nullable) NSString *language;

@property(nonatomic, copy, nullable) NSString *mrgsAppId;
@property(nonatomic, copy, nullable) NSString *mrgsUserId;
@property(nonatomic, copy, nullable) NSString *mrgsDeviceId;

@property(nonatomic, copy, nullable) NSString *icqId;
@property(nonatomic, copy, nullable) NSString *okId;
@property(nonatomic, copy, nullable) NSString *vkId;
@property(nonatomic, copy, nullable) NSString *email;
@property(nonatomic, copy, nullable) NSString *phone;
@property(nonatomic, copy, nullable) NSString *customUserId;

@property(nonatomic, nullable) NSArray<NSString *> *icqIds;
@property(nonatomic, nullable) NSArray<NSString *> *okIds;
@property(nonatomic, nullable) NSArray<NSString *> *vkIds;
@property(nonatomic, nullable) NSArray<NSString *> *emails;
@property(nonatomic, nullable) NSArray<NSString *> *phones;
@property(nonatomic, nullable) NSArray<NSString *> *customUserIds;

- (nullable instancetype)initWithParams:(MRTrackerParams *)trackerParams;

@end

NS_ASSUME_NONNULL_END
