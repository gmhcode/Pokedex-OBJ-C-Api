//
//  DVMPokemonController.h
//  PokemonC
//
//  Created by Greg Hughes on 12/18/18.
//  Copyright © 2018 Jayden Garrick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVMPokemon.h"
#import <UIKit/UIKit.h>

@interface DVMPokemonController : NSObject


+ (void) fetchPokemonForSearchTerm: (NSString *) searchTerm
                        completion: (void (^) (DVMPokemon*))completion;


+ (void) fetchPokemonImage: (DVMPokemon *) pokemon
               completion: (void (^) (UIImage *)) completion;












@end


