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
extern const int kExpGain[4];
extern const double kCommonChance[4];
extern const double kUncommonChance[4];
extern const double kRareChance[4];
extern const double kEpicChance[4];

extern const NSTimeInterval kExpirationTime;
extern const int kMaxCount;
extern const int kExpToLevelMap[51];

extern const int kMaxLevel;
extern const double kStackValue;
extern const double kLevelValue;

typedef enum{
    Common,
    Uncommon,
    Rare,
    Epic
} rarity;

#endif
