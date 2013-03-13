//
//  PlayingCards.h
//  Matchismo
//
//  Created by niroohayon  on 09/03/13.
//  Copyright (c) 2013 niroohayon . All rights reserved.
//

#import "Card.h"

@interface PlayingCards : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *) validSuit;
+(NSUInteger) maxRank;


@end
