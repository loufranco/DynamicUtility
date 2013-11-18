//
//  LDUSlideBehavior.h
//  DynamicUtility
//
//  Created by Louis Franco on 9/29/13.
//  Copyright (c) 2013 Lou Franco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDUSlideBehavior : UIDynamicBehavior

-(instancetype) initWithItem:(UIView*) item;

@property (strong, nonatomic) UIPanGestureRecognizer* pan;
@property (strong, nonatomic) UIAttachmentBehavior *attachment;
@property (strong, nonatomic) UIDynamicItemBehavior *behavior;

@end
