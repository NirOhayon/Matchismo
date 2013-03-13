//
//  Deck.h
//  Matchismo
//
//  Created by niroohayon  on 09/03/13.
//  Copyright (c) 2013 niroohayon . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard:(Card *) card atTop:(BOOL) atTop;

-(Card *) drawRandonCard;


@end
