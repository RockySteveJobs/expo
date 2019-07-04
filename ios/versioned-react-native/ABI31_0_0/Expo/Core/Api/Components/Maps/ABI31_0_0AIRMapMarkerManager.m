/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "ABI31_0_0AIRMapMarkerManager.h"

#import <ReactABI31_0_0/ABI31_0_0RCTConvert+CoreLocation.h>
#import <ReactABI31_0_0/ABI31_0_0RCTUIManager.h>
#import <ReactABI31_0_0/UIView+ReactABI31_0_0.h>
#import "ABI31_0_0AIRMapMarker.h"

@interface ABI31_0_0AIRMapMarkerManager () <MKMapViewDelegate>

@end

@implementation ABI31_0_0AIRMapMarkerManager

ABI31_0_0RCT_EXPORT_MODULE()

- (UIView *)view
{
    ABI31_0_0AIRMapMarker *marker = [ABI31_0_0AIRMapMarker new];
    [marker addTapGestureRecognizer];
    marker.bridge = self.bridge;
    return marker;
}

ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(identifier, NSString)
//ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(reuseIdentifier, NSString)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(title, NSString)
ABI31_0_0RCT_REMAP_VIEW_PROPERTY(description, subtitle, NSString)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(coordinate, CLLocationCoordinate2D)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(centerOffset, CGPoint)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(calloutOffset, CGPoint)
ABI31_0_0RCT_REMAP_VIEW_PROPERTY(image, imageSrc, NSString)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(pinColor, UIColor)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(draggable, BOOL)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(zIndex, NSInteger)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(opacity, double)

ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(onPress, ABI31_0_0RCTBubblingEventBlock)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(onSelect, ABI31_0_0RCTDirectEventBlock)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(onDeselect, ABI31_0_0RCTDirectEventBlock)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(onCalloutPress, ABI31_0_0RCTDirectEventBlock)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(onDragStart, ABI31_0_0RCTDirectEventBlock)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(onDrag, ABI31_0_0RCTDirectEventBlock)
ABI31_0_0RCT_EXPORT_VIEW_PROPERTY(onDragEnd, ABI31_0_0RCTDirectEventBlock)


ABI31_0_0RCT_EXPORT_METHOD(showCallout:(nonnull NSNumber *)ReactABI31_0_0Tag)
{
    [self.bridge.uiManager addUIBlock:^(__unused ABI31_0_0RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        id view = viewRegistry[ReactABI31_0_0Tag];
        if (![view isKindOfClass:[ABI31_0_0AIRMapMarker class]]) {
            ABI31_0_0RCTLogError(@"Invalid view returned from registry, expecting ABI31_0_0AIRMap, got: %@", view);
        } else {
            [(ABI31_0_0AIRMapMarker *) view showCalloutView];
        }
    }];
}

ABI31_0_0RCT_EXPORT_METHOD(hideCallout:(nonnull NSNumber *)ReactABI31_0_0Tag)
{
    [self.bridge.uiManager addUIBlock:^(__unused ABI31_0_0RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        id view = viewRegistry[ReactABI31_0_0Tag];
        if (![view isKindOfClass:[ABI31_0_0AIRMapMarker class]]) {
            ABI31_0_0RCTLogError(@"Invalid view returned from registry, expecting ABI31_0_0AIRMap, got: %@", view);
        } else {
            [(ABI31_0_0AIRMapMarker *) view hideCalloutView];
        }
    }];
}

@end
