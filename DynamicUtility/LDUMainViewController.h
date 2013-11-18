//
//  LDUMainViewController.h
//  DynamicUtility
//
//  Created by Louis Franco on 9/29/13.
//  Copyright (c) 2013 Lou Franco. All rights reserved.
//

#import "LDUFlipsideViewController.h"

@interface LDUMainViewController : UIViewController <LDUFlipsideViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UISegmentedControl *uiStyleSegment;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer* panManualStyle;
@property (strong, nonatomic) UIDynamicAnimator* animator;

- (IBAction)onPan:(UIPanGestureRecognizer*)pan;
- (IBAction)onSegmentChanged:(id)sender;

@end
