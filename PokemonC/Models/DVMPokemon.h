//
//  DVMPokemon.h
//  PokemonC
//
//  Created by Greg Hughes on 12/18/18.
//  Copyright © 2018 Jayden Garrick. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface DVMPokemon : NSObject

@property (nonatomic, strong) NSString *imageUrlAsString;

// MARK: - Properties
@property (nonatomic, copy, readonly) NSString *name;//name

@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray <NSString*> *abilities;
// let abilities: [String]

// MARK: - Initialization
- (instancetype)initWithName: (NSString *) name
                  identifier: (NSInteger) identifier
                   abilities: (NSArray <NSString*> *) abilities;

- (instancetype)initWithDictionary: (NSDictionary <NSString*, id> *)dictionary;
//NSDictionary <NSString*, id> = [String: Any]


@end

NS_ASSUME_NONNULL_END

