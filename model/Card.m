//
//  Card.m
//  Matchismo
//
//  Created by niroohayon  on 09/03/13.
//  Copyright (c) 2013 niroohayon . All rights reserved.
//

#import "Card.h"

@implementation Card


-(int) match:(NSArray *)cardToMatch {
    
    int result = 0;
    
    for (Card *aCard in cardToMatch) {
    
    if ([self.contents isEqualToString:aCard.contents])
        result = 1;
    else
        result = 0;
        
    }
    
    return result;
}


@end
