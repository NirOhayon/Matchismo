//
//  Deck.m
//  Matchismo
//
//  Created by niroohayon  on 09/03/13.
//  Copyright (c) 2013 niroohayon . All rights reserved.
//

#import "Deck.h"

@interface Deck ()

//here i'm declaring a private property of a deck since i want the deck to be private
@property (strong, nonatomic) NSMutableArray *deck;

@end


@implementation Deck

//here im implementing the getter of the deck, making sure I won't point to an empty array
-(NSMutableArray *) deck {
    
    if (!_deck) _deck = [[NSMutableArray alloc] init];
    
    return _deck;
}

//here i'm implementing the add card method to add new card to the deck
-(void) addCard:(Card *)card atTop:(BOOL)atTop {
    
    if (atTop) {
        [self.deck insertObject:card atIndex:0];
    }
    else {
        [self.deck addObject:card];
    }
        
}

//here i'm implementing a method to return a random card from the deck
-(Card *) drawRandonCard {
    
    Card *randomCard;
    
    unsigned int index = arc4random() % self.deck.count;
    
    randomCard = self.deck[index];

    [self.deck removeObjectAtIndex:index];

    return randomCard;
}

@end
