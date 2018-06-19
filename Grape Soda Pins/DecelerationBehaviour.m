//
//  DecelerationBehaviour.m
//  Deceleration
//
//  Created by Rajendra HN on 04/02/13.
//

#import "DecelerationBehaviour.h"
#import <UIKit/UIKit.h>

const CGFloat kTimerInterval = 0.05;
const CGFloat endVelocity = 0.01;

@interface DecelerationBehaviour ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation DecelerationBehaviour

- (id)initWithTarget:(id <DecelerationBehaviourTarget>)target
{
    if (!(self = [super init])) return nil;
    if (!target) return nil;
    _target = target;
    _smoothnessFactor = 0.2;
    return self;
}

- (id)init
{
    [NSException raise:@"Should use initWithTarget: or instanceWithTarget: methods" format:@"Should use initWithTarget: or instanceWithTarget: methods"];
    return nil;
}

+ (id)instanceWithTarget:(id<DecelerationBehaviourTarget>)target
{
    return [[self alloc] initWithTarget:target];
}

- (BOOL)decelerating
{
    return _timer.isValid;
}

- (void)decelerateWithVelocity:(CGPoint)velocity withCompletionBlock:(DecelerationCompletionBlock)completionBlock
{
    NSMutableDictionary *userInfo = [@{@"velocity" : [NSValue valueWithCGPoint:velocity]} mutableCopy];
    if (completionBlock)
    {
        userInfo[@"completionBlock"] = completionBlock;
    }

    [_timer invalidate];
    _timer = [NSTimer scheduledTimerWithTimeInterval:kTimerInterval target:self selector:@selector(step:) userInfo:userInfo repeats:YES];
}

- (void)cancelDeceleration
{
    [_timer invalidate];
}

- (void)step:(NSTimer *)timer
{
    CGPoint velocity = [timer.userInfo[@"velocity"] CGPointValue];
    velocity.x *= _smoothnessFactor;
    velocity.y *= _smoothnessFactor;
    timer.userInfo[@"velocity"] = [NSValue valueWithCGPoint:velocity];
    
    CGPoint distance;
    distance.x = velocity.x * kTimerInterval;
    distance.y = velocity.y * kTimerInterval;
    
    if((ABS(velocity.x) <= endVelocity && ABS(velocity.y) <= endVelocity))
    {
        if (timer.userInfo[@"completionBlock"])
        {
            DecelerationCompletionBlock completionBlock = timer.userInfo[@"completionBlock"];
            completionBlock();
        }
        [timer invalidate];
        return;
    }
    [_target addTranslation:distance];
}

@end
