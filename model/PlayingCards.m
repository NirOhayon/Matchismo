//
//  PlayingCards.m
//  Matchismo
//
//  Created by niroohayon  on 09/03/13.
//  Copyright (c) 2013 niroohayon . All rights reserved.
//

#import "PlayingCards.h"


@implementation PlayingCards

@synthesize suit = _suit;

//overriding the :match method of cards to give different acore if its only a suit match or a number match
-(int)match:(NSArray *)cardToMatch {
    
    int score = 0;
    
    if (cardToMatch.count == 1) {
        PlayingCards *aCard = [cardToMatch lastObject];
        
        if ([aCard.suit isEqualToString: self.suit]) {
            score = 1;
        } else if (aCard.rank == self.rank) {
            score = 4;
        }
    
    }
    
    return score;

}
    
   

//modifying the contents getter so it will return array with the ranks and rank+suit 
-(NSString *) contents {
    
    NSArray *cardsRank = [PlayingCards rankStrings];
    
    return [cardsRank[self.rank] stringByAppendingString:self.suit];
}

//creating a method to make sure we get validated suits
+(NSArray *) validSuit {
    
    return @[@"♠",@"♣",@"♥",@"♦"];
}

//creating calss method to validate the rank
+(NSArray *) rankStrings {
    
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

//creating a new setter for suit to make sure we get the valitated suits, uding the validateSuit method
-(void) setSuit:(NSString *)suit {
    
    if ([[PlayingCards validSuit] containsObject:suit]) {
        _suit = suit;
    }
}

//creating new getter for suit to make sure its not empty
-(NSString *) suit {
    
    return _suit? _suit: @"?";
}

//creating a class method to make sure when user set the rank he will will
+(NSUInteger) maxRank {
    
    return [self rankStrings].count - 1;

}

//creating a new setter to the renk to make sure the rank is validates 
-(void) setRank:(NSUInteger)rank {
    
    if (rank <= [PlayingCards maxRank]) {
        
        _rank = rank;
    }
}


@end

