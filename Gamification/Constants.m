//
//  Constants.c
//  Gamification
//
//  Created by Michael Overstreet on 9/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "Constants.h"

//GoalSet
const int kExpGain[6] = {1, 2, 4, 12, 36, 144};

const double kCommonChance[6] =     {.0625, .125,   .25,    1,      1,    1};
const double kUncommonChance[6] =   {.016,  .04,    .1,     .25,    1,    1};
const double kRareChance[6] =       {0,     .002,   .01,    .05,   .25,   1};
const double kEpicChance[6] =       {0,     0,      .00025, .0025, .025,  .25};
   

//UserStatus
const NSTimeInterval kExpirationTime = 1000000;  //11 days, 13 hours, and 47 minutes
const int kMaxCount = 10;

//10x + 90 increase with each level
const int kExpToLevelMap[51] =
{0,     100,    210,    330,    460,    600,    750,    910,    1080,   1260,   1450,
    1650,   1860,   2080,   2310,   2550,   2800,   3060,   3330,   3610,   3900,
    4200,   4510,   4830,   5160,   5500,   5850,   6210,   6580,   6960,   7350,
    7750,   8160,   8580,   9010,   9450,   9900,   10360,  10830,  11310,  11800,
    12300,  12810,  13330,  13860,  14400,  14950,  15510,  16080,  16660,  17250};
const int kMaxLevel = 50;


double const kStackValue = 0.075;
double const kLevelValue = 0.015;
