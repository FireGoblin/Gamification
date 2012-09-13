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
extern const int kExpGain[6];
extern const double kCommonChance[6];
extern const double kUncommonChance[6];
extern const double kRareChance[6];
extern const double kEpicChance[6];

extern const NSTimeInterval kExpirationTime;
extern const NSInteger kMaxCount;
extern const NSInteger kExpToLevelMap[51];

extern const int kMaxLevel;
extern const double kStackValue;
extern const double kLevelValue;

typedef enum{
    Everyday,
    Tiny,
    Small,
    Medium,
    Large,
    Epic
} goalsize;

typedef enum{
    Common,
    Uncommon,
    Rare,
    Legendary
} rarity;

#endif
