//
//  PlayingCardsDeck.m
//  Matchismo
//
//  Created by niroohayon  on 10/03/13.
//  Copyright (c) 2013 niroohayon . All rights reserved.
//

#import "PlayingCardsDeck.h"
#import "PlayingCards.h"

@implementation PlayingCardsDeck

-(id) init {
    
    self = [super init];
    
    if (self) {
        
        for (NSString *suit in [PlayingCards validSuit]) {
            for (NSUInteger rank = 1;rank <= [PlayingCards maxRank]; rank++) {
                
                PlayingCards *card = [[PlayingCards alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card atTop:YES];
                
            }
        }
        
    }
    
    return self;
}

@end
