//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by niroohayon  on 10/03/13.
//  Copyright (c) 2013 niroohayon . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (readonly, nonatomic) int score;
@property (readonly, nonatomic) NSString *notification;






//--------------Methods---------------//

-(void)flipCardAtIndex:(NSUInteger)index;

-(Card *) cardAtIndex:(NSUInteger)index;

-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

//-(void)threeCardGame;




@end
