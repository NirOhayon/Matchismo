//
//  CardGameViewController.m
//  Matchismo
//
//  Created by niroohayon  on 09/03/13.
//  Copyright (c) 2013 niroohayon . All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardsDeck.h"
#import "CardMatchingGame.h"


@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *notificationLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreCounter;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (strong, nonatomic) CardMatchingGame *game;
@property (nonatomic) int flipsCount;

@end


@implementation CardGameViewController

//creating the getter method that creates a new card game.
-(CardMatchingGame *) game {
    
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardsDeck alloc] init]];
    return _game;
}

//creating a setter for the IBOutletCollection cardButtons
-(void) setCardButtons:(NSArray *)cardButtons {
    
    _cardButtons = cardButtons;
   [self updateUI];
}


//creating the setter for the flipCount property. Whick is setting the flipsLabel to the right text and adding the number of counts.
-(void) setFlipsCount:(int)flipsCount {
    
    _flipsCount = flipsCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipsCount];
    
}


-(void) updateUI {
    
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.unplayble;
        if (card.unplayble) {
            cardButton.alpha = 0.1;
        }
        
        //updating the score 
        self.scoreCounter.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        
        //if notification in CardMatchingGame.m is no nil, it will be presented 
        if (self.game.notification) {
        
        self.notificationLabel.text = self.game.notification;
    
        }
    }
}

//Here I created a method to flipCards when the card is selected, and give the user a random card from the deck each time he flips the card. After each flip i'm incrementing the flipCount setter by one.
- (IBAction)flipCard:(UIButton *)sender {
    
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipsCount++;
    [self updateUI];
}

//sending an alert if the user clicked on new game button
- (IBAction)newGame:(UIButton *)sender {
    
   UIAlertView* mes=[[UIAlertView alloc] initWithTitle:@"Are you sure..?" message:@"This will start a new game" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    
    [mes show];

}

//preforming an action according to the user choice for the alert yes/no to start a new game
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex != [alertView cancelButtonIndex]) {
        
        self.flipsCount = 0;
        self.game = nil;
        for (UIButton *button in self.cardButtons) {
            Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:button]];
            card.unplayble = NO;
            card.faceUp = NO;
            button.alpha = 1;
        }
        
        self.notificationLabel.text = nil;
        [self updateUI];
        
    }

}

- (IBAction)threeCardsMode:(UISwitch *)sender {
    
    if (sender.isOn) {
        
        
    }
}

@end