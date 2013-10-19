//
//  AMPirateGame.m
//  Pirate Adventure
//
//  Created by Anthony Matteo on 10/12/13.
//  Copyright (c) 2013 Anthony Matteo. All rights reserved.
//

#import "AMPirateGame.h"

@implementation AMPirateGame

-(NSString*)storyForTile:(int)tileNumber
{
    NSString *returnString;
    
    if (tileNumber == 1) {
        
        returnString = @"Hooray! You are just beginning your adventure. Go east! Or north! And see what ye may find!";
        
    } else if (tileNumber == 2) {
        
        returnString = @"Oh no! It's a trap!";
        
    } else if (tileNumber == 3) {
        
        returnString = @"Cool! Someone forgot to bury their treasure!";
        
    } else if (tileNumber == 4) {
        
        returnString = @"The coast is clear.";
        
    } else if (tileNumber == 5) {
        
        returnString = @"Where'm I at here?";
        
    } else if (tileNumber == 6) {
        
        returnString = @"Get money and turn around!";
        
    } else if (tileNumber == 7) {
        
        returnString = @"7!";
        
    } else if (tileNumber == 8) {
        
        returnString = @"8! 8!";
        
    } else if (tileNumber == 9) {
        
        returnString = @"9! 9!";
        
    } else if (tileNumber == 10) {
        
        returnString = @"10!";
        
    } else if (tileNumber == 11) {
        
        returnString = @"11 boss!";
        
    } else if (tileNumber == 12) {
        
        returnString = @"12!";
        
    }
    
    return returnString;
}
@end
