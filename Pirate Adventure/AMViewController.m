//
//  AMViewController.m
//  Pirate Adventure
//
//  Created by Anthony Matteo on 10/10/13.
//  Copyright (c) 2013 Anthony Matteo. All rights reserved.
//

#import "AMViewController.h"
#import "AMFactory.h"
#import "AMTile.h"
#import "AMPirateGame.h"

@interface AMViewController ()

@end

@implementation AMViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Initialize (?) game (?)
    //AMPirateGame *game = [[AMPirateGame alloc] init];
    
    // Assign tile stories
//    int tileIndex = 1;
//    for (NSArray *verticalArray in self.tiles) {
//        for (AMTile *tile in verticalArray) {
//            tile.story = [game storyForTile:tileIndex];
//            tileIndex ++;
//        }
//    }
    
    [self startGame];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - IBActions

- (IBAction)directionButtonPressed:(UIButton *)sender
{
    //NSString *buttonLabel = [sender titleLabel].text;
    
    if (sender == self.rightButton) {
        
        self.hero.currentLocation = CGPointMake(self.hero.currentLocation.x + 1, self.hero.currentLocation.y);
        
    } else if (sender == self.leftButton) {
  
        self.hero.currentLocation = CGPointMake(self.hero.currentLocation.x - 1, self.hero.currentLocation.y);

    } else if (sender == self.upButton) {

        self.hero.currentLocation = CGPointMake(self.hero.currentLocation.x, self.hero.currentLocation.y + 1);

    } else if (sender == self.downButton) {

        self.hero.currentLocation = CGPointMake(self.hero.currentLocation.x, self.hero.currentLocation.y - 1);

    }
    
//    self.currentTile = [[self.tiles objectAtIndex:self.hero.currentLocation.x] objectAtIndex:self.hero.currentLocation.y];
//    NSLog(@"the hero, %@ is at, x = %f, y = %f", self.hero.name, self.hero.currentLocation.x, self.hero.currentLocation.y);

    // Update view for hero's location
    [self loadTileWithCoordinates:self.hero.currentLocation];
    [self toggleDirectionButtonsVisibilityForCoordinate:self.hero.currentLocation];
    
}


- (IBAction)actionButtonPressed:(UIButton *)sender {
    
    // In the fight, the hero attacks and does damage first, so if the boss's health drops below 1, we don't want this damage (health effect) to apply to the hero.
    
    AMTile *currentTile = [[self.tiles objectAtIndex:self.hero.currentLocation.x] objectAtIndex:self.hero.currentLocation.y];

    // If there is a character on this tile who is the Boss, fight him, otherwise just update the hero's stats and continue.
    // The next line might be a problem depending on how things evaluate and how the isEqual method works.
    if (currentTile.nonPlayerCharacter != nil && [currentTile.nonPlayerCharacter.name  isEqual: @"Boss"]) {

            currentTile.nonPlayerCharacter.health = currentTile.nonPlayerCharacter.health - self.hero.damage;
            
            // If the boss was killed, announce it, otherwise, update the hero's stats and continue.
            if (currentTile.nonPlayerCharacter.health <= 0) {
                
                UIAlertView *winAlert = [[UIAlertView alloc] initWithTitle:@"You win!" message:@"You have defeated the foul Pirate Boss! Why not try to do it again?" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            
                [winAlert show];
                //[self startGame];
  
            } else {
                
                [self updateCharacterWithArmor:currentTile.armor withWeapon:currentTile.weapon andHealthEffect:currentTile.healthEffect];

            }
    } else {
        
        [self updateCharacterWithArmor:currentTile.armor withWeapon:currentTile.weapon andHealthEffect:currentTile.healthEffect];
        
    }
    
    if (self.hero.health <= 0) {
        
        UIAlertView *loseAlert = [[UIAlertView alloc] initWithTitle:@"You lose!" message:@"Your adventure has come to an unfortunate end! Please play again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        
        [loseAlert show];
        //[self startGame];

    } else {

        [self refreshCharacterStats];
    }
}


- (IBAction)restartButtonPressed:(UIBarButtonItem *)sender
{
    
    //    [self.hero getsHit:2];
    //    NSLog(@"Ouch! Your hero, %@, just got hurt and health is now %i", self.hero.name, self.hero.health);
    [self startGame];
}



#pragma mark - helper methods

-(void)startGame
{
    
    if (self.hero != nil) {
        self.hero = nil;
    }
    
    if (self.tiles != nil) {
        self.tiles = nil;
    }

    
    // Create tiles and hero from factory
    AMFactory *tileMaker = [[AMFactory alloc] init];
    self.tiles = [tileMaker makeTileGridX:4 byY:3];
    self.hero = [tileMaker hero];

    
    // Load hero stats
    [self refreshCharacterStats];
    
    // Update view for hero's location
    [self loadTileWithCoordinates:self.hero.currentLocation];
    [self toggleDirectionButtonsVisibilityForCoordinate:self.hero.currentLocation];

}


-(void)updateCharacterWithArmor:(AMArmor*)armor withWeapon:(AMWeapon*)weapon andHealthEffect:(int)effect
{
    if (armor != nil) {
        
        self.hero.armorOn = armor;
    }
    if (weapon != nil) {
        
        self.hero.weaponArmed = weapon;
    }
    if (effect != 0) {
        
        self.hero.health = self.hero.health + effect;
        
    }
    
    
}

-(void)refreshCharacterStats
{
    self.healthNumber.text = [NSString stringWithFormat:@"%i", self.hero.health];
    self.damageNumber.text = [NSString stringWithFormat:@"%i", self.hero.damage];
    self.armorLabel.text = self.hero.armorOn.type;
    self.weaponLabel.text = self.hero.weaponArmed.type;

}


// I thought this would be a good idea... to combine method calls that go together all the time, but maybe it doesn't make sense to do o since they CAN be called only one at a time....
//-(void)updateViewForCoordinates:(CGPoint)coordinate
//{
//    [self loadTileWithCoordinates:coordinate];
//    [self toggleDirectionButtonsVisibilityForCoordinate:coordinate];
//}




- (void)loadTileWithCoordinates:(CGPoint)coordinate
{
    AMTile *newTile = [[self.tiles objectAtIndex:coordinate.x] objectAtIndex:coordinate.y];
    self.storyLabel.text = newTile.story;
    self.backgroundImage.image = newTile.image;
    [self.actionButton setTitle:newTile.actionButtonName forState:UIControlStateNormal];
    
}



-(void)toggleDirectionButtonsVisibilityForCoordinate:(CGPoint)coordinate
{

    // Default to all visible
    self.rightButton.hidden = FALSE;
    self.leftButton.hidden = FALSE;
    self.downButton.hidden = FALSE;
    self.upButton.hidden = FALSE;

    // adjust button visibility
    if (coordinate.x == 0) {
        
        self.leftButton.hidden = TRUE;
        
    } else if (coordinate.x == [self.tiles count] - 1) {
        
        self.rightButton.hidden = TRUE;
        
    }
    
    if (coordinate.y == 0) {
        
        self.downButton.hidden = TRUE;
        
    } else if (coordinate.y == [[self.tiles objectAtIndex:coordinate.x] count] - 1) {
        
        self.upButton.hidden = TRUE;
        
    }
}



#pragma mark - unused method

-(BOOL)tileExistsAtPoint:(CGPoint)point
{
    if (point.x >= 0 && point.x < [self.tiles count] && point.y >= 0 && point.y < [[self.tiles objectAtIndex:point.x] count]) {
        return YES;
    } else {
        return NO;
    }
}

@end

