//
//  LogInViewController.m
//  LogInAnimation
//
//  Created by Christine Chao on 7/19/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@property(strong, nonatomic) UIImageView *rayImageView;
@property(strong, nonatomic) UIImageView *leftEyeImageView;
@property(strong, nonatomic) UIImageView *rightEyeImageView;
@property(strong, nonatomic) UIImageView *cloudImageView1;
@property(strong, nonatomic) UIImageView *cloudImageView2;
@property(strong, nonatomic) UIImageView *cloudImageView3;
@property(strong, nonatomic) UIImageView *cloudImageView4;
@property(strong, nonatomic) UIImageView *cloudImageView5;
@property(strong, nonatomic) UIImageView *cloudImageView6;
@property(strong, nonatomic) UIImageView *cloudImageView7;
@property(assign, nonatomic) BOOL animating;
@property(assign, nonatomic) CGFloat screenWidth;

@end

@implementation LogInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.screenWidth = screenRect.size.width;
    
    UIImage *rayImage = [UIImage imageNamed:@"ray"];
    self.rayImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rayImage.size.width, rayImage.size.height)];
    self.rayImageView.image = rayImage;
    
    UIImage *faceImage = [UIImage imageNamed:@"face"];
    UIImageView *faceImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.rayImageView.frame.size.width - faceImage.size.width) / 2, (self.rayImageView.frame.size.height - faceImage.size.height) / 2, faceImage.size.width, faceImage.size.height)];
    faceImageView.image = faceImage;
    
    UIImage *leftEyeImage = [UIImage imageNamed:@"eye"];
    self.leftEyeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 63, leftEyeImage.size.width, leftEyeImage.size.height)];
    self.leftEyeImageView.image = leftEyeImage;
    
    UIImage *rightEyeImage = [UIImage imageNamed:@"eye"];
    self.rightEyeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(80, 63, rightEyeImage.size.width, rightEyeImage.size.height)];
    self.rightEyeImageView.image = rightEyeImage;
    
    UIView *sunContainer = [[UIView alloc] initWithFrame:CGRectMake((self.screenWidth - self.rayImageView.frame.size.width) / 2, 30, self.rayImageView.frame.size.width, self.rayImageView.frame.size.height)];
    
    UIImage *cloud1 = [UIImage imageNamed:@"cloud1"];
    UIImage *cloud2 = [UIImage imageNamed:@"cloud2"];
    UIImage *cloud3 = [UIImage imageNamed:@"cloud3"];
    self.cloudImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, -30, cloud1.size.width, cloud1.size.height)];
    self.cloudImageView1.image = cloud1;
    [self cloudAddShadow:self.cloudImageView1];
    
    self.cloudImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 20, cloud1.size.width, cloud1.size.height)];
    self.cloudImageView2.image = cloud1;
    self.cloudImageView2.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [self cloudAddShadow:self.cloudImageView2];
    
    self.cloudImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(-10, 130, cloud2.size.width, cloud2.size.height)];
    self.cloudImageView3.image = cloud2;
    self.cloudImageView3.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [self cloudAddShadow:self.cloudImageView3];
    
    self.cloudImageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(240, 100, cloud3.size.width, cloud3.size.height)];
    self.cloudImageView4.image = cloud3;
    [self cloudAddShadow:self.cloudImageView4];
    
    self.cloudImageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 80, cloud3.size.width, cloud3.size.height)];
    self.cloudImageView5.image = cloud3;
    self.cloudImageView5.transform = CGAffineTransformMakeScale(1, -1);
    [self cloudAddShadow:self.cloudImageView5];
    
    self.cloudImageView6 = [[UIImageView alloc] initWithFrame:CGRectMake(180, 140, cloud1.size.width, cloud1.size.height)];
    self.cloudImageView6.image = cloud1;
    self.cloudImageView6.transform = CGAffineTransformMakeScale(1, -0.8);
    [self cloudAddShadow:self.cloudImageView6];
    
    self.cloudImageView7 = [[UIImageView alloc] initWithFrame:CGRectMake(self.screenWidth, 50, cloud3.size.width, cloud3.size.height)];
    self.cloudImageView7.image = cloud3;
    self.cloudImageView7.transform = CGAffineTransformMakeScale(1, 1);
    [self cloudAddShadow:self.cloudImageView7];
    
    UIView *cloudBackContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 220)];
    cloudBackContainer.clipsToBounds = YES;
    
    UIView *cloudFrontContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 220)];
    cloudFrontContainer.clipsToBounds = YES;
    
    UIImage *gradient = [UIImage imageNamed:@"gradient"];
    UIImageView *gradientImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, gradient.size.width, gradient.size.height)];
    gradientImageView.image = gradient;
    
    UIView *mainContainer = [[UIView alloc] initWithFrame:CGRectMake(10, 90, 300, 400)];
    mainContainer.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:230.0/255.0 blue:195.0/255.0 alpha:1];
    
    [cloudFrontContainer addSubview:self.cloudImageView1];
    [cloudBackContainer addSubview:self.cloudImageView2];
    [cloudFrontContainer addSubview:self.cloudImageView3];
    [cloudBackContainer addSubview:self.cloudImageView4];
    [cloudBackContainer addSubview:self.cloudImageView5];
    [cloudFrontContainer addSubview:self.cloudImageView6];
    [cloudBackContainer addSubview:self.cloudImageView7];
    [sunContainer addSubview:self.rayImageView];
    [sunContainer addSubview:faceImageView];
    [sunContainer addSubview:self.leftEyeImageView];
    [sunContainer addSubview:self.rightEyeImageView];
    [mainContainer addSubview:cloudBackContainer];
    [mainContainer addSubview:sunContainer];
    [mainContainer addSubview:cloudFrontContainer];
    [mainContainer addSubview:gradientImageView];
    [self.view addSubview:mainContainer];
    
    srandom(time(NULL));
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:(arc4random() % 3) + 5 target:self selector:@selector(blinking) userInfo:nil repeats:YES];
    

    [self cloudAnimation:self.cloudImageView1 firstDuration:3 secondDuration:15 delay:0];
    [self cloudAnimation:self.cloudImageView2 firstDuration:12 secondDuration:24 delay:0];
    [self cloudAnimation:self.cloudImageView3 firstDuration:6 secondDuration:15 delay:0];
    [self cloudAnimation:self.cloudImageView4 firstDuration:20 secondDuration:24 delay:0];
    [self cloudAnimation:self.cloudImageView5 firstDuration:4 secondDuration:24 delay:0];
    [self cloudAnimation:self.cloudImageView6 firstDuration:10 secondDuration:15 delay:0];
    [self cloudAnimation:self.cloudImageView7 firstDuration:24 secondDuration:24 delay:2];
    
    if(!self.animating) {
        self.animating = YES;
        [self rayRotateWithOptions:UIViewAnimationOptionCurveLinear];
    }
}

- (void)cloudAddShadow:(UIImageView *) cloud {
    cloud.layer.shadowColor = [UIColor grayColor].CGColor;
    cloud.layer.shadowOffset = CGRectMake(0, 0, 5, 5).size;
    cloud.layer.shadowOpacity = 0.2;
    cloud.layer.shadowRadius = 10;
}

- (void)rayRotateWithOptions:(UIViewAnimationOptions) options {
    [UIView animateWithDuration:2
                          delay:0
                        options:options
                     animations:^{
        self.rayImageView.transform = CGAffineTransformRotate(self.rayImageView.transform, M_PI / 2);
                     }
                     completion:^(BOOL finished) {
        if (finished) {
            if (self.animating) {
                // if flag still set, keep spinning with constant speed
                [self rayRotateWithOptions: UIViewAnimationOptionCurveLinear];
            } else if (options != UIViewAnimationOptionCurveEaseOut) {
                // one last spin, with deceleration
                [self rayRotateWithOptions: UIViewAnimationOptionCurveEaseOut];
            }
        }
    }];
}

- (void)cloudAnimation:(UIImageView *)cloud firstDuration:(NSInteger)firstDuration secondDuration:(NSInteger)secondDuration delay:(NSInteger)delay {
    [UIView animateWithDuration:firstDuration delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
        cloud.center = CGPointMake(-cloud.frame.size.width, cloud.center.y);
    } completion:^(BOOL finished) {
        cloud.center = CGPointMake(self.screenWidth + cloud.frame.size.width, cloud.center.y);
        [UIView animateWithDuration:secondDuration delay:0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat animations:^{
            cloud.center = CGPointMake(-cloud.frame.size.width, cloud.center.y);
        } completion:nil];
    }];
}

- (void)blinking {
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionRepeat animations:^{
            [UIView setAnimationRepeatCount:1];
            self.leftEyeImageView.transform = CGAffineTransformMakeScale(1, 0.1);
            self.rightEyeImageView.transform = CGAffineTransformMakeScale(1, 0.1);
    } completion:^(BOOL finished) {
        
            [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.leftEyeImageView.transform = CGAffineTransformMakeScale(1, 1);
                self.rightEyeImageView.transform = CGAffineTransformMakeScale(1, 1);
            } completion:nil];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
