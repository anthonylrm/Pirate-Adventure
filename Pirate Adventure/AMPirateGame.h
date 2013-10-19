//
//  AMPirateGame.h
//  Pirate Adventure
//
//  Created by Anthony Matteo on 10/12/13.
//  Copyright (c) 2013 Anthony Matteo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMCharacter.h"


// The idea here was that this was going to package all elements of the model so that the VC would only know about this class and its view objects.... This class would handle the tile proerties, navigation, main character, etc.... Maybe this is a good idea...?
@interface AMPirateGame : NSObject

//@property (strong, nonatomic) NSArray *tiles;
//@property (strong, nonatomic) AMCharacter *hero;

-(NSString*) storyForTile:(int)tileNumber;

@end
