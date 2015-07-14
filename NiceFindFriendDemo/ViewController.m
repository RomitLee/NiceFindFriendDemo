//
//  ViewController.m
//  NiceFindFriendDemo
//
//  Created by RomitLee on 15/7/14.
//  Copyright (c) 2015年 RomitLee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView *view1;  //最底层被覆盖的视图
@property (nonatomic,strong) UIView *view2;
@property (nonatomic,strong) UIView *view3;
@property (nonatomic,strong) UIView *view4;
@property (nonatomic,assign) CGPoint view4Center;

@property (nonatomic,assign) float view3x;
@property (nonatomic,assign) float view3y;
@property (nonatomic,assign) float view3w;
@property (nonatomic,assign) float view3h;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor yellowColor];
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    view1.backgroundColor=[UIColor grayColor];
    view1.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, 200);
    [self.view addSubview:view1];
    self.view1=view1;
    
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    view2.backgroundColor=[UIColor redColor];
    view2.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, 200);
    [self.view insertSubview:view2 aboveSubview:view1];
    self.view2=view2;
    
    UIView *view3=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 210)];
    view3.backgroundColor=[UIColor blueColor];
    view3.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, 190);
    [self.view insertSubview:view3 aboveSubview:view2];
    self.view3=view3;
    
    UIView *view4=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 220, 220)];
    view4.backgroundColor=[UIColor greenColor];
    view4.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, 180);
    [self.view insertSubview:view4 aboveSubview:view3];
    self.view4=view4;
    
    
    UIPanGestureRecognizer *view4Pen=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(test:)];
    [view4 addGestureRecognizer:view4Pen];
    self.view4Center=view4.center;
    
    self.view3x=self.view3.frame.origin.x;
    self.view3y=self.view3.frame.origin.y;
    self.view3w=self.view3.frame.size.width;
    self.view3h=self.view3.frame.size.height;
}

-(void)test:(UIPanGestureRecognizer *)gest
{
//    UIGestureRecognizerStatePossible,      
//    UIGestureRecognizerStateBegan,
//    UIGestureRecognizerStateChanged,
//    UIGestureRecognizerStateEnded,
//    UIGestureRecognizerStateCancelled,
//    
//    UIGestureRecognizerStateFailed,
//    UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded //
    
    //CGPoint point=[gest locationInView:gest.view];
    CGPoint point=[gest translationInView:gest.view];
    
    if(gest.state==UIGestureRecognizerStateBegan)
    {

        
    }
    //鼠标松下来得瞬间
    
   if(gest.state==UIGestureRecognizerStateEnded)
   {
       [UIView animateWithDuration:0.3 animations:^{
           gest.view.center=self.view4Center;
       }];
       
       
   }
    if(gest.state==UIGestureRecognizerStateChanged)
    {

        gest.view.center=CGPointMake(self.view4Center.x+point.x, self.view4Center.y+point.y);
        NSLog(@"李锐x=%f肖佩y%f",point.x,point.y);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
