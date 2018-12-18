//
//  DVMPokemon.m
//  PokemonC
//
//  Created by Greg Hughes on 12/18/18.
//  Copyright © 2018 Jayden Garrick. All rights reserved.
//

#import "DVMPokemon.h"

@implementation DVMPokemon


// MARK: - Initialization

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    
    if (self) {
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    
    return self;
}



- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    //    let name = dictionary[name] as! String
    NSInteger identifier = [dictionary[@"id"] integerValue];
    
    NSArray *abilitiesDictionary = dictionary[@"abilities"];
    
//    Create an empty array to put ability names into vv
    NSMutableArray<NSString *> *abilities = [NSMutableArray new];
    
    
    NSString *imageUrlString = dictionary[@"sprites"][@"front_default"];
    _imageUrlAsString = imageUrlString;
    
    
    
//    imageUrlAsString
    
//    loop through and get the name and put it in the array abover
    for (NSDictionary* dictionary in abilitiesDictionary){
        
        NSString *abilityName = dictionary[@"ability"][@"name"];
        
        //accessing ability dictionary and the name property
        
        [abilities addObject:abilityName];
        
        
    }
    
    return [self initWithName:name identifier: identifier abilities:abilities];
    
}














@end
