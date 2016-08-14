//
//  ViewController.m
//  CALayerDemo
//
//  Created by 58 on 16/8/5.
//  Copyright © 2016年 58. All rights reserved.
//

#import "ViewController.h"
@import CoreText;

@interface ViewController ()

@property (nonatomic, strong) CALayer *colorLayer;

@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *keyView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, copy) NSArray *images;
@property (nonatomic, strong) CALayer *doorLayer;
@property (nonatomic, strong) UIView *colorView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self testShapeLayer];
    
    //[self testTextLayer];
    
    //[self testFullTextLayer];
    
    //[self testTransformLayer];
    
    
    //创建CALayer
    //create sublayer
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it to our view
    [self.layerView.layer addSublayer:self.colorLayer];
    
    
    //[self testCAKeyframeAnimation];
    
    
    //[self testVirtualAnimation];
    
    //[self testGroupAnimation];
    
    
    //过渡动画
    //set up images
    self.images = @[[UIImage imageNamed:@"test.png"],[UIImage imageNamed:@"test1.png"],[UIImage imageNamed:@"test2.png"],[UIImage imageNamed:@"test3.png"]];
    
    //[self testRepeatAnimation];
    
    
    //手动动画
    
    //add the door
    //self.doorLayer = [CALayer layer];
    //self.doorLayer.frame = CGRectMake(0, 0, 128, 256);
    //self.doorLayer.position = CGPointMake(150 - 64, 150);
    //self.doorLayer.anchorPoint = CGPointMake(0, 0.5);
    //self.doorLayer.contents = (__bridge id)[UIImage imageNamed:@"test.png"].CGImage;
    //[self.layerView.layer addSublayer:self.doorLayer];
    ////apply perspective transform
    //CATransform3D perspective = CATransform3DIdentity;
    //perspective.m34 = -1.0 / 500.0;
    //self.layerView.layer.sublayerTransform = perspective;
    ////add pan gesture recognizer to handle swipes
    //UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    //[pan addTarget:self action:@selector(pan:)];
    //[self.view addGestureRecognizer:pan];
    ////pause all layer animations
    //self.doorLayer.speed = 0.0;
    ////apply swinging animation (which won't play because layer is paused)
    //CABasicAnimation *animation = [CABasicAnimation animation];
    //animation.keyPath = @"transform.rotation.y";
    //animation.toValue = @(-M_PI_2);
    //animation.duration = 1.0;
    //[self.doorLayer addAnimation:animation forKey:nil];
    
    
    //CAMediaTimingFunction缓冲动画
    //create a red layer
    //self.colorLayer = [CALayer layer];
    //self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    //self.colorLayer.position = CGPointMake(self.view.bounds.size.width/2.0, self.view.bounds.size.height/2.0);
    //self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    //[self.view.layer addSublayer:self.colorLayer];
    
    
    //UIView的动画缓冲
    //create a red layer
    //self.colorView = [[UIView alloc] init];
    //self.colorView.bounds = CGRectMake(0, 0, 100, 100);
    //self.colorView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    //self.colorView.backgroundColor = [UIColor redColor];
    //[self.view addSubview:self.colorView];
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    /////CAMediaTimingFunction 缓冲动画
    //kCAMediaTimingFunctionEaseOut 全速开始，然后慢慢减速停止
    //kCAMediaTimingFunctionEaseIn  慢慢加速然后突然停止的方法
    //kCAMediaTimingFunctionLinear 创建了一个线性的计时函数 匀速
    //kCAMediaTimingFunctionEaseInEaseOut 慢慢加速然后再慢慢减速的过程
    //kCAMediaTimingFunctionDefault，它和kCAMediaTimingFunctionEaseInEaseOut很类似，但是加速和减速的过程都稍微有些慢
    //configure the transaction
    //[CATransaction begin];
    //[CATransaction setAnimationDuration:1.0];
    //[CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    ////set the position
    //self.colorLayer.position = [[touches anyObject] locationInView:self.view];
    ////commit transaction
    //[CATransaction commit];
    
    
    //UIView的动画缓冲
    //perform the animation
    //[UIView animateWithDuration:1.0 delay:0.0
    //                    options:UIViewAnimationOptionCurveEaseOut
    //                 animations:^{
    //                     //set the position
    //                     self.colorView.center = [[touches anyObject] locationInView:self.view];
    //                 }
    //                 completion:NULL];
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    
    //get horizontal component of pan gesture
    CGFloat x = [pan translationInView:self.view].x;
    //convert from points to animation duration //using a reasonable scale factor
    x /= 200.0f;
    //update timeOffset and clamp result
    CFTimeInterval timeOffset = self.doorLayer.timeOffset;
    timeOffset = MIN(0.999, MAX(0.0, timeOffset - x));
    self.doorLayer.timeOffset = timeOffset;
    //reset pan gesture
    [pan setTranslation:CGPointZero inView:self.view];
}


- (IBAction)changeColor:(UIButton *)sender {
    
    //create a new random color
    //CGFloat red = arc4random() / (CGFloat)INT_MAX;
    //CGFloat green = arc4random() / (CGFloat)INT_MAX;
    //CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    //UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    ////create a basic animation
    //CABasicAnimation *animation = [CABasicAnimation animation];
    //animation.keyPath = @"backgroundColor";
    //animation.toValue = (__bridge id)color.CGColor;
    //animation.delegate = self;
    ////apply animation to layer
    //[self.colorLayer addAnimation:animation forKey:nil];
    
    
    //create a keyframe animation
    //CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    //animation.keyPath = @"backgroundColor";
    //animation.duration = 2.0;
    //animation.values = @[
    //                     (__bridge id)[UIColor blueColor].CGColor,
    //                     (__bridge id)[UIColor redColor].CGColor,
    //                     (__bridge id)[UIColor greenColor].CGColor,
    //                     (__bridge id)[UIColor blueColor].CGColor ];
    ////apply animation to layer
    //animation.delegate = self;
    // //[animation setValue: @"handView" forKey:@"handView"];
    //[self.colorLayer addAnimation:animation forKey:nil];
    
    //缓冲和关键帧动画 CAMediaTimingFunction
    //create a keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[
                         (__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor ];
    //add timing function
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn];
    animation.timingFunctions = @[fn, fn, fn];
    //apply animation to layer
    [self.colorLayer addAnimation:animation forKey:nil];
    
    
    //过渡动画
    //set up crossfade transition
    //CATransition *transition = [CATransition animation];
    //transition.type = kCATransitionFade;
    ////apply transition to imageview backing layer
    //[self.imageView.layer addAnimation:transition forKey:nil];
    //
    ////cycle to next image
    //UIImage *currentImage = self.imageView.image;
    //NSUInteger index = [self.images indexOfObject:currentImage];
    //index = (index + 1) % [self.images count];
    //self.imageView.image = self.images[index];
    
    //[UIView transitionWithView:self.imageView duration:1.0
    //                   options:UIViewAnimationOptionTransitionFlipFromLeft
    //                animations:^{
    //                    //cycle to next image
    //                    UIImage *currentImage = self.imageView.image;
    //                    NSUInteger index = [self.images indexOfObject:currentImage];
    //                    index = (index + 1) % [self.images count];
    //                    self.imageView.image = self.images[index];
    //                }
    //                completion:NULL];
    //
    //
    ////使用renderInContext:创建自定义过渡效果
    ////preserve the current view snapshot
    //UIGraphicsBeginImageContextWithOptions(self.layerView.bounds.size, YES, 0.0);
    //[self.layerView.layer renderInContext:UIGraphicsGetCurrentContext()];
    //UIImage *coverImage = UIGraphicsGetImageFromCurrentImageContext();
    ////insert snapshot view in front of this one
    //UIView *coverView = [[UIImageView alloc] initWithImage:coverImage];
    ////coverView.backgroundColor = [UIColor redColor];
    //coverView.frame = self.layerView.bounds;
    //[self.layerView addSubview:coverView];
    ////return;
    ////update the view (we'll simply randomize the layer background color)
    //CGFloat red = arc4random() / (CGFloat)INT_MAX;
    //CGFloat green = arc4random() / (CGFloat)INT_MAX;
    //CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    //self.layerView.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    ////perform animation (anything you like)
    //[UIView animateWithDuration:1.0 animations:^{
    //    //scale, rotate and fade the view
    //    CGAffineTransform transform = CGAffineTransformMakeScale(0.01, 0.01);
    //    transform = CGAffineTransformRotate(transform, M_PI_2);
    //    coverView.transform = transform;
    //    coverView.alpha = 0.0;
    //} completion:^(BOOL finished) {
    //    //remove the cover view now we're finished with it
    //    [coverView removeFromSuperview];
    //}];
}

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag{
    
    // UIView *handView = [anim valueForKey:@"handView"];
    
    //set the backgroundColor property to match animation toValue
    //静止隐式动画
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    //self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
    [CATransaction commit];
}

- (void)testRepeatAnimation{
    
    //重复动画
    //add the door
    CALayer *doorLayer = [CALayer layer];
    doorLayer.frame = CGRectMake(0, 0, 128, 256);
    doorLayer.position = CGPointMake(150 - 64, 150);
    doorLayer.anchorPoint = CGPointMake(0, 0.5);
    doorLayer.contents = (__bridge id)[UIImage imageNamed: @"test.png"].CGImage;
    [self.layerView.layer addSublayer:doorLayer];
    //apply perspective transform
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    self.layerView.layer.sublayerTransform = perspective;
    //apply swinging animation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(-M_PI_2);
    animation.duration = 2.0;
    animation.repeatDuration = INFINITY;
    animation.autoreverses = YES;
    [doorLayer addAnimation:animation forKey:nil];
}

- (void)testGroupAnimation{
    
    //create a path
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    //draw the path using a CAShapeLayer
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.layerView.layer addSublayer:pathLayer];
    
    //add a colored layer
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(0, 0, 64, 64);
    colorLayer.position = CGPointMake(0, 150);
    colorLayer.backgroundColor = [UIColor greenColor].CGColor;
    [self.layerView.layer addSublayer:colorLayer];
    
    //create the position animation
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
    animation1.keyPath = @"position";
    animation1.path = bezierPath.CGPath;
    animation1.rotationMode = kCAAnimationRotateAuto;
    
    //create the color animation
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"backgroundColor";
    animation2.toValue = (__bridge id)[UIColor redColor].CGColor;
    
    //create group animation
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[animation1, animation2];
    groupAnimation.duration = 4.0;
    //add the animation to the color layer
    [colorLayer addAnimation:groupAnimation forKey:nil];
}

- (void)testVirtualAnimation{
    
    //虚拟属性动画  transform.rotation rotation不是一个真正的属性
    //add the ship
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed: @"test.png"].CGImage;
    [self.keyView.layer addSublayer:shipLayer];
    //animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 2.0;
    //animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    animation.byValue = @(2 * M_PI);//[NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    [shipLayer addAnimation:animation forKey:nil];
}

- (void)testCAKeyframeAnimation{
    
    //create a path
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    //draw the path using a CAShapeLayer
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.layerView.layer addSublayer:pathLayer];
    
    //add the ship
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 64, 64);
    shipLayer.position = CGPointMake(0, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed: @"test.png"].CGImage;
    [self.layerView.layer addSublayer:shipLayer];
    //create the keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.path = bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    [shipLayer addAnimation:animation forKey:nil];
}


- (void)testTransformLayer{
    
    //set up the perspective transform
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = -1.0 / 500.0;
    self.view.layer.sublayerTransform = pt;
    
    //set up the transform for cube 1 and add it
    CATransform3D c1t = CATransform3DIdentity;
    c1t = CATransform3DTranslate(c1t, -100, 0, 0);
    CALayer *cube1 = [self cubeWithTransform:c1t];
    [self.view.layer addSublayer:cube1];
    
    //set up the transform for cube 2 and add it
    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    CALayer *cube2 = [self cubeWithTransform:c2t];
    [self.view.layer addSublayer:cube2];
}

- (CALayer *)cubeWithTransform:(CATransform3D)transform
{
    //create cube layer
    CATransformLayer *cube = [CATransformLayer layer];
    
    //add cube face 1
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //add cube face 2
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //add cube face 3
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //add cube face 4
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //add cube face 5
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //add cube face 6
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //center the cube layer within the container
    CGSize containerSize = self.view.bounds.size;
    cube.position = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    
    //apply the transform and return
    cube.transform = transform;
    return cube;
}

- (CALayer *)faceWithTransform:(CATransform3D)transform
{
    //create cube face layer
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);
    
    //apply a random color
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    
    //apply the transform and return
    face.transform = transform;
    return face;
}

//富文本
- (void)testFullTextLayer{
    
    //create a text layer
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(50.0f, 100.0f, 300.0f, 300.0f);
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.view.layer addSublayer:textLayer];
    
    //set text attributes
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    //choose a font
    UIFont *font = [UIFont systemFontOfSize:15];
    
    //choose some text
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \ elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \ leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc \ elementum, libero ut porttitor dictum, diam odio congue lacus, vel \ fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \ lobortis";
    
    //create attributed string
    NSMutableAttributedString *string = nil;
    string = [[NSMutableAttributedString alloc] initWithString:text];
    
    //convert UIFont to a CTFont
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    
    //set text attributes
    NSDictionary *attribs = @{
                              (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor blackColor].CGColor,
                              (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                              };
    
    [string setAttributes:attribs range:NSMakeRange(0, [text length])];
    attribs = @{
                (__bridge id)kCTForegroundColorAttributeName: (__bridge id)[UIColor redColor].CGColor,
                (__bridge id)kCTUnderlineStyleAttributeName: @(kCTUnderlineStyleSingle),
                (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                };
    [string setAttributes:attribs range:NSMakeRange(6, 5)];
    
    //release the CTFont we created earlier
    CFRelease(fontRef);
    
    //set layer text
    textLayer.string = string;
}

- (void)testTextLayer{
    
    //create a text layer
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(50.0f, 100.0f, 300.0f, 300.0f);
    [self.view.layer addSublayer:textLayer];
    
    //set text attributes
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    //以Retina的方式渲染
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    //choose a font
    UIFont *font = [UIFont systemFontOfSize:15];
    
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    //choose some text
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing\\elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar\\leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel\\fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet\\lobortis";
    
    //set layer text
    textLayer.string = text;
}

- (void)testShapeLayer{
    //create path
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(175, 100)];
    
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    
    //====================================================
    
    //圆角矩形其实就是人工绘制单独的直线和弧度
    CGRect rect = CGRectMake(50, 50, 100, 100);
    CGSize radii = CGSizeMake(20, 20);
    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft;
    //create path
    path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    
    //====================================================
    
    //create shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    //add it to our view
    [self.view.layer addSublayer:shapeLayer];
}

- (void)testBlueLayer{
    
    //create sublayer
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    //set controller as layer delegate
    blueLayer.delegate = self;
    
    //ensure that layer backing image uses correct scale
    blueLayer.contentsScale = [UIScreen mainScreen].scale; //add layer to our view
    [self.view.layer addSublayer:blueLayer];
    
    //force layer to redraw
    [blueLayer setNeedsDisplay];
    
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //draw a thick red circle
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
