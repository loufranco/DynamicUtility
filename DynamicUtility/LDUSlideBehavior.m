//
//  LDUSlideBehavior.m
//  DynamicUtility
//
//  Created by Louis Franco on 9/29/13.
//  Copyright (c) 2013 Lou Franco. All rights reserved.
//

#import "LDUSlideBehavior.h"

@implementation LDUSlideBehavior

-(instancetype) initWithItem:(UIView*)item
{
    if (self = [super init]) {
        // create a pan gesture
        self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
        [item addGestureRecognizer:self.pan];
        
        // attach the view to a spring
        self.attachment = [[UIAttachmentBehavior alloc] initWithItem:item
            attachedToAnchor:CGPointMake(item.center.x, item.center.y)];
        self.attachment.damping = .1;
        self.attachment.frequency = 5.0;
        
        // make a boundary
        UICollisionBehavior * collision = [[UICollisionBehavior alloc] initWithItems:@[item]];
        [collision setTranslatesReferenceBoundsIntoBoundaryWithInsets:
            UIEdgeInsetsMake(-item.superview.bounds.size.height, 0, 0, 0)];
        collision.collisionMode = UICollisionBehaviorModeBoundaries;
        [self addChildBehavior:collision];

        // add a gravitational field
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[item]];
        [self addChildBehavior:gravity];
        
        // behavior parameters for the view
        self.behavior = [[UIDynamicItemBehavior alloc] initWithItems:@[item]];
        self.behavior.allowsRotation = NO;
        self.behavior.elasticity = .4;
        self.behavior.resistance = .7;
        [self addChildBehavior:self.behavior];
    }
    return self;
}

-(void)onPan:(UIPanGestureRecognizer*)pan
{
    if (pan.state == UIGestureRecognizerStateBegan) {
        [self addChildBehavior:self.attachment];
    }
    else if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint delta = [pan translationInView:pan.view.superview];
        self.attachment.anchorPoint =
            CGPointMake(self.attachment.anchorPoint.x,
                        self.attachment.anchorPoint.y + delta.y);
        [pan setTranslation:CGPointZero inView:pan.view.superview];
    }
    else if (pan.state == UIGestureRecognizerStateEnded ||
             pan.state == UIGestureRecognizerStateCancelled ||
             pan.state == UIGestureRecognizerStateFailed) {
        [self removeChildBehavior:self.attachment];
        // impart the velocity to the view when we let it go
        [self.behavior addLinearVelocity:
            [pan velocityInView:pan.view.superview] forItem:pan.view];
    }
}

-(void) dealloc
{
    [self.pan removeTarget:self action:@selector(onPan:)];
    [self.pan.view removeGestureRecognizer:self.pan];
}

@end
