//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: core/src/main/java/tuxkids/tuxblocks/core/defense/select/Problem.java
//
//  Created by Thomas on 7/10/13.
//

#import "tuxkids/tuxblocks/core/defense/round/Reward.h"
#import "tuxkids/tuxblocks/core/defense/select/Problem.h"
#import "tuxkids/tuxblocks/core/defense/tower/TowerType.h"
#import "tuxkids/tuxblocks/core/solve/expression/Equation.h"

@implementation TuxkidsTuxblocksCoreDefenseSelectProblem

@synthesize equation_ = equation__;
@synthesize reward_ = reward__;

- (TuxkidsTuxblocksCoreSolveExpressionEquation *)equation {
  return equation__;
}

- (TuxkidsTuxblocksCoreDefenseRoundReward *)reward {
  return reward__;
}

- (void)setEquationWithTuxkidsTuxblocksCoreSolveExpressionEquation:(TuxkidsTuxblocksCoreSolveExpressionEquation *)equation {
  self.equation_ = equation;
}

- (id)initWithTuxkidsTuxblocksCoreSolveExpressionEquation:(TuxkidsTuxblocksCoreSolveExpressionEquation *)equation
        withTuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum:(TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *)reward
                                                  withInt:(int)rewardCount {
  return [self initTuxkidsTuxblocksCoreDefenseSelectProblemWithTuxkidsTuxblocksCoreSolveExpressionEquation:equation withTuxkidsTuxblocksCoreDefenseRoundReward:[[TuxkidsTuxblocksCoreDefenseRoundReward alloc] initWithTuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum:reward withInt:rewardCount]];
}

- (id)initTuxkidsTuxblocksCoreDefenseSelectProblemWithTuxkidsTuxblocksCoreSolveExpressionEquation:(TuxkidsTuxblocksCoreSolveExpressionEquation *)equation
                                                       withTuxkidsTuxblocksCoreDefenseRoundReward:(TuxkidsTuxblocksCoreDefenseRoundReward *)reward {
  if ((self = [super init])) {
    self.equation_ = equation;
    self.reward_ = reward;
  }
  return self;
}

- (id)initWithTuxkidsTuxblocksCoreSolveExpressionEquation:(TuxkidsTuxblocksCoreSolveExpressionEquation *)equation
               withTuxkidsTuxblocksCoreDefenseRoundReward:(TuxkidsTuxblocksCoreDefenseRoundReward *)reward {
  return [self initTuxkidsTuxblocksCoreDefenseSelectProblemWithTuxkidsTuxblocksCoreSolveExpressionEquation:equation withTuxkidsTuxblocksCoreDefenseRoundReward:reward];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TuxkidsTuxblocksCoreDefenseSelectProblem *typedCopy = (TuxkidsTuxblocksCoreDefenseSelectProblem *) copy;
  typedCopy.equation_ = equation__;
  typedCopy.reward_ = reward__;
}

@end