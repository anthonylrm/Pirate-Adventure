//
//  AMTileAction.m
//  Pirate Adventure
//
//  Created by Anthony Matteo on 10/16/13.
//  Copyright (c) 2013 Anthony Matteo. All rights reserved.
//

#import "AMTileAction.h"

@implementation AMTileAction


-(id)initForTileNumber:(int)number
{
    self = [super init];
    if (self) {
        
        if (number == 1) {
            _weapon = [[AMWeapon alloc]init];
            _weapon.type = @"Blunted Sword";
        } else if (number == 2) {
            
        } else if (number == 3) {
            
        } else if (number == 4) {
            
        } else if (number == 5) {
            
        } else if (number == 6) {
            
        } else if (number == 7) {
            
        } else if (number == 8) {
            
        } else if (number == 9) {
            
        } else if (number == 10) {
            
        } else if (number == 11) {
            
        } else if (number == 12) {
            
        } else {
            
            self = nil;
        }
    }
    return self;
}

@end
