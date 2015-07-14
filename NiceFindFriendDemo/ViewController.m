//
//  ViewController.m
//  NiceFindFriendDemo
//
//  Created by RomitLee on 15/7/14.
//  Copyright (c) 2015年 RomitLee. All rights reserved.
//
#define viewDiff 10

#define view1width 220
#define view1center 200


#define view2width view1width
#define view3width view1width+viewDiff
#define view4width view1width+viewDiff+viewDiff

#define view2center view1center
#define view3center view1center-viewDiff
#define view4center view1center-viewDiff-viewDiff

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView *view1;  //最底层被覆盖的视图
@property (nonatomic,strong) UIView *view2;
@property (nonatomic,strong) UIView *view3;
@property (nonatomic,strong) UIView *view4;
@property (nonatomic,assign) CGPoint view4Center;

@property (nonatomic,assign) float view4x;
@property (nonatomic,assign) float view4y;
@property (nonatomic,assign) float view3x;
@property (nonatomic,assign) float view3y;
@property (nonatomic,assign) float view2x;
@property (nonatomic,assign) float view2y;
@property (nonatomic,assign) float view1x;
@property (nonatomic,assign) float view1y;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor yellowColor];
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, view1width, view1width)];
    view1.backgroundColor=[UIColor grayColor];
    view1.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, view1center);
    [self.view addSubview:view1];
    self.view1=view1;
    
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(0, 0, view2width, view2width)];
    view2.backgroundColor=[UIColor redColor];
    view2.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, view2center);
    [self.view insertSubview:view2 aboveSubview:view1];
    self.view2=view2;
    
    UIView *view3=[[UIView alloc]initWithFrame:CGRectMake(0, 0, view3width, view3width)];
    view3.backgroundColor=[UIColor blueColor];
    view3.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, view3center);
    [self.view insertSubview:view3 aboveSubview:view2];
    self.view3=view3;
    
    UIView *view4=[[UIView alloc]initWithFrame:CGRectMake(0, 0, view4width, view4width)];
    view4.backgroundColor=[UIColor greenColor];
    view4.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, view4center);
    [self.view insertSubview:view4 aboveSubview:view3];
    self.view4=view4;
    
    
    UIPanGestureRecognizer *view4Pen=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(test:)];
    [view4 addGestureRecognizer:view4Pen];
    
    self.view4x=self.view4.frame.origin.x;
    self.view4y=self.view4.frame.origin.y;
    
    self.view3x=self.view3.frame.origin.x;
    self.view3y=self.view3.frame.origin.y;
    
    self.view2x=self.view2.frame.origin.x;
    self.view2y=self.view2.frame.origin.y;
    
    self.view1x=self.view1.frame.origin.x;
    self.view1y=self.view1.frame.origin.y;
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
       if(point.x>[UIScreen mainScreen].bounds.size.width/3||point.x<-[UIScreen mainScreen].bounds.size.width/3)
       {
           UIColor *col=self.view4.backgroundColor;
           
           [UIView animateWithDuration:0.3 animations:^{
               if(point.x>0)
               {
                   self.view4.frame=CGRectMake([UIScreen mainScreen].bounds.size.width, 40, view4width, view4width);
               }
               else
               {
                   self.view4.frame=CGRectMake(-[UIScreen mainScreen].bounds.size.width, 40, view4width, view4width);
               }
               
               self.view3.frame=CGRectMake(self.view4x, self.view4y, view4width, view4width);
               self.view2.frame=CGRectMake(self.view3x, self.view3y, view3width, view3width);
           } completion:^(BOOL finished) {
               
               self.view4=self.view3;
               self.view3=self.view2;
                self.view2=self.view1;
        
               
               UIView *viewview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, view1width, view1width)];
               viewview.backgroundColor=col;
               viewview.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, view1center);
               [self.view insertSubview:viewview belowSubview:self.view1];
               self.view1=viewview;
               
               
 
               
               
               UIPanGestureRecognizer *view4Pen=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(test:)];
               [self.view4 addGestureRecognizer:view4Pen];
               
               self.view4x=self.view4.frame.origin.x;
               self.view4y=self.view4.frame.origin.y;
               
               self.view3x=self.view3.frame.origin.x;
               self.view3y=self.view3.frame.origin.y;
               
               self.view2x=self.view2.frame.origin.x;
               self.view2y=self.view2.frame.origin.y;
               
               self.view1x=self.view1.frame.origin.x;
               self.view1y=self.view1.frame.origin.y;
               
               
           }];
       }
       
       
       else
       {
           [UIView animateWithDuration:0.3 animations:^{
               gest.view.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, view4center);
               
               self.view3.frame=CGRectMake(self.view3x, self.view3y, view3width, view3width);
               self.view2.frame=CGRectMake(self.view2x, self.view2y, view2width, view2width);
           }];
       }
      
       
       
   }
    if(gest.state==UIGestureRecognizerStateChanged)
    {
        CGPoint cc=CGPointMake([UIScreen mainScreen].bounds.size.width/2, view4center);
        gest.view.center=CGPointMake(cc.x+point.x, cc.y+point.y);
        NSLog(@"李锐x=%f肖佩y%f",point.x,point.y);
        
        int i1=point.x/10;
        if(i1<0)
        {
            i1=-i1;
        }
        if(i1<=viewDiff/2)
        {
            self.view3.frame=CGRectMake(self.view3x-i1, self.view3y-i1*3, view3width+i1*2, view3width+i1*2);
            self.view2.frame=CGRectMake(self.view2x-i1, self.view2y-i1*3, view2width+i1*2, view2width+i1*2);
        }
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
