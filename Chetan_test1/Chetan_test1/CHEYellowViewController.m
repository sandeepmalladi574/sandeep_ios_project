//
//  CHEYellowViewController.m
//  Chetan_test1
//
//  Created by User1 on 2014-06-06.
//  Copyright (c) 2014 Cester College. All rights reserved.
//

#import "CHEYellowViewController.h"


@interface CHEYellowViewController ()
@property (weak, nonatomic) IBOutlet UIButton *actionButton1;
@property (weak, nonatomic) IBOutlet UIButton *actionButton2;
@property (weak, nonatomic) IBOutlet UIButton *actionButton3;
@property (weak, nonatomic) IBOutlet UIButton *actionButton4;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation CHEYellowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doLayoutForOrientation:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    [self doLayoutForOrientation:[NSNotificationCenter defaultCenter] ];
	// Do any additional setup after loading the view, typically from a nib.
//    UIApplication *app = [UIApplication sharedApplication];
//    UIInterfaceOrientation currentOrientation = app.statusBarOrientation;
//    [self doLayoutForOrientation:currentOrientation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)doLayoutForOrientation:(UIInterfaceOrientation)orientation {
- (void)doLayoutForOrientation:(NSNotificationCenter *) notification
{
    UIApplication *app = [UIApplication sharedApplication];
    UIInterfaceOrientation orientation = app.statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        [self layoutPortrait];
    } else {
        [self layoutLandscape];
    }
}

static const CGFloat buttonHeight = 30;
static const CGFloat buttonWidth = 100;
static const CGFloat spacing = 20;

- (void)layoutPortrait {
    CGRect b = self.view.bounds;
    
    CGFloat contentWidth = CGRectGetWidth(b) - (2 * spacing);
    CGFloat contentHeight = CGRectGetHeight(b) - (4 * spacing) -
    (4 * buttonHeight);
    
    self.contentView.frame = CGRectMake(spacing, spacing,
                                        contentWidth, contentHeight);
    
    CGFloat buttonRow1y = contentHeight + (2 * spacing);
    CGFloat buttonRow2y = buttonRow1y + buttonHeight +  spacing;
    
    CGFloat buttonCol1x = spacing;
    CGFloat buttonCol2x = CGRectGetWidth(b) - buttonWidth - spacing;
    
    self.actionButton1.frame = CGRectMake(buttonCol1x, buttonRow1y,
                                          buttonWidth, buttonHeight);
    
    self.actionButton2.frame = CGRectMake(buttonCol2x, buttonRow1y,
                                          buttonWidth, buttonHeight);
    
    self.actionButton3.frame = CGRectMake(buttonCol1x, buttonRow2y,
                                          buttonWidth, buttonHeight);
    
    self.actionButton4.frame = CGRectMake(buttonCol2x, buttonRow2y,
                                          buttonWidth, buttonHeight);
}

//- (void)layoutLandscape {
//    CGRect b = self.view.bounds;
//    
//    CGFloat contentWidth = CGRectGetWidth(b) - buttonWidth - (3 * spacing);
//    CGFloat contentHeight = CGRectGetHeight(b) - (2 * spacing);
//    
//    self.contentView.frame = CGRectMake(spacing, spacing,
//                                        contentWidth, contentHeight);
//    
//    CGFloat buttonX = CGRectGetWidth(b) - buttonWidth - spacing;
//    CGFloat buttonRow1y = spacing;
//    CGFloat buttonRow4y = CGRectGetHeight(b) - buttonHeight - spacing;
//    CGFloat buttonRow2y = buttonRow1y + floor((buttonRow4y - buttonRow1y)
//                                              * 0.333);
//    CGFloat buttonRow3y = buttonRow1y + floor((buttonRow4y - buttonRow1y)
//                                              * 0.667);
//    
//    self.actionButton1.frame = CGRectMake(buttonX, buttonRow1y,
//                                          buttonWidth, buttonHeight);
//    
//    self.actionButton2.frame = CGRectMake(buttonX, buttonRow2y,
//                                          buttonWidth, buttonHeight);
//    
//    self.actionButton3.frame = CGRectMake(buttonX, buttonRow3y,
//                                          buttonWidth, buttonHeight);
//    
//    self.actionButton4.frame = CGRectMake(buttonX, buttonRow4y,
//                                          buttonWidth, buttonHeight);
//}
- (void)layoutLandscape {
    CGRect b = self.view.bounds;
    
    CGFloat contentWidth = CGRectGetHeight(b) - buttonWidth - (3 * spacing);
    CGFloat contentHeight = CGRectGetWidth(b) - (4 * spacing);
    
    self.contentView.frame = CGRectMake(spacing, spacing,
                                        contentWidth, contentHeight);
    
    CGFloat buttonX = CGRectGetHeight(b) - buttonWidth - spacing;
    CGFloat buttonRow1y = spacing;
    CGFloat buttonRow4y = CGRectGetWidth(b) - buttonHeight - (4 * spacing);
    CGFloat buttonRow2y = buttonRow1y + floor((buttonRow4y - buttonRow1y)
                                              * 0.333);
    CGFloat buttonRow3y = buttonRow1y + floor((buttonRow4y - buttonRow1y)
                                              * 0.667);
    
    self.actionButton1.frame = CGRectMake(buttonX, buttonRow1y,
                                          buttonWidth, buttonHeight);
    
    self.actionButton2.frame = CGRectMake(buttonX, buttonRow2y,
                                          buttonWidth, buttonHeight);
    
    self.actionButton3.frame = CGRectMake(buttonX, buttonRow3y,
                                          buttonWidth, buttonHeight);
    
    self.actionButton4.frame = CGRectMake(buttonX, buttonRow4y,
                                          buttonWidth, buttonHeight);
}
@end
