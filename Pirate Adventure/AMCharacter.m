//
//  AMCharacter.m
//  Pirate Adventure
//
//  Created by Anthony Matteo on 10/12/13.
//  Copyright (c) 2013 Anthony Matteo. All rights reserved.
//

#import "AMCharacter.h"

@implementation AMCharacter

//-(void)setHealth:(int)value{
//    self.health = value;
//}

-(void)setArmorOn:(AMArmor *)armorOn
{
    //The precentage approach was meant to serve a dual use of direct health increase and a protection factor in battle, but becasue we have integral health, not real (float) health, the percentage calculation here leads to some screwy results.
    //self.health = MAX(1, self.health / (1 + _armorOn.harmReduction));
    self.health = MAX(1, self.health - (100 * _armorOn.harmReduction));
    _armorOn = armorOn;
    //self.health = self.health * (1 + armorOn.harmReduction);
    self.health = self.health + (100 * armorOn.harmReduction);

}


-(void)setWeaponArmed:(AMWeapon *)weaponArmed
{
    _weaponArmed = weaponArmed;
    self.damage = weaponArmed.damage;
}

-(void) getsHit:(int)severity
{
    self.health = self.health - severity;
}


-(id)init
{
    self = [super init];
    
    if (self) {
        _health = 100;
        _armorOn = [[AMArmor alloc] init];
        _armorOn.type = @"Nude";
        _armorOn.harmReduction = 0.0;
        _weaponArmed = [[AMWeapon alloc] init];
        _weaponArmed.type = @"Nude Hands";
        _weaponArmed.damage = 5;
        _damage = _weaponArmed.damage;
    }
    
    return self;
}
@end
