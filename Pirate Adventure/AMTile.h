//
//  AMTile.h
//  Pirate Adventure
//
//  Created by Anthony Matteo on 10/10/13.
//  Copyright (c) 2013 Anthony Matteo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMCharacter.h"
//AMWeapon and AMArmor are imported in AMCharacter

@interface AMTile : NSObject

// Visible upon entry
@property (strong, nonatomic)   NSString *story;
@property (strong, nonatomic)   UIImage *image;
@property (strong, nonatomic) NSString *actionButtonName;

//@property (strong, nonatomic)   AMAction *action;
// Result from taking action
@property (strong, nonatomic) AMArmor *armor;
@property (strong, nonatomic) AMWeapon *weapon;
@property (strong, nonatomic) AMCharacter *nonPlayerCharacter;
@property (nonatomic) int healthEffect;
//@property (strong, nonatomic) NSString *buttonText;


@end
