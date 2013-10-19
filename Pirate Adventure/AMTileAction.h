//
//  AMTileAction.h
//  Pirate Adventure
//
//  Created by Anthony Matteo on 10/16/13.
//  Copyright (c) 2013 Anthony Matteo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMCharacter.h"

// The plan was for the Action class to package everything related to actions on a tile. The idea being that, eventually, we may want to have multiple actions available on a single tile, possibly one action for each of many (a dynamic number) buttons. But as I started to go through with it, it just seemed like a Tile is nothing more than the actions you can take on it.... Basically, while only one action is avaialbe on each tile, doing it this way invovles a lot of extra coding for no reason, or at least makes the Tile object mostly redundant.... If we were to eventually package the Actions in a separate class, the Factory would have to generate the TileActions as well as the Tiles....
@interface AMTileAction : NSObject

@property (strong, nonatomic) AMArmor *armor;
@property (strong, nonatomic) AMWeapon *weapon;
@property (strong, nonatomic) AMCharacter *nonPlayerCharacter;
@property (strong, nonatomic) NSString *buttonText;

-(id)initForTileNumber:(int)number;
@end
