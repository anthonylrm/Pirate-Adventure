//
//  AMCharacter.h
//  Pirate Adventure
//
//  Created by Anthony Matteo on 10/12/13.
//  Copyright (c) 2013 Anthony Matteo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMArmor.h"
#import "AMWeapon.h"


@interface AMCharacter : NSObject

@property (strong, nonatomic) NSString *name;

@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (nonatomic) CGPoint currentLocation;

@property (strong, nonatomic) AMArmor *armorOn;
@property (strong, nonatomic) AMWeapon *weaponArmed;

-(void) getsHit:(int)severity;
@end
