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

const double kCommonChance[6] = {.01, .1, .5, 1, 1, 1};
const double kUncommonChance[6] = {.001, .01, .05, .25, 1, 1};
const double kRareChance[6] = {.0001, .001, .005, .025, .125, 1};
const double kEpicChance[6] = {.00001, .0001, .0005, .0025, .0125, .125};


//UserStatus
const NSTimeInterval kExpirationTime = 1296000;  //15 days
const int kMaxCount = 10;

//x^2 + 9x + 90 increase with each level
//const int kExpToLevelMap[51] = 
//[0,     100,    212,    338,    480,    640,    820,    1022,   1248,   1500,   1780,
//        2090,   2432,   2808,   3220,   3670,   4160,   4692,   5268,   5890,   6560,


//10x + 90 increase with each level
const int kExpToLevelMap[51] =
{0,     100,    210,    330,    460,    600,    750,    910,    1080,   1260,   1450,
    1650,   1860,   2080,   2310,   2550,   2800,   3060,   3330,   2610,   2900,
    3200,   3510,   3830,   4160,   4500,   4850,   5210,   5580,   5960,   6350,
    6750,   7160,   7580,   8010,   8450,   8900,   9360,   9830,   10310,  10800,
    11300,  11810,  12330,  12860,  13400,  13950,  14510,  15080,  15660,  16250};
const int kMaxLevel = 50;


double const kStackValue = 0.05;
double const kLevelValue = 0.01;
