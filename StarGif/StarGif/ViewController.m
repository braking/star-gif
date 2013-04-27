//
//  ViewController.m
//  StarGif
//
//  Created by Brandon King on 4/25/13.
//  Copyright (c) 2013 King's Cocoa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *starImageView;
@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSMutableArray *starImageArray = [@[] mutableCopy];
    for (int i = 0; i < 8; i++) {
        UIImage *starImage = [UIImage imageNamed:[NSString stringWithFormat:@"star_%d", i]];
        [starImageArray addObject:starImage];
    }

    self.starImageView.animationImages = starImageArray;
    self.starImageView.animationRepeatCount = 1;
    self.starImageView.animationDuration = 0.267;

    self.starImageView.image = starImageArray[0];
}

- (IBAction)animateButtonTouched
{
    if (!self.starImageView.isAnimating) {
        [self.starImageView startAnimating];
        [self.starImageView setImage:[self.starImageView.animationImages lastObject]];
        [self performSelector:@selector(starAnimationDidFinish) withObject:nil afterDelay:self.starImageView.animationDuration];
    }
}

- (void)starAnimationDidFinish
{
    NSArray *reversedImages = [[self.starImageView.animationImages reverseObjectEnumerator] allObjects];
    self.starImageView.animationImages = reversedImages;
}

@end
