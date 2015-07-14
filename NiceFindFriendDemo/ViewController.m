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
   // NSLog(@"point1 /nx===%f/n y======%f",point.x,point.y);
    //NSLog(@"point2 /nx===%f/n y======%f",point2.x,point2.y);
    
    
    gest.view.center=CGPointMake(self.view4Center.x+point.x, self.view4Center.y+point.y);
    CGPoint center;
    float view3x = 0.0;
    float view3y = 0.0;
    float view3w= 0.0;
    float view3h = 0.0;
    
    if(gest.state==UIGestureRecognizerStateBegan)
    {
        view3x=self.view3.frame.origin.x;
        view3y=self.view3.frame.origin.y;
        view3w=self.view3.frame.size.width;
        view3h=self.view3.frame.size.height;
        
        //NSLog(@"Began :point2 /nx===%f/n y======%f",center.x,center.y);
    }
    //鼠标松下来得瞬间
    
   if(gest.state==UIGestureRecognizerStateEnded)
   {
       [UIView animateWithDuration:0.4 animations:^{
           gest.view.center=self.view4Center;
       }];
       
       NSLog(@"Began :point2 /nx===%f/n y======%f",center.x,center.y);
   }
    if(gest.state==UIGestureRecognizerStateChanged)
    {
        //self.view3.frame=CGRectMake(self.view4.frame.origin.x, =self.view4.frame.origin.y,self.view4.frame.siz)
        if(point.x>20&&point.x<120)
        {
            float xx=point.x/10;
            
            self.view3.frame=CGRectMake(view3x-xx, view3y-xx, view3w+xx*2, view3h+xx*2);
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
