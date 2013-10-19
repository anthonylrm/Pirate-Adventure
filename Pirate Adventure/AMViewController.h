//
//  AMViewController.h
//  Pirate Adventure
//
//  Created by Anthony Matteo on 10/10/13.
//  Copyright (c) 2013 Anthony Matteo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMCharacter.h"

@interface AMViewController : UIViewController

// UI elements
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UILabel *healthNumber;
@property (strong, nonatomic) IBOutlet UILabel *damageNumber;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *upButton;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;
@property (strong, nonatomic) IBOutlet UIButton *downButton;
@property (strong, nonatomic) IBOutlet UIButton *leftButton;

// Game properties
// If we had a separate "Game" model it might make sense that it would "know" what the current tile is, i.e. have a current tile property, but in the absence of that, it seems like the hero should know where he is.
//@property (strong, nonatomic) AMTile *currentTile;
@property (strong, nonatomic) AMCharacter *hero;


// Other...
@property (strong, nonatomic) NSArray *tiles;

// UI Actions
- (IBAction)restartButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)directionButtonPressed:(UIButton *)sender;


// Other...
- (void)loadTileWithCoordinates:(CGPoint)coordinate;
@end
