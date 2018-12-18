//
//  DVMPokemonController.m
//  PokemonC
//
//  Created by Greg Hughes on 12/18/18.
//  Copyright © 2018 Jayden Garrick. All rights reserved.
//

#import "DVMPokemonController.h"
#import "DVMPokemon.h"
@implementation DVMPokemonController


+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(DVMPokemon *))completion
{
    //URL
    NSURL *baseUrl = [NSURL URLWithString:@"https://pokeapi.co/api/v2/pokemon/"];
    
    NSURL *searchUrl= [baseUrl URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    NSLog(@"%@", searchUrl.absoluteString);
    
   
    
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //        serialization
        if (error) {
            NSLog(@"There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (data == nil) {
            NSLog(@"❌Couldnt get data back in fetchPokemon");
            completion(nil);
            return;
        }
        
        //serialization code
        NSDictionary *pokemonDictionary = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingAllowFragments error: &error];
        
        DVMPokemon *pokemon = [[DVMPokemon alloc] initWithDictionary: pokemonDictionary];
        
        completion(pokemon);
        
    }]resume];
}



+(void) fetchPokemonImage:(DVMPokemon *)pokemon completion:(void (^)(UIImage *))completion
{
    
    
    
    NSURL *imageUrl = [[NSURL alloc] initWithString:pokemon.imageUrlAsString];
    
    
    
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (data == nil) {
            NSLog(@"cannot retrieve data");
        }
        
        
        
        
        
        UIImage *image = [[UIImage alloc] initWithData: data];
        completion(image);
        }]resume];
    
        
      }



@end
