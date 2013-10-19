//
//  AMFactory.m
//  Pirate Adventure
//
//  Created by Anthony Matteo on 10/12/13.
//  Copyright (c) 2013 Anthony Matteo. All rights reserved.
//

#import "AMFactory.h"
#import "AMTile.h"

@implementation AMFactory


-(AMCharacter*)hero
{
    AMCharacter *character = [[AMCharacter alloc] init];
    character.currentLocation = CGPointMake(0, 0);
    character.name = @"Popeye";

    return character;
}

-(NSArray *)makeTileGridX:(int)across byY:(int)down
{
    AMTile *newTile;
 //   CGPoint coordinateForNewTile;
    
    NSMutableArray *tempVertical = [[NSMutableArray alloc] init];
    NSMutableArray *tempHorizontalContainingVerticals = [[NSMutableArray alloc] init];


    for (int column = 0; column < across; column++) {
        
        
        
        for (int row = 0; row < down; row ++) {
            
//          coordinateForNewTile.y = row;
            
            newTile = [[AMTile alloc] init];
            //newTile.story = [self storyForTile:(column * down) + row + 1];
            //newTile.image = [self imageForTile:(column * down) + row + 1];
            [self setUpTile:newTile withPropertySet:(column * down) + row +1 ];
            [tempVertical addObject:newTile];
            
        }
        
        [tempHorizontalContainingVerticals addObject: [NSArray arrayWithArray:tempVertical]];
        [tempVertical removeAllObjects];
    }
    
    
    return [NSArray arrayWithArray: tempHorizontalContainingVerticals];
}


-(void)setUpTile:(AMTile*)tile withPropertySet:(int)tileNumber
{
    if (tileNumber == 1) {
        
        tile.story = @"Hooray! You are just beginning your adventure. Go east! Or north! You must stop the evil pirate Boss before he steals any more plunder.  Would you like a blunted sword to get started?";
        tile.image = [UIImage imageNamed:@"PirateStart.jpg"];
        tile.actionButtonName = @"Take sword";
        AMWeapon *weapon = [[AMWeapon alloc] init];
        weapon.type = @"Blunted Sword";
        weapon.damage = 12;
        tile.weapon = weapon;
        
    } else if (tileNumber == 2) {
        
        tile.story = @"2 You have come across an armory.  Would you like to upgrade your armor to steel armor?";
        tile.image = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
        tile.actionButtonName = @"Use armor";
        AMArmor *armor = [[AMArmor alloc] init];
        armor.type = @"Steel Armor";
        armor.harmReduction = .11;
        tile.armor = armor;
        
    } else if (tileNumber == 3) {
        
        tile.story = @"3 A mysterious dock appears on the horizon.  Should we stop and ask for directions?";
        tile.image = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
        tile.actionButtonName = @"Stop at dock";
        tile.healthEffect = 15;
        
    } else if (tileNumber == 4) {
        
        tile.story = @"4 You have found a parrot can be used in your armor slot!  Parrots are a great defender and are fiercly loyal to their captain.";
        tile.image = [UIImage imageNamed:@"PirateParrot.jpg"];
        tile.actionButtonName = @"Adopt parrot";
        AMArmor *armor = [[AMArmor alloc] init];
        armor.type = @"Parrot";
        armor.harmReduction = .25;
        tile.armor = armor;

    } else if (tileNumber == 5) {
        
        tile.story = @"5 You have stumbled upon a cache of pirate weapons.  Would you like to upgrade to a pistol?";
        tile.image = [UIImage imageNamed:@"PirateWeapons.jpeg"];
        tile.actionButtonName = @"Take the gun";
        AMWeapon *weapon = [[AMWeapon alloc] init];
        weapon.type = @"Pirate pistol";
        weapon.damage = 31;
        tile.weapon = weapon;
        
    } else if (tileNumber == 6) {
        
        tile.story = @"6 You have been captured by pirates and are ordered to walk the plank.";
        tile.image = [UIImage imageNamed:@"PiratePlank.jpg"];
        tile.actionButtonName = @"Refuse!";
        tile.healthEffect = -26;
        
    } else if (tileNumber == 7) {
        
        tile.story = @"7 You sight a pirate battle off the coast";
        tile.image = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
        tile.actionButtonName = @"Intervene";
        tile.healthEffect = 12;
        
    } else if (tileNumber == 8) {
        
        tile.story = @"8 The legend of the deep, the mighty kraken appears";
        tile.image = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
        tile.actionButtonName = @"Fight the beast";
        tile.healthEffect = -22;
        
    } else if (tileNumber == 9) {
        
        tile.story = @"9 You stumble upon a hidden cave of pirate treasure";
        tile.image = [UIImage imageNamed:@"PirateTreasure.jpeg"];
        tile.actionButtonName = @"Loot!";
        tile.healthEffect = 45;

    } else if (tileNumber == 10) {
        
        tile.story = @"10 A group of pirates attempts to board your ship";
        tile.image = [UIImage imageNamed:@"PirateAttack.jpg"];
        tile.actionButtonName = @"Defend yourself!";
        tile.healthEffect = 19;
        
    } else if (tileNumber == 11) {
        
        tile.story = @"11 In the deep of the sea many things live and many things can be found.  Will the fortune bring help or ruin?";
        tile.image = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
        tile.actionButtonName = @"Loot!";
        tile.healthEffect = -56;
        
    } else if (tileNumber == 12) {
        
        tile.story = @"12 Your final faceoff with the fearsome pirate boss";
        tile.image = [UIImage imageNamed:@"PirateBoss.jpeg"];
        tile.actionButtonName = @"Attack!";
        AMCharacter *boss = [[AMCharacter alloc] init];
        boss.name = @"Boss";
        boss.health = 65;
        // The following and any other properties would be irrelevant for now....
        boss.damage = 15;
        tile.nonPlayerCharacter = boss;
        tile.healthEffect = -15;
        
    } else {
        
        tile.story = @"This is a tile";
        tile.image = [UIImage imageNamed:@"PirateStart.jpg"];
        tile.actionButtonName = @"NONE";

    }
}


// I sstarted writing the next two methods for story and image for modularity's sake> The idea was to handle each property of a tile independently so that things could be recombined in a future (less detterministic) version. But at this point, I can't see the advantage and I would jsut end up writing the same string of if...else if... statements for every property.
-(NSString*)storyForTile:(int)tileNumber
{
    if (tileNumber == 1) {
        
        return @"Hooray! You are just beginning your adventure. Go east! Or north! You must stop the evil pirate Boss before he steals any more plunder.  Would you like a blunted sword to get started?";
        
    } else if (tileNumber == 2) {

        return @"2 You have come across an armory.  Would you like to upgrade your armor to steel armor?";
    
    } else if (tileNumber == 3) {

        return @"3 A mysterious dock appears on the horizon.  Should we stop and ask for directions?";

    } else if (tileNumber == 4) {

        return @"4 You have found a parrot can be used in your armor slot!  Parrots are a great defender and are fiercly loyal to their captain.";

    } else if (tileNumber == 5) {

        return @"5 You have stumbled upon a cache of pirate weapons.  Would you like to upgrade to a pistol?";

    } else if (tileNumber == 6) {

        return @"6 You have been captured by pirates and are ordered to walk the plank";

    } else if (tileNumber == 7) {

        return @"7 You sight a pirate battle off the coast";

    } else if (tileNumber == 8) {

        return @"8 The legend of the deep, the mighty kraken appears";

    } else if (tileNumber == 9) {

        return @"9 You stumble upon a hidden cave of pirate treasurer";

    } else if (tileNumber == 10) {

        return @"10 A group of pirates attempts to board your ship";

    } else if (tileNumber == 11) {

        return @"11 In the deep of the sea many things live and many things can be found.  Will the fortune bring help or ruin?";

    } else if (tileNumber == 12) {

        return @"12 Your final faceoff with the fearsome pirate boss";
    
    } else {
     
        return @"This is a tile";
    }
}

-(UIImage*)imageForTile:(int)tileNumber
{
    if (tileNumber == 1) {

        return [UIImage imageNamed:@"PirateStart.jpg"];
        
    } else if (tileNumber == 2) {
   
        return [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
        
    } else if (tileNumber == 3) {
   
        return [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
        
    } else if (tileNumber == 4) {
  
        return [UIImage imageNamed:@"PirateParrot.jpg"];
        
    } else if (tileNumber == 5) {
    
        return [UIImage imageNamed:@"PirateWeapons.jpeg"];
        
    } else if (tileNumber == 6) {
        
        return [UIImage imageNamed:@"PiratePlank.jpg"];
        
    } else if (tileNumber == 7) {

        return [UIImage imageNamed:@"PirateShipBattle.jpeg"];
        
    } else if (tileNumber == 8) {

        return [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
        
    } else if (tileNumber == 9) {

        return [UIImage imageNamed:@"PirateTreasure.jpeg"];
        
    } else if (tileNumber == 10) {

        return [UIImage imageNamed:@"PirateAttack.jpg"];
        
    } else if (tileNumber == 11) {

        return [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
        
    } else if (tileNumber == 12) {

        return [UIImage imageNamed:@"PirateBoss.jpeg"];

    } else {
        
        return [UIImage imageNamed:@"PirateStart.jpg"];

    }
}

@end
