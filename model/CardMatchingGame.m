//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by niroohayon  on 10/03/13.
//  Copyright (c) 2013 niroohayon . All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCardsDeck.h"

@interface CardMatchingGame()

@property (readwrite, nonatomic) int score;
@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) NSString *notification;
@end        


@implementation CardMatchingGame


-(NSMutableArray *) cards {
    
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    
    self = [super init];
    
    if (self) {
        
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandonCard];
            
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    return self;
}


-(Card *) cardAtIndex:(NSUInteger)index {
    
    return (index < self.cards.count) ? self.cards[index] : nil;
}


#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define BONUS 4

-(void) flipCardAtIndex:(NSUInteger)index {
    
    
    
    Card *card = [self cardAtIndex:index];
    
    if (!card.isUnplayable) {
        
        if (!card.isFaceUp) {
            
            for (Card *otherCard in self.cards) {
                
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    
                   int matchScore = [card match:@[otherCard]];
                    
                    if (matchScore) {
                        
                        otherCard.unplayble = YES;
                        card.unplayble = YES;
                        
                        self.notification = [NSString stringWithFormat:@"%@ & %@  match!", card.contents, otherCard.contents];
                    
                        self.score += matchScore * BONUS;
                    } else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        self.notification = [NSString stringWithFormat:@"%@ did not matched to %@", card.contents, otherCard.contents];
                    }
                    break;
                }
                
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
        
    }
}


@end
