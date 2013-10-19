//
//  AMFactory.h
//  Pirate Adventure
//
//  Created by Anthony Matteo on 10/12/13.
//  Copyright (c) 2013 Anthony Matteo. All rights reserved.
//
// Comments:
//      Creates an array of arrays of tile objects with coordinate properties set.
//      The array of arrays represents a grid corresponding to the coordinates. The outer array is the horizontal axis; inner arrays are vertical.

#import <Foundation/Foundation.h>
#import "AMCharacter.h"

@interface AMFactory : NSObject


-(AMCharacter*)hero;

-(NSArray*)makeTileGridX:(int)across byY:(int)down;

@end
