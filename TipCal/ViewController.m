//
//  ViewController.m
//  TipCal
//
//  Created by Sean Liu on 2017-11-10.
//  Copyright © 2017 Sean Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *bottomBar;
@property (strong, nonatomic) IBOutlet UIView *topBar;
- (IBAction)slide:(UIPanGestureRecognizer *)sender;
@property (strong, nonatomic) IBOutlet UILabel *percentageLabel;
@property (nonatomic) NSInteger percentageNum;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topBar.center = self.bottomBar.center;
    [self percentageUpDate];

    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)slide:(UIPanGestureRecognizer*)sender {
    
    CGFloat horizontalTranslation = [sender translationInView: self.view].x;
    CGFloat newX = self.topBar.center.x + horizontalTranslation*1;
    
    //if( -0.1 > self.topBar.frame.origin.x > (-375.1)){
    [UIView animateWithDuration:0.02 animations:^{
    self.topBar.center = CGPointMake(newX,self.bottomBar.center.y);
    [self.bottomBar bringSubviewToFront:self.topBar];
    }];//}
    
    [sender setTranslation:CGPointZero inView:self.view];
    [self percentageUpDate];
}


-(NSInteger)percentageNum{
    CGFloat position = self.topBar.frame.origin.x;
    NSInteger i = (NSInteger)floor(position/3.75);NSLog(@"%ld",(long)i);

    return (NSInteger)floor(position/3.75);
    
    
}

-(void)percentageUpDate{
    
    self.percentageLabel.text = [NSString stringWithFormat:@"%ld %@", (long)self.percentageNum, @"%"];
    

}

@end
