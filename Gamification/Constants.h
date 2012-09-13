//
//  Constants.h
//  Gamification
//
//  Created by Michael Overstreet on 9/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef Gamification_Constants_h
#define Gamification_Constants_h


//GoalSet
extern const int kExpGain[6];               //amount of exp to gain for each type of goal
extern const double kCommonChance[6];       //base chance to get common reward for each goal
extern const double kUncommonChance[6];     //base chance to get common reward for each goal
extern const double kRareChance[6];         //base chance to get common reward for each goal
extern const double kEpicChance[6];         //base chance to get common reward for each goal

extern const NSTimeInterval kExpirationTime;    //how long stack lasts
extern const NSInteger kMaxCount;               //maximum size of stack
extern const NSInteger kExpToLevelMap[51];      //array of the minimum exp for each level

extern const int kMaxLevel;                     //the maximum level
extern const double kStackValue;                //The fraction increase in chance to receive reward for each stack
extern const double kLevelValue;                //The fraction increase in chance to receive reward for each level

//name corresponds to index into goalset constant arrays
typedef enum{
    Everyday,
    Tiny,
    Small,
    Medium,
    Large,
    Epic
} goalsize;

//name corresponds to index into rewardset contant arrays (currently none)
typedef enum{
    Common,
    Uncommon,
    Rare,
    Legendary
} rarity;

#endif
