//
//  MRMyTrackerAttribution.h
//  myTrackerSDK 1.7.8
//
//  Created by Andrey Seredkin on 27.06.17.
//  Copyright © 2017 MailRu Group. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MRMyTrackerAttribution;

@protocol MRMyTrackerAttributionDelegate <NSObject>

- (void)didReceiveAttribution:(MRMyTrackerAttribution *)attribution;

@end

@interface MRMyTrackerAttribution : NSObject

@property(nonatomic, readonly, copy, nullable) NSString *deeplink;

- (nullable instancetype)initWithDeeplink:(NSString *)deeplink;

@end

NS_ASSUME_NONNULL_END
