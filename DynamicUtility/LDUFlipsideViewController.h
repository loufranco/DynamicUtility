//
//  LDUFlipsideViewController.h
//  DynamicUtility
//
//  Created by Louis Franco on 9/29/13.
//  Copyright (c) 2013 Lou Franco. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LDUFlipsideViewController;

@protocol LDUFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(LDUFlipsideViewController *)controller;
@end

@interface LDUFlipsideViewController : UIViewController

@property (weak, nonatomic) id <LDUFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
